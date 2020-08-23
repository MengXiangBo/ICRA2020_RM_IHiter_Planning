; Auto-generated. Do not edit!


(cl:in-package roborts_msgs-msg)


;//! \htmlinclude RobotStatus.msg.html

(cl:defclass <RobotStatus> (roslisp-msg-protocol:ros-message)
  ((id
    :reader id
    :initarg :id
    :type cl:fixnum
    :initform 0)
   (level
    :reader level
    :initarg :level
    :type cl:fixnum
    :initform 0)
   (remain_hp
    :reader remain_hp
    :initarg :remain_hp
    :type cl:fixnum
    :initform 0)
   (max_hp
    :reader max_hp
    :initarg :max_hp
    :type cl:fixnum
    :initform 0)
   (heat_cooling_limit
    :reader heat_cooling_limit
    :initarg :heat_cooling_limit
    :type cl:fixnum
    :initform 0)
   (heat_cooling_rate
    :reader heat_cooling_rate
    :initarg :heat_cooling_rate
    :type cl:fixnum
    :initform 0)
   (gimbal_output
    :reader gimbal_output
    :initarg :gimbal_output
    :type cl:boolean
    :initform cl:nil)
   (chassis_output
    :reader chassis_output
    :initarg :chassis_output
    :type cl:boolean
    :initform cl:nil)
   (shooter_output
    :reader shooter_output
    :initarg :shooter_output
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass RobotStatus (<RobotStatus>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <RobotStatus>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'RobotStatus)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name roborts_msgs-msg:<RobotStatus> is deprecated: use roborts_msgs-msg:RobotStatus instead.")))

(cl:ensure-generic-function 'id-val :lambda-list '(m))
(cl:defmethod id-val ((m <RobotStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader roborts_msgs-msg:id-val is deprecated.  Use roborts_msgs-msg:id instead.")
  (id m))

(cl:ensure-generic-function 'level-val :lambda-list '(m))
(cl:defmethod level-val ((m <RobotStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader roborts_msgs-msg:level-val is deprecated.  Use roborts_msgs-msg:level instead.")
  (level m))

(cl:ensure-generic-function 'remain_hp-val :lambda-list '(m))
(cl:defmethod remain_hp-val ((m <RobotStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader roborts_msgs-msg:remain_hp-val is deprecated.  Use roborts_msgs-msg:remain_hp instead.")
  (remain_hp m))

(cl:ensure-generic-function 'max_hp-val :lambda-list '(m))
(cl:defmethod max_hp-val ((m <RobotStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader roborts_msgs-msg:max_hp-val is deprecated.  Use roborts_msgs-msg:max_hp instead.")
  (max_hp m))

(cl:ensure-generic-function 'heat_cooling_limit-val :lambda-list '(m))
(cl:defmethod heat_cooling_limit-val ((m <RobotStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader roborts_msgs-msg:heat_cooling_limit-val is deprecated.  Use roborts_msgs-msg:heat_cooling_limit instead.")
  (heat_cooling_limit m))

(cl:ensure-generic-function 'heat_cooling_rate-val :lambda-list '(m))
(cl:defmethod heat_cooling_rate-val ((m <RobotStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader roborts_msgs-msg:heat_cooling_rate-val is deprecated.  Use roborts_msgs-msg:heat_cooling_rate instead.")
  (heat_cooling_rate m))

(cl:ensure-generic-function 'gimbal_output-val :lambda-list '(m))
(cl:defmethod gimbal_output-val ((m <RobotStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader roborts_msgs-msg:gimbal_output-val is deprecated.  Use roborts_msgs-msg:gimbal_output instead.")
  (gimbal_output m))

(cl:ensure-generic-function 'chassis_output-val :lambda-list '(m))
(cl:defmethod chassis_output-val ((m <RobotStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader roborts_msgs-msg:chassis_output-val is deprecated.  Use roborts_msgs-msg:chassis_output instead.")
  (chassis_output m))

(cl:ensure-generic-function 'shooter_output-val :lambda-list '(m))
(cl:defmethod shooter_output-val ((m <RobotStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader roborts_msgs-msg:shooter_output-val is deprecated.  Use roborts_msgs-msg:shooter_output instead.")
  (shooter_output m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <RobotStatus>) ostream)
  "Serializes a message object of type '<RobotStatus>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'level)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'remain_hp)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'remain_hp)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'max_hp)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'max_hp)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'heat_cooling_limit)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'heat_cooling_limit)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'heat_cooling_rate)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'heat_cooling_rate)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'gimbal_output) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'chassis_output) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'shooter_output) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <RobotStatus>) istream)
  "Deserializes a message object of type '<RobotStatus>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'level)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'remain_hp)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'remain_hp)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'max_hp)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'max_hp)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'heat_cooling_limit)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'heat_cooling_limit)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'heat_cooling_rate)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'heat_cooling_rate)) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'gimbal_output) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'chassis_output) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'shooter_output) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<RobotStatus>)))
  "Returns string type for a message object of type '<RobotStatus>"
  "roborts_msgs/RobotStatus")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RobotStatus)))
  "Returns string type for a message object of type 'RobotStatus"
  "roborts_msgs/RobotStatus")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<RobotStatus>)))
  "Returns md5sum for a message object of type '<RobotStatus>"
  "122334534857c1294574d2c7eef57af5")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'RobotStatus)))
  "Returns md5sum for a message object of type 'RobotStatus"
  "122334534857c1294574d2c7eef57af5")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<RobotStatus>)))
  "Returns full string definition for message of type '<RobotStatus>"
  (cl:format cl:nil "#robot status~%uint8 id~%uint8 level~%uint16 remain_hp~%uint16 max_hp~%uint16 heat_cooling_limit~%uint16 heat_cooling_rate~%bool gimbal_output~%bool chassis_output~%bool shooter_output~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'RobotStatus)))
  "Returns full string definition for message of type 'RobotStatus"
  (cl:format cl:nil "#robot status~%uint8 id~%uint8 level~%uint16 remain_hp~%uint16 max_hp~%uint16 heat_cooling_limit~%uint16 heat_cooling_rate~%bool gimbal_output~%bool chassis_output~%bool shooter_output~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <RobotStatus>))
  (cl:+ 0
     1
     1
     2
     2
     2
     2
     1
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <RobotStatus>))
  "Converts a ROS message object to a list"
  (cl:list 'RobotStatus
    (cl:cons ':id (id msg))
    (cl:cons ':level (level msg))
    (cl:cons ':remain_hp (remain_hp msg))
    (cl:cons ':max_hp (max_hp msg))
    (cl:cons ':heat_cooling_limit (heat_cooling_limit msg))
    (cl:cons ':heat_cooling_rate (heat_cooling_rate msg))
    (cl:cons ':gimbal_output (gimbal_output msg))
    (cl:cons ':chassis_output (chassis_output msg))
    (cl:cons ':shooter_output (shooter_output msg))
))
