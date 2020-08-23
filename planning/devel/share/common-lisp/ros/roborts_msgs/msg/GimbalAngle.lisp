; Auto-generated. Do not edit!


(cl:in-package roborts_msgs-msg)


;//! \htmlinclude GimbalAngle.msg.html

(cl:defclass <GimbalAngle> (roslisp-msg-protocol:ros-message)
  ((yaw_mode
    :reader yaw_mode
    :initarg :yaw_mode
    :type cl:boolean
    :initform cl:nil)
   (pitch_mode
    :reader pitch_mode
    :initarg :pitch_mode
    :type cl:boolean
    :initform cl:nil)
   (yaw_angle
    :reader yaw_angle
    :initarg :yaw_angle
    :type cl:float
    :initform 0.0)
   (pitch_angle
    :reader pitch_angle
    :initarg :pitch_angle
    :type cl:float
    :initform 0.0))
)

(cl:defclass GimbalAngle (<GimbalAngle>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GimbalAngle>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GimbalAngle)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name roborts_msgs-msg:<GimbalAngle> is deprecated: use roborts_msgs-msg:GimbalAngle instead.")))

(cl:ensure-generic-function 'yaw_mode-val :lambda-list '(m))
(cl:defmethod yaw_mode-val ((m <GimbalAngle>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader roborts_msgs-msg:yaw_mode-val is deprecated.  Use roborts_msgs-msg:yaw_mode instead.")
  (yaw_mode m))

(cl:ensure-generic-function 'pitch_mode-val :lambda-list '(m))
(cl:defmethod pitch_mode-val ((m <GimbalAngle>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader roborts_msgs-msg:pitch_mode-val is deprecated.  Use roborts_msgs-msg:pitch_mode instead.")
  (pitch_mode m))

(cl:ensure-generic-function 'yaw_angle-val :lambda-list '(m))
(cl:defmethod yaw_angle-val ((m <GimbalAngle>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader roborts_msgs-msg:yaw_angle-val is deprecated.  Use roborts_msgs-msg:yaw_angle instead.")
  (yaw_angle m))

(cl:ensure-generic-function 'pitch_angle-val :lambda-list '(m))
(cl:defmethod pitch_angle-val ((m <GimbalAngle>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader roborts_msgs-msg:pitch_angle-val is deprecated.  Use roborts_msgs-msg:pitch_angle instead.")
  (pitch_angle m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GimbalAngle>) ostream)
  "Serializes a message object of type '<GimbalAngle>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'yaw_mode) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'pitch_mode) 1 0)) ostream)
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'yaw_angle))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'pitch_angle))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GimbalAngle>) istream)
  "Deserializes a message object of type '<GimbalAngle>"
    (cl:setf (cl:slot-value msg 'yaw_mode) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'pitch_mode) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'yaw_angle) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'pitch_angle) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GimbalAngle>)))
  "Returns string type for a message object of type '<GimbalAngle>"
  "roborts_msgs/GimbalAngle")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GimbalAngle)))
  "Returns string type for a message object of type 'GimbalAngle"
  "roborts_msgs/GimbalAngle")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GimbalAngle>)))
  "Returns md5sum for a message object of type '<GimbalAngle>"
  "b3949b2683b910b23b0cb34879284a9b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GimbalAngle)))
  "Returns md5sum for a message object of type 'GimbalAngle"
  "b3949b2683b910b23b0cb34879284a9b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GimbalAngle>)))
  "Returns full string definition for message of type '<GimbalAngle>"
  (cl:format cl:nil "#gimbal feedback angle data~%bool yaw_mode~%bool pitch_mode~%float64 yaw_angle~%float64 pitch_angle~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GimbalAngle)))
  "Returns full string definition for message of type 'GimbalAngle"
  (cl:format cl:nil "#gimbal feedback angle data~%bool yaw_mode~%bool pitch_mode~%float64 yaw_angle~%float64 pitch_angle~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GimbalAngle>))
  (cl:+ 0
     1
     1
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GimbalAngle>))
  "Converts a ROS message object to a list"
  (cl:list 'GimbalAngle
    (cl:cons ':yaw_mode (yaw_mode msg))
    (cl:cons ':pitch_mode (pitch_mode msg))
    (cl:cons ':yaw_angle (yaw_angle msg))
    (cl:cons ':pitch_angle (pitch_angle msg))
))
