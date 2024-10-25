#!/usr/bin/python3

import rclpy
from rclpy.node import Node
from rclpy.qos import QoSProfile, ReliabilityPolicy
from ament_index_python import get_package_share_directory
from sensor_msgs.msg import Imu
import os
import numpy as np
import yaml

class ImuCalibrationNode(Node):
    def __init__(self):
        super().__init__('imu_calibration_node')
        
        # Define configurations
        pkg_name = 'imu'

        # Init parameters
        self.declare_parameter('file', 'imu_calibration.yaml')
        file = self.get_parameter('file').value
        
        # Get path of imu calibration configurations file
        imu_calib_pkg_share_path = get_package_share_directory(pkg_name) 
        ws_path, _ = imu_calib_pkg_share_path.split('install')
        self.imu_calib_path = os.path.join(ws_path, 'src', pkg_name, 'config', file)
        
        # Init ROS2 objects
        # Create imu subscription
        qos_profile = QoSProfile(
            reliability = ReliabilityPolicy.BEST_EFFORT,
            depth = 10
        )
        self.create_subscription(Imu, 'imu', self.imu_callback, qos_profile)
        
        # Init variables
        self.n = 0  # numbers of imu values
        self.n_max = 10000 # max number of imu values
        self.acc_list = [] # accelerometer values list
        self.gyro_list = [] # gyro values list
        
        # Startup
        self.get_logger().info("imu calibration node has been started")
        self.get_logger().info(f"calibration file is save at: {self.imu_calib_path}")
        
    # imu subscription callback
    def imu_callback(self, msg: Imu):
        if(self.n < self.n_max):
            self.n += 1
            self.acc_list.append([
                msg.linear_acceleration.x,
                msg.linear_acceleration.y,
                msg.linear_acceleration.z - 9.81 # Minus G from z axis
            ])
            self.gyro_list.append([
                msg.angular_velocity.x,
                msg.angular_velocity.y,
                msg.angular_velocity.z
            ])
            print("Collecting data: " + str(self.n))
        else:
            acc_array = np.array(self.acc_list)
            acc_offset = np.mean(acc_array, 0)
            acc_cov = np.absolute(np.cov(acc_array.T))

            gyro_array = np.array(self.gyro_list)
            gyro_offset = np.mean(gyro_array, 0)
            gyro_cov = np.absolute(np.cov(gyro_array.T))
            
            self.save_calibration(acc_offset, acc_cov, 'acc')
            self.save_calibration(gyro_offset, gyro_cov, 'gyro')
            
            print("===============")
            print(acc_offset)
            print(acc_cov)
            print("===============")
            print(gyro_offset)
            print(gyro_cov)
            exit()
            
    # Save calibration configurations
    def save_calibration(self, mean, cov, name: str):
        # open yaml file
        with open(self.imu_calib_path, 'r') as file:
            value = yaml.safe_load(file) or {}
        
        # Change mean & cov to list variables
        mean_list = mean.tolist()
        cov_list = cov.tolist()
        
        # Add values to yaml file
        value[f'{name} offset'] = mean_list
        value[f'{name} covariance'] = cov_list
        
        with open(self.imu_calib_path, 'w') as file:
            yaml.dump(value, file)
        
def main(args=None):
    rclpy.init(args=args)
    node = ImuCalibrationNode()
    rclpy.spin(node)
    node.destroy_node()
    rclpy.shutdown()

if __name__=='__main__':
    main()
