# generated from catkin/cmake/template/pkgConfig.cmake.in

# append elements to a list and remove existing duplicates from the list
# copied from catkin/cmake/list_append_deduplicate.cmake to keep pkgConfig
# self contained
macro(_list_append_deduplicate listname)
  if(NOT "${ARGN}" STREQUAL "")
    if(${listname})
      list(REMOVE_ITEM ${listname} ${ARGN})
    endif()
    list(APPEND ${listname} ${ARGN})
  endif()
endmacro()

# append elements to a list if they are not already in the list
# copied from catkin/cmake/list_append_unique.cmake to keep pkgConfig
# self contained
macro(_list_append_unique listname)
  foreach(_item ${ARGN})
    list(FIND ${listname} ${_item} _index)
    if(_index EQUAL -1)
      list(APPEND ${listname} ${_item})
    endif()
  endforeach()
endmacro()

# pack a list of libraries with optional build configuration keywords
# copied from catkin/cmake/catkin_libraries.cmake to keep pkgConfig
# self contained
macro(_pack_libraries_with_build_configuration VAR)
  set(${VAR} "")
  set(_argn ${ARGN})
  list(LENGTH _argn _count)
  set(_index 0)
  while(${_index} LESS ${_count})
    list(GET _argn ${_index} lib)
    if("${lib}" MATCHES "^(debug|optimized|general)$")
      math(EXPR _index "${_index} + 1")
      if(${_index} EQUAL ${_count})
        message(FATAL_ERROR "_pack_libraries_with_build_configuration() the list of libraries '${ARGN}' ends with '${lib}' which is a build configuration keyword and must be followed by a library")
      endif()
      list(GET _argn ${_index} library)
      list(APPEND ${VAR} "${lib}${CATKIN_BUILD_CONFIGURATION_KEYWORD_SEPARATOR}${library}")
    else()
      list(APPEND ${VAR} "${lib}")
    endif()
    math(EXPR _index "${_index} + 1")
  endwhile()
endmacro()

# unpack a list of libraries with optional build configuration keyword prefixes
# copied from catkin/cmake/catkin_libraries.cmake to keep pkgConfig
# self contained
macro(_unpack_libraries_with_build_configuration VAR)
  set(${VAR} "")
  foreach(lib ${ARGN})
    string(REGEX REPLACE "^(debug|optimized|general)${CATKIN_BUILD_CONFIGURATION_KEYWORD_SEPARATOR}(.+)$" "\\1;\\2" lib "${lib}")
    list(APPEND ${VAR} "${lib}")
  endforeach()
endmacro()


if(robot_pose_ekf_hdl_CONFIG_INCLUDED)
  return()
endif()
set(robot_pose_ekf_hdl_CONFIG_INCLUDED TRUE)

# set variables for source/devel/install prefixes
if("FALSE" STREQUAL "TRUE")
  set(robot_pose_ekf_hdl_SOURCE_PREFIX /home/jzc/robot_pose_ekf_ws/src/robot_pose_ekf)
  set(robot_pose_ekf_hdl_DEVEL_PREFIX /home/jzc/robot_pose_ekf_ws/devel)
  set(robot_pose_ekf_hdl_INSTALL_PREFIX "")
  set(robot_pose_ekf_hdl_PREFIX ${robot_pose_ekf_hdl_DEVEL_PREFIX})
else()
  set(robot_pose_ekf_hdl_SOURCE_PREFIX "")
  set(robot_pose_ekf_hdl_DEVEL_PREFIX "")
  set(robot_pose_ekf_hdl_INSTALL_PREFIX /home/jzc/robot_pose_ekf_ws/install)
  set(robot_pose_ekf_hdl_PREFIX ${robot_pose_ekf_hdl_INSTALL_PREFIX})
endif()

# warn when using a deprecated package
if(NOT "" STREQUAL "")
  set(_msg "WARNING: package 'robot_pose_ekf_hdl' is deprecated")
  # append custom deprecation text if available
  if(NOT "" STREQUAL "TRUE")
    set(_msg "${_msg} ()")
  endif()
  message("${_msg}")
endif()

# flag project as catkin-based to distinguish if a find_package()-ed project is a catkin project
set(robot_pose_ekf_hdl_FOUND_CATKIN_PROJECT TRUE)

