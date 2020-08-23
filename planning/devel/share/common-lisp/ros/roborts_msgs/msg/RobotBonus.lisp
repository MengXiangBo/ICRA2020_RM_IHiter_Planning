; Auto-generated. Do not edit!


(cl:in-package roborts_msgs-msg)


;//! \htmlinclude RobotBonus.msg.html

(cl:defclass <RobotBonus> (roslisp-msg-protocol:ros-message)
  ((bonus
    :reader bonus
    :initarg :bonus
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass RobotBonus (<RobotBonus>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <RobotBonus>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'RobotBonus)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name roborts_msgs-msg:<RobotBonus> is deprecated: use roborts_msgs-msg:RobotBonus instead.")))

(cl:ensure-generic-function 'bonus-val :lambda-list '(m))
(cl:defmethod bonus-val ((m <RobotBonus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader roborts_msgs-msg:bonus-val is deprecated.  Use roborts_msgs-msg:bonus instead.")
  (bonus m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <RobotBonus>) ostream)
  "Serializes a message object of type '<RobotBonus>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'bonus) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <RobotBonus>) istream)
  "Deserializes a message object of type '<RobotBonus>"
    (cl:setf (cl:slot-value msg 'bonus) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<RobotBonus>)))
  "Returns string type for a message object of type '<RobotBonus>"
  "roborts_msgs/RobotBonus")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RobotBonus)))
  "Returns string type for a message object of type 'RobotBonus"
  "roborts_msgs/RobotBonus")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<RobotBonus>)))
  "Returns md5sum for a message object of type '<RobotBonus>"
  "22365d98c104f9d16cae777ed759cbfe")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'RobotBonus)))
  "Returns md5sum for a message object of type 'RobotBonus"
  "22365d98c104f9d16cae777ed759cbfe")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<RobotBonus>)))
  "Returns full string definition for message of type '<RobotBonus>"
  (cl:format cl:nil "#robot bonus~%bool bonus~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'RobotBonus)))
  "Returns full string definition for message of type 'RobotBonus"
  (cl:format cl:nil "#robot bonus~%bool bonus~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <RobotBonus>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <RobotBonus>))
  "Converts a ROS message object to a list"
  (cl:list 'RobotBonus
    (cl:cons ':bonus (bonus msg))
))
