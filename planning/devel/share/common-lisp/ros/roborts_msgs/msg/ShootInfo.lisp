; Auto-generated. Do not edit!


(cl:in-package roborts_msgs-msg)


;//! \htmlinclude ShootInfo.msg.html

(cl:defclass <ShootInfo> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (remain_bullet
    :reader remain_bullet
    :initarg :remain_bullet
    :type cl:fixnum
    :initform 0)
   (sent_bullet
    :reader sent_bullet
    :initarg :sent_bullet
    :type cl:fixnum
    :initform 0)
   (fric_wheel_run
    :reader fric_wheel_run
    :initarg :fric_wheel_run
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass ShootInfo (<ShootInfo>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ShootInfo>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ShootInfo)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name roborts_msgs-msg:<ShootInfo> is deprecated: use roborts_msgs-msg:ShootInfo instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <ShootInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader roborts_msgs-msg:header-val is deprecated.  Use roborts_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'remain_bullet-val :lambda-list '(m))
(cl:defmethod remain_bullet-val ((m <ShootInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader roborts_msgs-msg:remain_bullet-val is deprecated.  Use roborts_msgs-msg:remain_bullet instead.")
  (remain_bullet m))

(cl:ensure-generic-function 'sent_bullet-val :lambda-list '(m))
(cl:defmethod sent_bullet-val ((m <ShootInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader roborts_msgs-msg:sent_bullet-val is deprecated.  Use roborts_msgs-msg:sent_bullet instead.")
  (sent_bullet m))

(cl:ensure-generic-function 'fric_wheel_run-val :lambda-list '(m))
(cl:defmethod fric_wheel_run-val ((m <ShootInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader roborts_msgs-msg:fric_wheel_run-val is deprecated.  Use roborts_msgs-msg:fric_wheel_run instead.")
  (fric_wheel_run m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ShootInfo>) ostream)
  "Serializes a message object of type '<ShootInfo>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let* ((signed (cl:slot-value msg 'remain_bullet)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'sent_bullet)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'fric_wheel_run) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ShootInfo>) istream)
  "Deserializes a message object of type '<ShootInfo>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'remain_bullet) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'sent_bullet) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:setf (cl:slot-value msg 'fric_wheel_run) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ShootInfo>)))
  "Returns string type for a message object of type '<ShootInfo>"
  "roborts_msgs/ShootInfo")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ShootInfo)))
  "Returns string type for a message object of type 'ShootInfo"
  "roborts_msgs/ShootInfo")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ShootInfo>)))
  "Returns md5sum for a message object of type '<ShootInfo>"
  "c71a8c5d03eafbb3be3f4aa0410b8278")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ShootInfo)))
  "Returns md5sum for a message object of type 'ShootInfo"
  "c71a8c5d03eafbb3be3f4aa0410b8278")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ShootInfo>)))
  "Returns full string definition for message of type '<ShootInfo>"
  (cl:format cl:nil "Header header~%~%#Remain bullets number~%int16 remain_bullet~%~%#Bullets fired number~%int16 sent_bullet~%~%#Friction running status~%bool fric_wheel_run~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ShootInfo)))
  "Returns full string definition for message of type 'ShootInfo"
  (cl:format cl:nil "Header header~%~%#Remain bullets number~%int16 remain_bullet~%~%#Bullets fired number~%int16 sent_bullet~%~%#Friction running status~%bool fric_wheel_run~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ShootInfo>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     2
     2
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ShootInfo>))
  "Converts a ROS message object to a list"
  (cl:list 'ShootInfo
    (cl:cons ':header (header msg))
    (cl:cons ':remain_bullet (remain_bullet msg))
    (cl:cons ':sent_bullet (sent_bullet msg))
    (cl:cons ':fric_wheel_run (fric_wheel_run msg))
))
