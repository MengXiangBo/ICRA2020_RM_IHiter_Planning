; Auto-generated. Do not edit!


(cl:in-package roborts_msgs-msg)


;//! \htmlinclude GameStatus.msg.html

(cl:defclass <GameStatus> (roslisp-msg-protocol:ros-message)
  ((game_status
    :reader game_status
    :initarg :game_status
    :type cl:fixnum
    :initform 0)
   (remaining_time
    :reader remaining_time
    :initarg :remaining_time
    :type cl:fixnum
    :initform 0))
)

(cl:defclass GameStatus (<GameStatus>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GameStatus>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GameStatus)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name roborts_msgs-msg:<GameStatus> is deprecated: use roborts_msgs-msg:GameStatus instead.")))

(cl:ensure-generic-function 'game_status-val :lambda-list '(m))
(cl:defmethod game_status-val ((m <GameStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader roborts_msgs-msg:game_status-val is deprecated.  Use roborts_msgs-msg:game_status instead.")
  (game_status m))

(cl:ensure-generic-function 'remaining_time-val :lambda-list '(m))
(cl:defmethod remaining_time-val ((m <GameStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader roborts_msgs-msg:remaining_time-val is deprecated.  Use roborts_msgs-msg:remaining_time instead.")
  (remaining_time m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<GameStatus>)))
    "Constants for message type '<GameStatus>"
  '((:PRE_MATCH . 0)
    (:SETUP . 1)
    (:INIT . 2)
    (:FIVE_SEC_CD . 3)
    (:ROUND . 4)
    (:CALCULATION . 5))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'GameStatus)))
    "Constants for message type 'GameStatus"
  '((:PRE_MATCH . 0)
    (:SETUP . 1)
    (:INIT . 2)
    (:FIVE_SEC_CD . 3)
    (:ROUND . 4)
    (:CALCULATION . 5))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GameStatus>) ostream)
  "Serializes a message object of type '<GameStatus>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'game_status)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'remaining_time)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'remaining_time)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GameStatus>) istream)
  "Deserializes a message object of type '<GameStatus>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'game_status)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'remaining_time)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'remaining_time)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GameStatus>)))
  "Returns string type for a message object of type '<GameStatus>"
  "roborts_msgs/GameStatus")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GameStatus)))
  "Returns string type for a message object of type 'GameStatus"
  "roborts_msgs/GameStatus")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GameStatus>)))
  "Returns md5sum for a message object of type '<GameStatus>"
  "1420f1b84d9eff8855d07e0139b55a97")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GameStatus)))
  "Returns md5sum for a message object of type 'GameStatus"
  "1420f1b84d9eff8855d07e0139b55a97")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GameStatus>)))
  "Returns full string definition for message of type '<GameStatus>"
  (cl:format cl:nil "#game status~%uint8 PRE_MATCH = 0~%uint8 SETUP = 1~%uint8 INIT = 2~%uint8 FIVE_SEC_CD = 3~%uint8 ROUND = 4~%uint8 CALCULATION = 5~%uint8 game_status~%uint16 remaining_time~%~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GameStatus)))
  "Returns full string definition for message of type 'GameStatus"
  (cl:format cl:nil "#game status~%uint8 PRE_MATCH = 0~%uint8 SETUP = 1~%uint8 INIT = 2~%uint8 FIVE_SEC_CD = 3~%uint8 ROUND = 4~%uint8 CALCULATION = 5~%uint8 game_status~%uint16 remaining_time~%~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GameStatus>))
  (cl:+ 0
     1
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GameStatus>))
  "Converts a ROS message object to a list"
  (cl:list 'GameStatus
    (cl:cons ':game_status (game_status msg))
    (cl:cons ':remaining_time (remaining_time msg))
))
