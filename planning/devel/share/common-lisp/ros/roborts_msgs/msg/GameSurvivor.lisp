; Auto-generated. Do not edit!


(cl:in-package roborts_msgs-msg)


;//! \htmlinclude GameSurvivor.msg.html

(cl:defclass <GameSurvivor> (roslisp-msg-protocol:ros-message)
  ((red3
    :reader red3
    :initarg :red3
    :type cl:boolean
    :initform cl:nil)
   (red4
    :reader red4
    :initarg :red4
    :type cl:boolean
    :initform cl:nil)
   (blue3
    :reader blue3
    :initarg :blue3
    :type cl:boolean
    :initform cl:nil)
   (blue4
    :reader blue4
    :initarg :blue4
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass GameSurvivor (<GameSurvivor>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GameSurvivor>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GameSurvivor)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name roborts_msgs-msg:<GameSurvivor> is deprecated: use roborts_msgs-msg:GameSurvivor instead.")))

(cl:ensure-generic-function 'red3-val :lambda-list '(m))
(cl:defmethod red3-val ((m <GameSurvivor>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader roborts_msgs-msg:red3-val is deprecated.  Use roborts_msgs-msg:red3 instead.")
  (red3 m))

(cl:ensure-generic-function 'red4-val :lambda-list '(m))
(cl:defmethod red4-val ((m <GameSurvivor>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader roborts_msgs-msg:red4-val is deprecated.  Use roborts_msgs-msg:red4 instead.")
  (red4 m))

(cl:ensure-generic-function 'blue3-val :lambda-list '(m))
(cl:defmethod blue3-val ((m <GameSurvivor>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader roborts_msgs-msg:blue3-val is deprecated.  Use roborts_msgs-msg:blue3 instead.")
  (blue3 m))

(cl:ensure-generic-function 'blue4-val :lambda-list '(m))
(cl:defmethod blue4-val ((m <GameSurvivor>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader roborts_msgs-msg:blue4-val is deprecated.  Use roborts_msgs-msg:blue4 instead.")
  (blue4 m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GameSurvivor>) ostream)
  "Serializes a message object of type '<GameSurvivor>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'red3) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'red4) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'blue3) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'blue4) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GameSurvivor>) istream)
  "Deserializes a message object of type '<GameSurvivor>"
    (cl:setf (cl:slot-value msg 'red3) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'red4) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'blue3) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'blue4) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GameSurvivor>)))
  "Returns string type for a message object of type '<GameSurvivor>"
  "roborts_msgs/GameSurvivor")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GameSurvivor)))
  "Returns string type for a message object of type 'GameSurvivor"
  "roborts_msgs/GameSurvivor")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GameSurvivor>)))
  "Returns md5sum for a message object of type '<GameSurvivor>"
  "48420e310835d7d79e0a1b719e881088")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GameSurvivor)))
  "Returns md5sum for a message object of type 'GameSurvivor"
  "48420e310835d7d79e0a1b719e881088")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GameSurvivor>)))
  "Returns full string definition for message of type '<GameSurvivor>"
  (cl:format cl:nil "#robot survival~%bool red3~%bool red4~%bool blue3~%bool blue4~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GameSurvivor)))
  "Returns full string definition for message of type 'GameSurvivor"
  (cl:format cl:nil "#robot survival~%bool red3~%bool red4~%bool blue3~%bool blue4~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GameSurvivor>))
  (cl:+ 0
     1
     1
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GameSurvivor>))
  "Converts a ROS message object to a list"
  (cl:list 'GameSurvivor
    (cl:cons ':red3 (red3 msg))
    (cl:cons ':red4 (red4 msg))
    (cl:cons ':blue3 (blue3 msg))
    (cl:cons ':blue4 (blue4 msg))
))
