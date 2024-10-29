from launch import LaunchDescription
from launch.actions import ExecuteProcess, TimerAction, IncludeLaunchDescription
from launch.launch_description_sources import PythonLaunchDescriptionSource
from launch_ros.actions import Node
from ament_index_python import get_package_share_directory
import os

def generate_launch_description():
    # Get path of imu calibration configurations file
    megarover_pkg_share_path = get_package_share_directory("megarover_samples_ros2") 
    launch_dir = os.path.join(megarover_pkg_share_path, 'launch')
    
    return LaunchDescription([
        ExecuteProcess(
            cmd=['ros2', 'run', 'micro_ros_agent', 'micro_ros_agent', 'serial', '--dev', '/dev/ttyACM0', '-b', '2000000'],
            output='screen'
        ),
        
        TimerAction(
            period=3.0,
            actions=[
                Node(
                    package='imu',
                    executable='imu_bridge_node_script.py', 
                    name='imu_bridge_node',
                    output='screen'
                ),
            ]
        ),
        
        TimerAction(
            period=3.0,
            actions=[
                Node(
                    package='imu',
                    executable='controller_node_script.py',
                    name='controller_node',
                    output='screen'
                ),
            ]
        ),
        
        IncludeLaunchDescription(
            PythonLaunchDescriptionSource(
                os.path.join(launch_dir, 'vmegarover_with_sample_world.launch.py')
            )
        ),
    ])