if(NOT "include " STREQUAL " ")
  set(robot_pose_ekf_hdl_INCLUDE_DIRS "")
  set(_include_dirs "include")
  if(NOT " " STREQUAL " ")
    set(_report "Check the issue tracker '' and consider creating a ticket if the problem has not been reported yet.")
  elseif(NOT "http://wiki.ros.org/robot_pose_ekf " STREQUAL " ")
    set(_report "Check the website 'http://wiki.ros.org/robot_pose_ekf' for information and consider reporting the problem.")
  else()
    set(_report "Report the problem to the maintainer 'ROS Orphaned Package Maintainers <ros-orphaned-packages@googlegroups.com>' and request to fix the problem.")
  endif()
  foreach(idir ${_include_dirs})
    if(IS_ABSOLUTE ${idir} AND IS_DIRECTORY ${idir})
      set(include ${idir})
    elseif("${idir} " STREQUAL "include ")
      get_filename_component(include "${robot_pose_ekf_hdl_DIR}/../../../include" ABSOLUTE)
      if(NOT IS_DIRECTORY ${include})
        message(FATAL_ERROR "Project 'robot_pose_ekf_hdl' specifies '${idir}' as an include dir, which is not found.  It does not exist in '${include}'.  ${_report}")
      endif()
    else()
      message(FATAL_ERROR "Project 'robot_pose_ekf_hdl' specifies '${idir}' as an include dir, which is not found.  It does neither exist as an absolute directory nor in '\${prefix}/${idir}'.  ${_report}")
    endif()
    _list_append_unique(robot_pose_ekf_hdl_INCLUDE_DIRS ${include})
  endforeach()
endif()

