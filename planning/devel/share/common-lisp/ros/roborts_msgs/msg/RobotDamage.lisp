; Auto-generated. Do not edit!


(cl:in-package roborts_msgs-msg)


;//! \htmlinclude RobotDamage.msg.html

(cl:defclass <RobotDamage> (roslisp-msg-protocol:ros-message)
  ((damage_type
    :reader damage_type
    :initarg :damage_type
    :type cl:fixnum
    :initform 0)
   (damage_source
    :reader damage_source
    :initarg :damage_source
    :type cl:fixnum
    :initform 0))
)

(cl:defclass RobotDamage (<RobotDamage>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <RobotDamage>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'RobotDamage)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name roborts_msgs-msg:<RobotDamage> is deprecated: use roborts_msgs-msg:RobotDamage instead.")))

(cl:ensure-generic-function 'damage_type-val :lambda-list '(m))
(cl:defmethod damage_type-val ((m <RobotDamage>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader roborts_msgs-msg:damage_type-val is deprecated.  Use roborts_msgs-msg:damage_type instead.")
  (damage_type m))

(cl:ensure-generic-function 'damage_source-val :lambda-list '(m))
(cl:defmethod damage_source-val ((m <RobotDamage>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader roborts_msgs-msg:damage_source-val is deprecated.  Use roborts_msgs-msg:damage_source instead.")
  (damage_source m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<RobotDamage>)))
    "Constants for message type '<RobotDamage>"
  '((:ARMOR . 0)
    (:OFFLINE . 1)
    (:EXCEED_HEAT . 2)
    (:EXCEED_POWER . 3)
    (:FORWARD . 0)
    (:LEFT . 1)
    (:BACKWARD . 2)
    (:RIGHT . 3))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'RobotDamage)))
    "Constants for message type 'RobotDamage"
  '((:ARMOR . 0)
    (:OFFLINE . 1)
    (:EXCEED_HEAT . 2)
    (:EXCEED_POWER . 3)
    (:FORWARD . 0)
    (:LEFT . 1)
    (:BACKWARD . 2)
    (:RIGHT . 3))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <RobotDamage>) ostream)
  "Serializes a message object of type '<RobotDamage>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'damage_type)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'damage_source)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <RobotDamage>) istream)
  "Deserializes a message object of type '<RobotDamage>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'damage_type)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'damage_source)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<RobotDamage>)))
  "Returns string type for a message object of type '<RobotDamage>"
  "roborts_msgs/RobotDamage")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RobotDamage)))
  "Returns string type for a message object of type 'RobotDamage"
  "roborts_msgs/RobotDamage")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<RobotDamage>)))
  "Returns md5sum for a message object of type '<RobotDamage>"
  "effef5d3b7e81a8189f62bb1e64ada64")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'RobotDamage)))
  "Returns md5sum for a message object of type 'RobotDamage"
  "effef5d3b7e81a8189f62bb1e64ada64")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<RobotDamage>)))
  "Returns full string definition for message of type '<RobotDamage>"
  (cl:format cl:nil "#robot damage~%uint8 ARMOR = 0~%uint8 OFFLINE = 1~%uint8 EXCEED_HEAT = 2~%uint8 EXCEED_POWER = 3~%uint8 damage_type~%uint8 FORWARD = 0~%uint8 LEFT = 1~%uint8 BACKWARD = 2~%uint8 RIGHT = 3~%uint8 damage_source~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'RobotDamage)))
  "Returns full string definition for message of type 'RobotDamage"
  (cl:format cl:nil "#robot damage~%uint8 ARMOR = 0~%uint8 OFFLINE = 1~%uint8 EXCEED_HEAT = 2~%uint8 EXCEED_POWER = 3~%uint8 damage_type~%uint8 FORWARD = 0~%uint8 LEFT = 1~%uint8 BACKWARD = 2~%uint8 RIGHT = 3~%uint8 damage_source~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <RobotDamage>))
  (cl:+ 0
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <RobotDamage>))
  "Converts a ROS message object to a list"
  (cl:list 'RobotDamage
    (cl:cons ':damage_type (damage_type msg))
    (cl:cons ':damage_source (damage_source msg))
))
