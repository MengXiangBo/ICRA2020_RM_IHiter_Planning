;; Auto-generated. Do not edit!


(when (boundp 'roborts_msgs::ShootCmd)
  (if (not (find-package "ROBORTS_MSGS"))
    (make-package "ROBORTS_MSGS"))
  (shadow 'ShootCmd (find-package "ROBORTS_MSGS")))
(unless (find-package "ROBORTS_MSGS::SHOOTCMD")
  (make-package "ROBORTS_MSGS::SHOOTCMD"))
(unless (find-package "ROBORTS_MSGS::SHOOTCMDREQUEST")
  (make-package "ROBORTS_MSGS::SHOOTCMDREQUEST"))
(unless (find-package "ROBORTS_MSGS::SHOOTCMDRESPONSE")
  (make-package "ROBORTS_MSGS::SHOOTCMDRESPONSE"))

(in-package "ROS")





(intern "*STOP*" (find-package "ROBORTS_MSGS::SHOOTCMDREQUEST"))
(shadow '*STOP* (find-package "ROBORTS_MSGS::SHOOTCMDREQUEST"))
(defconstant roborts_msgs::ShootCmdRequest::*STOP* 0)
(intern "*ONCE*" (find-package "ROBORTS_MSGS::SHOOTCMDREQUEST"))
(shadow '*ONCE* (find-package "ROBORTS_MSGS::SHOOTCMDREQUEST"))
(defconstant roborts_msgs::ShootCmdRequest::*ONCE* 1)
(intern "*CONTINUOUS*" (find-package "ROBORTS_MSGS::SHOOTCMDREQUEST"))
(shadow '*CONTINUOUS* (find-package "ROBORTS_MSGS::SHOOTCMDREQUEST"))
(defconstant roborts_msgs::ShootCmdRequest::*CONTINUOUS* 2)
(defclass roborts_msgs::ShootCmdRequest
  :super ros::object
  :slots (_mode _number ))

(defmethod roborts_msgs::ShootCmdRequest
  (:init
   (&key
    ((:mode __mode) 0)
    ((:number __number) 0)
    )
   (send-super :init)
   (setq _mode (round __mode))
   (setq _number (round __number))
   self)
  (:mode
   (&optional __mode)
   (if __mode (setq _mode __mode)) _mode)
  (:number
   (&optional __number)
   (if __number (setq _number __number)) _number)
  (:serialization-length
   ()
   (+
    ;; uint8 _mode
    1
    ;; uint8 _number
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _mode
       (write-byte _mode s)
     ;; uint8 _number
       (write-byte _number s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _mode
     (setq _mode (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _number
     (setq _number (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(defclass roborts_msgs::ShootCmdResponse
  :super ros::object
  :slots (_received ))

(defmethod roborts_msgs::ShootCmdResponse
  (:init
   (&key
    ((:received __received) nil)
    )
   (send-super :init)
   (setq _received __received)
   self)
  (:received
   (&optional __received)
   (if __received (setq _received __received)) _received)
  (:serialization-length
   ()
   (+
    ;; bool _received
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _received
       (if _received (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _received
     (setq _received (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass roborts_msgs::ShootCmd
  :super ros::object
  :slots ())

(setf (get roborts_msgs::ShootCmd :md5sum-) "4a5bfc809f6670479f63201258fb4866")
(setf (get roborts_msgs::ShootCmd :datatype-) "roborts_msgs/ShootCmd")
(setf (get roborts_msgs::ShootCmd :request) roborts_msgs::ShootCmdRequest)
(setf (get roborts_msgs::ShootCmd :response) roborts_msgs::ShootCmdResponse)

(defmethod roborts_msgs::ShootCmdRequest
  (:response () (instance roborts_msgs::ShootCmdResponse :init)))

(setf (get roborts_msgs::ShootCmdRequest :md5sum-) "4a5bfc809f6670479f63201258fb4866")
(setf (get roborts_msgs::ShootCmdRequest :datatype-) "roborts_msgs/ShootCmdRequest")
(setf (get roborts_msgs::ShootCmdRequest :definition-)
      "uint8 STOP = 0
uint8 ONCE = 1
uint8 CONTINUOUS = 2
uint8 mode
uint8 number
---
bool received

")

(setf (get roborts_msgs::ShootCmdResponse :md5sum-) "4a5bfc809f6670479f63201258fb4866")
(setf (get roborts_msgs::ShootCmdResponse :datatype-) "roborts_msgs/ShootCmdResponse")
(setf (get roborts_msgs::ShootCmdResponse :definition-)
      "uint8 STOP = 0
uint8 ONCE = 1
uint8 CONTINUOUS = 2
uint8 mode
uint8 number
---
bool received

")



(provide :roborts_msgs/ShootCmd "4a5bfc809f6670479f63201258fb4866")


