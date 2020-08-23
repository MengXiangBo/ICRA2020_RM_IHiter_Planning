; Auto-generated. Do not edit!


(cl:in-package roborts_msgs-msg)


;//! \htmlinclude GameResult.msg.html

(cl:defclass <GameResult> (roslisp-msg-protocol:ros-message)
  ((result
    :reader result
    :initarg :result
    :type cl:fixnum
    :initform 0))
)

(cl:defclass GameResult (<GameResult>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GameResult>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GameResult)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name roborts_msgs-msg:<GameResult> is deprecated: use roborts_msgs-msg:GameResult instead.")))

(cl:ensure-generic-function 'result-val :lambda-list '(m))
(cl:defmethod result-val ((m <GameResult>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader roborts_msgs-msg:result-val is deprecated.  Use roborts_msgs-msg:result instead.")
  (result m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<GameResult>)))
    "Constants for message type '<GameResult>"
  '((:DRAW . 0)
    (:RED_WIN . 1)
    (:BLUE_WIN . 2))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'GameResult)))
    "Constants for message type 'GameResult"
  '((:DRAW . 0)
    (:RED_WIN . 1)
    (:BLUE_WIN . 2))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GameResult>) ostream)
  "Serializes a message object of type '<GameResult>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'result)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GameResult>) istream)
  "Deserializes a message object of type '<GameResult>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'result)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GameResult>)))
  "Returns string type for a message object of type '<GameResult>"
  "roborts_msgs/GameResult")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GameResult)))
  "Returns string type for a message object of type 'GameResult"
  "roborts_msgs/GameResult")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GameResult>)))
  "Returns md5sum for a message object of type '<GameResult>"
  "4d09240fdf4519a3920c8056c8354c3d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GameResult)))
  "Returns md5sum for a message object of type 'GameResult"
  "4d09240fdf4519a3920c8056c8354c3d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GameResult>)))
  "Returns full string definition for message of type '<GameResult>"
  (cl:format cl:nil "#game result~%uint8  DRAW=0~%uint8  RED_WIN=1~%uint8  BLUE_WIN=2~%uint8  result~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GameResult)))
  "Returns full string definition for message of type 'GameResult"
  (cl:format cl:nil "#game result~%uint8  DRAW=0~%uint8  RED_WIN=1~%uint8  BLUE_WIN=2~%uint8  result~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GameResult>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GameResult>))
  "Converts a ROS message object to a list"
  (cl:list 'GameResult
    (cl:cons ':result (result msg))
))
