; Auto-generated. Do not edit!


(cl:in-package roborts_msgs-msg)


;//! \htmlinclude BonusStatus.msg.html

(cl:defclass <BonusStatus> (roslisp-msg-protocol:ros-message)
  ((red_bonus
    :reader red_bonus
    :initarg :red_bonus
    :type cl:fixnum
    :initform 0)
   (blue_bonus
    :reader blue_bonus
    :initarg :blue_bonus
    :type cl:fixnum
    :initform 0))
)

(cl:defclass BonusStatus (<BonusStatus>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <BonusStatus>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'BonusStatus)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name roborts_msgs-msg:<BonusStatus> is deprecated: use roborts_msgs-msg:BonusStatus instead.")))

(cl:ensure-generic-function 'red_bonus-val :lambda-list '(m))
(cl:defmethod red_bonus-val ((m <BonusStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader roborts_msgs-msg:red_bonus-val is deprecated.  Use roborts_msgs-msg:red_bonus instead.")
  (red_bonus m))

(cl:ensure-generic-function 'blue_bonus-val :lambda-list '(m))
(cl:defmethod blue_bonus-val ((m <BonusStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader roborts_msgs-msg:blue_bonus-val is deprecated.  Use roborts_msgs-msg:blue_bonus instead.")
  (blue_bonus m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<BonusStatus>)))
    "Constants for message type '<BonusStatus>"
  '((:UNOCCUPIED . 0)
    (:BEING_OCCUPIED . 1)
    (:OCCUPIED . 2))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'BonusStatus)))
    "Constants for message type 'BonusStatus"
  '((:UNOCCUPIED . 0)
    (:BEING_OCCUPIED . 1)
    (:OCCUPIED . 2))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <BonusStatus>) ostream)
  "Serializes a message object of type '<BonusStatus>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'red_bonus)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'blue_bonus)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <BonusStatus>) istream)
  "Deserializes a message object of type '<BonusStatus>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'red_bonus)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'blue_bonus)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<BonusStatus>)))
  "Returns string type for a message object of type '<BonusStatus>"
  "roborts_msgs/BonusStatus")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'BonusStatus)))
  "Returns string type for a message object of type 'BonusStatus"
  "roborts_msgs/BonusStatus")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<BonusStatus>)))
  "Returns md5sum for a message object of type '<BonusStatus>"
  "45f50b5ec6e45c780298e74c42177aa1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'BonusStatus)))
  "Returns md5sum for a message object of type 'BonusStatus"
  "45f50b5ec6e45c780298e74c42177aa1")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<BonusStatus>)))
  "Returns full string definition for message of type '<BonusStatus>"
  (cl:format cl:nil "#bonus zone status~%uint8 UNOCCUPIED = 0~%uint8 BEING_OCCUPIED= 1~%uint8 OCCUPIED = 2~%uint8 red_bonus~%uint8 blue_bonus~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'BonusStatus)))
  "Returns full string definition for message of type 'BonusStatus"
  (cl:format cl:nil "#bonus zone status~%uint8 UNOCCUPIED = 0~%uint8 BEING_OCCUPIED= 1~%uint8 OCCUPIED = 2~%uint8 red_bonus~%uint8 blue_bonus~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <BonusStatus>))
  (cl:+ 0
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <BonusStatus>))
  "Converts a ROS message object to a list"
  (cl:list 'BonusStatus
    (cl:cons ':red_bonus (red_bonus msg))
    (cl:cons ':blue_bonus (blue_bonus msg))
))
