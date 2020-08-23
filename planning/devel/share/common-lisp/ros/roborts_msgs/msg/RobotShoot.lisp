; Auto-generated. Do not edit!


(cl:in-package roborts_msgs-msg)


;//! \htmlinclude RobotShoot.msg.html

(cl:defclass <RobotShoot> (roslisp-msg-protocol:ros-message)
  ((frequency
    :reader frequency
    :initarg :frequency
    :type cl:fixnum
    :initform 0)
   (speed
    :reader speed
    :initarg :speed
    :type cl:float
    :initform 0.0))
)

(cl:defclass RobotShoot (<RobotShoot>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <RobotShoot>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'RobotShoot)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name roborts_msgs-msg:<RobotShoot> is deprecated: use roborts_msgs-msg:RobotShoot instead.")))

(cl:ensure-generic-function 'frequency-val :lambda-list '(m))
(cl:defmethod frequency-val ((m <RobotShoot>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader roborts_msgs-msg:frequency-val is deprecated.  Use roborts_msgs-msg:frequency instead.")
  (frequency m))

(cl:ensure-generic-function 'speed-val :lambda-list '(m))
(cl:defmethod speed-val ((m <RobotShoot>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader roborts_msgs-msg:speed-val is deprecated.  Use roborts_msgs-msg:speed instead.")
  (speed m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <RobotShoot>) ostream)
  "Serializes a message object of type '<RobotShoot>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'frequency)) ostream)
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'speed))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <RobotShoot>) istream)
  "Deserializes a message object of type '<RobotShoot>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'frequency)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'speed) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<RobotShoot>)))
  "Returns string type for a message object of type '<RobotShoot>"
  "roborts_msgs/RobotShoot")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RobotShoot)))
  "Returns string type for a message object of type 'RobotShoot"
  "roborts_msgs/RobotShoot")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<RobotShoot>)))
  "Returns md5sum for a message object of type '<RobotShoot>"
  "2634dbd94553eb6552f07bddaa5136d1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'RobotShoot)))
  "Returns md5sum for a message object of type 'RobotShoot"
  "2634dbd94553eb6552f07bddaa5136d1")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<RobotShoot>)))
  "Returns full string definition for message of type '<RobotShoot>"
  (cl:format cl:nil "#robot shoot data~%uint8 frequency~%float64 speed~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'RobotShoot)))
  "Returns full string definition for message of type 'RobotShoot"
  (cl:format cl:nil "#robot shoot data~%uint8 frequency~%float64 speed~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <RobotShoot>))
  (cl:+ 0
     1
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <RobotShoot>))
  "Converts a ROS message object to a list"
  (cl:list 'RobotShoot
    (cl:cons ':frequency (frequency msg))
    (cl:cons ':speed (speed msg))
))