set(libraries "")
foreach(library ${libraries})
  # keep build configuration keywords, target names and absolute libraries as-is
  if("${library}" MATCHES "^(debug|optimized|general)$")
    list(APPEND robot_pose_ekf_hdl_LIBRARIES ${library})
  elseif(${library} MATCHES "^-l")
    list(APPEND robot_pose_ekf_hdl_LIBRARIES ${library})
  elseif(${library} MATCHES "^-")
    # This is a linker flag/option (like -pthread)
    # There's no standard variable for these, so create an interface library to hold it
    if(NOT robot_pose_ekf_hdl_NUM_DUMMY_TARGETS)
      set(robot_pose_ekf_hdl_NUM_DUMMY_TARGETS 0)
    endif()
    # Make sure the target name is unique
    set(interface_target_name "catkin::robot_pose_ekf_hdl::wrapped-linker-option${robot_pose_ekf_hdl_NUM_DUMMY_TARGETS}")
    while(TARGET "${interface_target_name}")
      math(EXPR robot_pose_ekf_hdl_NUM_DUMMY_TARGETS "${robot_pose_ekf_hdl_NUM_DUMMY_TARGETS}+1")
      set(interface_target_name "catkin::robot_pose_ekf_hdl::wrapped-linker-option${robot_pose_ekf_hdl_NUM_DUMMY_TARGETS}")
    endwhile()
    add_library("${interface_target_name}" INTERFACE IMPORTED)
    if("${CMAKE_VERSION}" VERSION_LESS "3.13.0")
      set_property(
        TARGET
        "${interface_target_name}"
        APPEND PROPERTY
        INTERFACE_LINK_LIBRARIES "${library}")
    else()
      target_link_options("${interface_target_name}" INTERFACE "${library}")
    endif()
    list(APPEND robot_pose_ekf_hdl_LIBRARIES "${interface_target_name}")
  elseif(TARGET ${library})
    list(APPEND robot_pose_ekf_hdl_LIBRARIES ${library})
  elseif(IS_ABSOLUTE ${library})
    list(APPEND robot_pose_ekf_hdl_LIBRARIES ${library})
  else()
    set(lib_path "")
    set(lib "${library}-NOTFOUND")
    # since the path where the library is found is returned we have to iterate over the paths manually
    foreach(path /home/jzc/robot_pose_ekf_ws/install/lib;/home/jzc/robot_pose_ekf_ws/devel/lib;/home/jzc/lidar_ws/devel/lib;/home/jzc/IMU_ws/devel/lib;/home/jzc/autoware.ai/install/ymc/lib;/home/jzc/autoware.ai/install/xsens_driver/lib;/home/jzc/autoware.ai/install/wf_simulator/lib;/home/jzc/autoware.ai/install/lattice_planner/lib;/home/jzc/autoware.ai/install/waypoint_planner/lib;/home/jzc/autoware.ai/install/waypoint_maker/lib;/home/jzc/autoware.ai/install/way_planner/lib;/home/jzc/autoware.ai/install/vlg22c_cam/lib;/home/jzc/autoware.ai/install/vision_ssd_detect/lib;/home/jzc/autoware.ai/install/vision_segment_enet_detect/lib;/home/jzc/autoware.ai/install/vision_lane_detect/lib;/home/jzc/autoware.ai/install/vision_darknet_detect/lib;/home/jzc/autoware.ai/install/vision_beyond_track/lib;/home/jzc/autoware.ai/install/vel_pose_diff_checker/lib;/home/jzc/autoware.ai/install/vehicle_socket/lib;/home/jzc/autoware.ai/install/vehicle_sim_model/lib;/home/jzc/autoware.ai/install/vehicle_model/lib;/home/jzc/autoware.ai/install/vehicle_gazebo_simulation_launcher/lib;/home/jzc/autoware.ai/install/vehicle_gazebo_simulation_interface/lib;/home/jzc/autoware.ai/install/vehicle_engage_panel/lib;/home/jzc/autoware.ai/install/vehicle_description/lib;/home/jzc/autoware.ai/install/op_utilities/lib;/home/jzc/autoware.ai/install/op_simulation_package/lib;/home/jzc/autoware.ai/install/op_local_planner/lib;/home/jzc/autoware.ai/install/op_global_planner/lib;/home/jzc/autoware.ai/install/lidar_kf_contour_track/lib;/home/jzc/autoware.ai/install/op_ros_helpers/lib;/home/jzc/autoware.ai/install/ff_waypoint_follower/lib;/home/jzc/autoware.ai/install/dp_planner/lib;/home/jzc/autoware.ai/install/op_simu/lib;/home/jzc/autoware.ai/install/op_planner/lib;/home/jzc/autoware.ai/install/op_utility/lib;/home/jzc/autoware.ai/install/lidar_euclidean_cluster_detect/lib;/home/jzc/autoware.ai/install/vector_map_server/lib;/home/jzc/autoware.ai/install/road_occupancy_processor/lib;/home/jzc/autoware.ai/install/costmap_generator/lib;/home/jzc/autoware.ai/install/object_map/lib;/home/jzc/autoware.ai/install/naive_motion_predict/lib;/home/jzc/autoware.ai/install/lanelet_aisan_converter/lib;/home/jzc/autoware.ai/install/map_file/lib;/home/jzc/autoware.ai/install/libvectormap/lib;/home/jzc/autoware.ai/install/lane_planner/lib;/home/jzc/autoware.ai/install/imm_ukf_pda_track/lib;/home/jzc/autoware.ai/install/decision_maker/lib;/home/jzc/autoware.ai/install/vector_map/lib;/home/jzc/autoware.ai/install/vector_map_msgs/lib;/home/jzc/autoware.ai/install/vectacam/lib;/home/jzc/autoware.ai/install/udon_socket/lib;/home/jzc/autoware.ai/install/twist_generator/lib;/home/jzc/autoware.ai/install/twist_gate/lib;/home/jzc/autoware.ai/install/twist_filter/lib;/home/jzc/autoware.ai/install/twist2odom/lib;/home/jzc/autoware.ai/install/tablet_socket/lib;/home/jzc/autoware.ai/install/runtime_manager/lib;/home/jzc/autoware.ai/install/mqtt_socket/lib;/home/jzc/autoware.ai/install/tablet_socket_msgs/lib;/home/jzc/autoware.ai/install/state_machine_lib/lib;/home/jzc/autoware.ai/install/sound_player/lib;/home/jzc/autoware.ai/install/sick_lms5xx/lib;/home/jzc/autoware.ai/install/sick_ldmrs_tools/lib;/home/jzc/autoware.ai/install/sick_ldmrs_driver/lib;/home/jzc/autoware.ai/install/sick_ldmrs_msgs/lib;/home/jzc/autoware.ai/install/sick_ldmrs_description/lib;/home/jzc/autoware.ai/install/points2image/lib;/home/jzc/autoware.ai/install/rosinterface/lib;/home/jzc/autoware.ai/install/rosbag_controller/lib;/home/jzc/autoware.ai/install/pure_pursuit/lib;/home/jzc/autoware.ai/install/points_preprocessor/lib;/home/jzc/autoware.ai/install/mpc_follower/lib;/home/jzc/autoware.ai/install/lidar_localizer/lib;/home/jzc/autoware.ai/install/emergency_handler/lib;/home/jzc/autoware.ai/install/autoware_health_checker/lib;/home/jzc/autoware.ai/install/as/lib;/home/jzc/autoware.ai/install/ros_observer/lib;/home/jzc/autoware.ai/install/roi_object_filter/lib;/home/jzc/autoware.ai/install/range_vision_fusion/lib;/home/jzc/autoware.ai/install/pos_db/lib;/home/jzc/autoware.ai/install/points_downsampler/lib;/home/jzc/autoware.ai/install/pixel_cloud_fusion/lib;/home/jzc/autoware.ai/install/pcl_omp_registration/lib;/home/jzc/autoware.ai/install/pc2_downsampler/lib;/home/jzc/autoware.ai/install/oculus_socket/lib;/home/jzc/autoware.ai/install/obj_db/lib;/home/jzc/autoware.ai/install/nmea_navsat/lib;/home/jzc/autoware.ai/install/ndt_tku/lib;/home/jzc/autoware.ai/install/ndt_cpu/lib;/home/jzc/autoware.ai/install/multi_lidar_calibrator/lib;/home/jzc/autoware.ai/install/microstrain_driver/lib;/home/jzc/autoware.ai/install/memsic_imu/lib;/home/jzc/autoware.ai/install/marker_downsampler/lib;/home/jzc/autoware.ai/install/map_tools/lib;/home/jzc/autoware.ai/install/map_tf_generator/lib;/home/jzc/autoware.ai/install/log_tools/lib;/home/jzc/autoware.ai/install/lidar_shape_estimation/lib;/home/jzc/autoware.ai/install/lidar_point_pillars/lib;/home/jzc/autoware.ai/install/lidar_naive_l_shape_detect/lib;/home/jzc/autoware.ai/install/lidar_fake_perception/lib;/home/jzc/autoware.ai/install/lidar_apollo_cnn_seg_detect/lib;/home/jzc/autoware.ai/install/libwaypoint_follower/lib;/home/jzc/autoware.ai/install/lgsvl_simulator_bridge/lib;/home/jzc/autoware.ai/install/lanelet2_extension/lib;/home/jzc/autoware.ai/install/kvaser/lib;/home/jzc/autoware.ai/install/kitti_launch/lib;/home/jzc/autoware.ai/install/kitti_player/lib;/home/jzc/autoware.ai/install/kitti_box_publisher/lib;/home/jzc/autoware.ai/install/javad_navsat_driver/lib;/home/jzc/autoware.ai/install/integrated_viewer/lib;/home/jzc/autoware.ai/install/image_processor/lib;/home/jzc/autoware.ai/install/hokuyo/lib;/home/jzc/autoware.ai/install/graph_tools/lib;/home/jzc/autoware.ai/install/gnss_localizer/lib;/home/jzc/autoware.ai/install/gnss/lib;/home/jzc/autoware.ai/install/glviewer/lib;/home/jzc/autoware.ai/install/gazebo_world_description/lib;/home/jzc/autoware.ai/install/gazebo_imu_description/lib;/home/jzc/autoware.ai/install/gazebo_camera_description/lib;/home/jzc/autoware.ai/install/garmin/lib;/home/jzc/autoware.ai/install/freespace_planner/lib;/home/jzc/autoware.ai/install/fastvirtualscan/lib;/home/jzc/autoware.ai/install/ekf_localizer/lib;/home/jzc/autoware.ai/install/ds4_msgs/lib;/home/jzc/autoware.ai/install/ds4_driver/lib;/home/jzc/autoware.ai/install/detected_objects_visualizer/lib;/home/jzc/autoware.ai/install/decision_maker_panel/lib;/home/jzc/autoware.ai/install/data_preprocessor/lib;/home/jzc/autoware.ai/install/custom_msgs/lib;/home/jzc/autoware.ai/install/carla_autoware_bridge/lib;/home/jzc/autoware.ai/install/calibration_publisher/lib;/home/jzc/autoware.ai/install/autoware_system_msgs/lib;/home/jzc/autoware.ai/install/autoware_rviz_plugins/lib;/home/jzc/autoware.ai/install/autoware_quickstart_examples/lib;/home/jzc/autoware.ai/install/autoware_pointgrey_drivers/lib;/home/jzc/autoware.ai/install/autoware_driveworks_interface/lib;/home/jzc/autoware.ai/install/autoware_connector/lib;/home/jzc/autoware.ai/install/autoware_camera_lidar_calibrator/lib;/home/jzc/autoware.ai/install/astar_search/lib;/home/jzc/autoware.ai/install/amathutils_lib/lib;/home/jzc/autoware.ai/install/autoware_msgs/lib;/home/jzc/autoware.ai/install/autoware_map_msgs/lib;/home/jzc/autoware.ai/install/autoware_launcher_rviz/lib;/home/jzc/autoware.ai/install/autoware_launcher/lib;/home/jzc/autoware.ai/install/autoware_lanelet2_msgs/lib;/home/jzc/autoware.ai/install/autoware_external_msgs/lib;/home/jzc/autoware.ai/install/autoware_driveworks_gmsl_interface/lib;/home/jzc/autoware.ai/install/autoware_config_msgs/lib;/home/jzc/autoware.ai/install/autoware_can_msgs/lib;/home/jzc/autoware.ai/install/autoware_build_flags/lib;/home/jzc/autoware.ai/install/autoware_bag_tools/lib;/home/jzc/autoware.ai/install/adi_driver/lib;/home/jzc/DLO_ws/devel/lib;/home/jzc/srv_ws/devel/lib;/home/jzc/Auto_ws/devel/lib;/home/jzc/hdl_slam_ws/devel/lib;/home/jzc/hdl_ws/devel/lib;/opt/ros/melodic/lib)
      find_library(lib ${library}
        PATHS ${path}
        NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH)
      if(lib)
        set(lib_path ${path})
        break()
      endif()
    endforeach()
    if(lib)
      _list_append_unique(robot_pose_ekf_hdl_LIBRARY_DIRS ${lib_path})
      list(APPEND robot_pose_ekf_hdl_LIBRARIES ${lib})
    else()
      # as a fall back for non-catkin libraries try to search globally
      find_library(lib ${library})
      if(NOT lib)
        message(FATAL_ERROR "Project '${PROJECT_NAME}' tried to find library '${library}'.  The library is neither a target nor built/installed properly.  Did you compile project 'robot_pose_ekf_hdl'?  Did you find_package() it before the subdirectory containing its code is included?")
      endif()
      list(APPEND robot_pose_ekf_hdl_LIBRARIES ${lib})
    endif()
  endif()
