#!/usr/bin/python3

import rclpy
from rclpy.node import Node
from rclpy.qos import QoSProfile, ReliabilityPolicy
from sensor_msgs.msg import Imu
from geometry_msgs.msg import Twist
from math import atan2, sqrt
import numpy as np

class ComplementaryFilter:
    def __init__(self, dt):
        # Time step
        self.dt = dt
        
        # Alpha
        # self.alpha = (1.5*dt) / ((1.5*dt) + dt) # a = tau / (tau+dt) let tau = dt
        self.alpha = 0.98 # a = tau / (tau+dt) let tau = dt
        
        self.acc = np.array([0.0, 0.0])
        self.gyro = np.array([0.0, 0.0])
        
        self.roll = 0.0
        self.pitch = 0.0
    
    def compute(self, acc: list, gyro: list):
        # get roll and pitch from acc and gyro
        self.acc = np.array(acc)
        self.gyro = np.array(gyro)

        # Apply complementary filter
        self.roll = ((1-self.alpha) * (self.roll + self.gyro[0])) + (self.alpha * self.acc[0])
        self.pitch = ((1-self.alpha) * (self.pitch + self.gyro[1])) + (self.alpha * self.acc[1])
        
class imu_data:
    def __init__(self):
        # Gyro angular velocity
        self.G_vel_x = 0.0
        self.G_vel_y = 0.0
        self.G_vel_z = 0.0
        # Accelerometer acceleration
        self.A_acc_x = 0.0
        self.A_acc_y = 0.0
        self.A_acc_z = 0.0
        # Position from gyro and accelerometer
        self.G_roll = 0.0
        self.G_pitch = 0.0  
        self.A_roll = 0.0
        self.A_pitch = 0.0
    
    def compute_raw_theta(self, dt):
        self.G_roll += (self.G_vel_x * dt)
        self.G_pitch += (self.G_vel_y * dt)
        self.A_roll = atan2(self.A_acc_y, self.A_acc_z)
        self.A_pitch = atan2(-self.A_acc_x, sqrt(self.A_acc_y**2 + self.A_acc_z**2))
    
class ControllerNode(Node):
    def __init__(self):
        super().__init__('controller_node')

        # Init parameters
        self.declare_parameter('rate', 100)
        self.rate = self.get_parameter('rate').value
        
        # Init ROS2 objects
        # Create timer
        self.create_timer(1/self.rate, self.timer_callback)
        
        # Create imu subscription
        qos_profile = QoSProfile(
            reliability = ReliabilityPolicy.BEST_EFFORT,
            depth = 10
        )
        self.create_subscription(Imu, 'imu', self.imu_callback, qos_profile)
        
        # Create cmd_vel publisher
        self.cmdvel_pub = self.create_publisher(Twist, "cmd_vel", 10)
        
        # Init variables
        self.sensorfusion = ComplementaryFilter(1/self.rate)
        self.imu_ = imu_data()
        self.gyro_ang = []   # x and y
        self.acc_lin = []    # x and y
        self.gyro_theta = [] # roll and pitch axis angle
        self.acc_theta = []  # roll and pitch axis angle
        
        # Startup
        self.get_logger().info("Controller node has been started")
        
    def timer_callback(self):
        try:
            self.imu_.compute_raw_theta(1/self.rate)
            self.sensorfusion.compute([self.imu_.A_roll, self.imu_.A_pitch], [self.imu_.G_roll, self.imu_.G_pitch])
        except Exception as e:
            self.get_logger().error(f"timer calllback has {e}")
        self.get_logger().info(f"roll theta(sensor fusion): {self.sensorfusion.roll}")
        self.get_logger().info(f"pitch theta((sensor fusion)): {self.sensorfusion.pitch}")
        self.angletocmd()
    
    def angletocmd(self):
        msg = Twist()
        msg.linear.x = self.sensorfusion.roll
        msg.angular.z = self.sensorfusion.pitch
        self.cmdvel_pub.publish(msg)
    
    def imu_callback(self, msg: Imu):    
        self.imu_.G_vel_x = msg.angular_velocity.x
        self.imu_.G_vel_y = msg.angular_velocity.y
        self.imu_.G_vel_z = msg.angular_velocity.z
        self.imu_.A_acc_x = msg.linear_acceleration.x
        self.imu_.A_acc_y = msg.linear_acceleration.y        
        self.imu_.A_acc_z = msg.linear_acceleration.z
    
def main(args=None):
    rclpy.init(args=args)
    node = ControllerNode()
    rclpy.spin(node)
    node.destroy_node()
    rclpy.shutdown()

if __name__=='__main__':
    main()
