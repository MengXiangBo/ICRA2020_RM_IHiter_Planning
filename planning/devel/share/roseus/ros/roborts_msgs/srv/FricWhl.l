;; Auto-generated. Do not edit!


(when (boundp 'roborts_msgs::FricWhl)
  (if (not (find-package "ROBORTS_MSGS"))
    (make-package "ROBORTS_MSGS"))
  (shadow 'FricWhl (find-package "ROBORTS_MSGS")))
(unless (find-package "ROBORTS_MSGS::FRICWHL")
  (make-package "ROBORTS_MSGS::FRICWHL"))
(unless (find-package "ROBORTS_MSGS::FRICWHLREQUEST")
  (make-package "ROBORTS_MSGS::FRICWHLREQUEST"))
(unless (find-package "ROBORTS_MSGS::FRICWHLRESPONSE")
  (make-package "ROBORTS_MSGS::FRICWHLRESPONSE"))

(in-package "ROS")





(defclass roborts_msgs::FricWhlRequest
  :super ros::object
  :slots (_open ))

(defmethod roborts_msgs::FricWhlRequest
  (:init
   (&key
    ((:open __open) nil)
    )
   (send-super :init)
   (setq _open __open)
   self)
  (:open
   (&optional __open)
   (if __open (setq _open __open)) _open)
  (:serialization-length
   ()
   (+
    ;; bool _open
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _open
       (if _open (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _open
     (setq _open (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass roborts_msgs::FricWhlResponse
  :super ros::object
  :slots (_received ))

(defmethod roborts_msgs::FricWhlResponse
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

(defclass roborts_msgs::FricWhl
  :super ros::object
  :slots ())

(setf (get roborts_msgs::FricWhl :md5sum-) "1a044c2743c5efe1a86f5bca57f520c6")
(setf (get roborts_msgs::FricWhl :datatype-) "roborts_msgs/FricWhl")
(setf (get roborts_msgs::FricWhl :request) roborts_msgs::FricWhlRequest)
(setf (get roborts_msgs::FricWhl :response) roborts_msgs::FricWhlResponse)

(defmethod roborts_msgs::FricWhlRequest
  (:response () (instance roborts_msgs::FricWhlResponse :init)))

(setf (get roborts_msgs::FricWhlRequest :md5sum-) "1a044c2743c5efe1a86f5bca57f520c6")
(setf (get roborts_msgs::FricWhlRequest :datatype-) "roborts_msgs/FricWhlRequest")
(setf (get roborts_msgs::FricWhlRequest :definition-)
      "bool open
---
bool received

")

(setf (get roborts_msgs::FricWhlResponse :md5sum-) "1a044c2743c5efe1a86f5bca57f520c6")
(setf (get roborts_msgs::FricWhlResponse :datatype-) "roborts_msgs/FricWhlResponse")
(setf (get roborts_msgs::FricWhlResponse :definition-)
      "bool open
---
bool received

")



(provide :roborts_msgs/FricWhl "1a044c2743c5efe1a86f5bca57f520c6")


