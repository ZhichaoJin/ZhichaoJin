;; Auto-generated. Do not edit!


(when (boundp 'robot_pose_ekf_hdl::GetStatus)
  (if (not (find-package "ROBOT_POSE_EKF_HDL"))
    (make-package "ROBOT_POSE_EKF_HDL"))
  (shadow 'GetStatus (find-package "ROBOT_POSE_EKF_HDL")))
(unless (find-package "ROBOT_POSE_EKF_HDL::GETSTATUS")
  (make-package "ROBOT_POSE_EKF_HDL::GETSTATUS"))
(unless (find-package "ROBOT_POSE_EKF_HDL::GETSTATUSREQUEST")
  (make-package "ROBOT_POSE_EKF_HDL::GETSTATUSREQUEST"))
(unless (find-package "ROBOT_POSE_EKF_HDL::GETSTATUSRESPONSE")
  (make-package "ROBOT_POSE_EKF_HDL::GETSTATUSRESPONSE"))

(in-package "ROS")





(defclass robot_pose_ekf_hdl::GetStatusRequest
  :super ros::object
  :slots ())

(defmethod robot_pose_ekf_hdl::GetStatusRequest
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(defclass robot_pose_ekf_hdl::GetStatusResponse
  :super ros::object
  :slots (_status ))

(defmethod robot_pose_ekf_hdl::GetStatusResponse
  (:init
   (&key
    ((:status __status) "")
    )
   (send-super :init)
   (setq _status (string __status))
   self)
  (:status
   (&optional __status)
   (if __status (setq _status __status)) _status)
  (:serialization-length
   ()
   (+
    ;; string _status
    4 (length _status)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _status
       (write-long (length _status) s) (princ _status s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _status
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _status (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass robot_pose_ekf_hdl::GetStatus
  :super ros::object
  :slots ())

(setf (get robot_pose_ekf_hdl::GetStatus :md5sum-) "4fe5af303955c287688e7347e9b00278")
(setf (get robot_pose_ekf_hdl::GetStatus :datatype-) "robot_pose_ekf_hdl/GetStatus")
(setf (get robot_pose_ekf_hdl::GetStatus :request) robot_pose_ekf_hdl::GetStatusRequest)
(setf (get robot_pose_ekf_hdl::GetStatus :response) robot_pose_ekf_hdl::GetStatusResponse)

(defmethod robot_pose_ekf_hdl::GetStatusRequest
  (:response () (instance robot_pose_ekf_hdl::GetStatusResponse :init)))

(setf (get robot_pose_ekf_hdl::GetStatusRequest :md5sum-) "4fe5af303955c287688e7347e9b00278")
(setf (get robot_pose_ekf_hdl::GetStatusRequest :datatype-) "robot_pose_ekf_hdl/GetStatusRequest")
(setf (get robot_pose_ekf_hdl::GetStatusRequest :definition-)
      "
---
string status
")

(setf (get robot_pose_ekf_hdl::GetStatusResponse :md5sum-) "4fe5af303955c287688e7347e9b00278")
(setf (get robot_pose_ekf_hdl::GetStatusResponse :datatype-) "robot_pose_ekf_hdl/GetStatusResponse")
(setf (get robot_pose_ekf_hdl::GetStatusResponse :definition-)
      "
---
string status
")



(provide :robot_pose_ekf_hdl/GetStatus "4fe5af303955c287688e7347e9b00278")