endforeach()

set(robot_pose_ekf_hdl_EXPORTED_TARGETS "robot_pose_ekf_hdl_generate_messages_cpp;robot_pose_ekf_hdl_generate_messages_eus;robot_pose_ekf_hdl_generate_messages_lisp;robot_pose_ekf_hdl_generate_messages_nodejs;robot_pose_ekf_hdl_generate_messages_py")
# create dummy targets for exported code generation targets to make life of users easier
foreach(t ${robot_pose_ekf_hdl_EXPORTED_TARGETS})
  if(NOT TARGET ${t})
    add_custom_target(${t})
  endif()
endforeach()

set(depends "geometry_msgs;message_runtime;nav_msgs;roscpp;sensor_msgs;std_msgs")
foreach(depend ${depends})
  string(REPLACE " " ";" depend_list ${depend})
  # the package name of the dependency must be kept in a unique variable so that it is not overwritten in recursive calls
  list(GET depend_list 0 robot_pose_ekf_hdl_dep)
  list(LENGTH depend_list count)
  if(${count} EQUAL 1)
    # simple dependencies must only be find_package()-ed once
    if(NOT ${robot_pose_ekf_hdl_dep}_FOUND)
      find_package(${robot_pose_ekf_hdl_dep} REQUIRED NO_MODULE)
    endif()
  else()
    # dependencies with components must be find_package()-ed again
    list(REMOVE_AT depend_list 0)
    find_package(${robot_pose_ekf_hdl_dep} REQUIRED NO_MODULE ${depend_list})
  endif()
  _list_append_unique(robot_pose_ekf_hdl_INCLUDE_DIRS ${${robot_pose_ekf_hdl_dep}_INCLUDE_DIRS})

  # merge build configuration keywords with library names to correctly deduplicate
  _pack_libraries_with_build_configuration(robot_pose_ekf_hdl_LIBRARIES ${robot_pose_ekf_hdl_LIBRARIES})
  _pack_libraries_with_build_configuration(_libraries ${${robot_pose_ekf_hdl_dep}_LIBRARIES})
  _list_append_deduplicate(robot_pose_ekf_hdl_LIBRARIES ${_libraries})
  # undo build configuration keyword merging after deduplication
  _unpack_libraries_with_build_configuration(robot_pose_ekf_hdl_LIBRARIES ${robot_pose_ekf_hdl_LIBRARIES})

  _list_append_unique(robot_pose_ekf_hdl_LIBRARY_DIRS ${${robot_pose_ekf_hdl_dep}_LIBRARY_DIRS})
  list(APPEND robot_pose_ekf_hdl_EXPORTED_TARGETS ${${robot_pose_ekf_hdl_dep}_EXPORTED_TARGETS})
endforeach()

set(pkg_cfg_extras "robot_pose_ekf_hdl-msg-extras.cmake")
foreach(extra ${pkg_cfg_extras})
  if(NOT IS_ABSOLUTE ${extra})
    set(extra ${robot_pose_ekf_hdl_DIR}/${extra})
  endif()
  include(${extra})
endforeach()
