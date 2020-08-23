; Auto-generated. Do not edit!


(cl:in-package roborts_msgs-msg)


;//! \htmlinclude RobotHeat.msg.html

(cl:defclass <RobotHeat> (roslisp-msg-protocol:ros-message)
  ((chassis_volt
    :reader chassis_volt
    :initarg :chassis_volt
    :type cl:fixnum
    :initform 0)
   (chassis_current
    :reader chassis_current
    :initarg :chassis_current
    :type cl:fixnum
    :initform 0)
   (chassis_power
    :reader chassis_power
    :initarg :chassis_power
    :type cl:float
    :initform 0.0)
   (chassis_power_buffer
    :reader chassis_power_buffer
    :initarg :chassis_power_buffer
    :type cl:fixnum
    :initform 0)
   (shooter_heat
    :reader shooter_heat
    :initarg :shooter_heat
    :type cl:fixnum
    :initform 0))
)

(cl:defclass RobotHeat (<RobotHeat>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <RobotHeat>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'RobotHeat)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name roborts_msgs-msg:<RobotHeat> is deprecated: use roborts_msgs-msg:RobotHeat instead.")))

(cl:ensure-generic-function 'chassis_volt-val :lambda-list '(m))
(cl:defmethod chassis_volt-val ((m <RobotHeat>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader roborts_msgs-msg:chassis_volt-val is deprecated.  Use roborts_msgs-msg:chassis_volt instead.")
  (chassis_volt m))

(cl:ensure-generic-function 'chassis_current-val :lambda-list '(m))
(cl:defmethod chassis_current-val ((m <RobotHeat>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader roborts_msgs-msg:chassis_current-val is deprecated.  Use roborts_msgs-msg:chassis_current instead.")
  (chassis_current m))

(cl:ensure-generic-function 'chassis_power-val :lambda-list '(m))
(cl:defmethod chassis_power-val ((m <RobotHeat>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader roborts_msgs-msg:chassis_power-val is deprecated.  Use roborts_msgs-msg:chassis_power instead.")
  (chassis_power m))

(cl:ensure-generic-function 'chassis_power_buffer-val :lambda-list '(m))
(cl:defmethod chassis_power_buffer-val ((m <RobotHeat>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader roborts_msgs-msg:chassis_power_buffer-val is deprecated.  Use roborts_msgs-msg:chassis_power_buffer instead.")
  (chassis_power_buffer m))

(cl:ensure-generic-function 'shooter_heat-val :lambda-list '(m))
(cl:defmethod shooter_heat-val ((m <RobotHeat>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader roborts_msgs-msg:shooter_heat-val is deprecated.  Use roborts_msgs-msg:shooter_heat instead.")
  (shooter_heat m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <RobotHeat>) ostream)
  "Serializes a message object of type '<RobotHeat>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'chassis_volt)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'chassis_volt)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'chassis_current)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'chassis_current)) ostream)
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'chassis_power))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'chassis_power_buffer)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'chassis_power_buffer)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'shooter_heat)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'shooter_heat)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <RobotHeat>) istream)
  "Deserializes a message object of type '<RobotHeat>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'chassis_volt)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'chassis_volt)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'chassis_current)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'chassis_current)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'chassis_power) (roslisp-utils:decode-double-float-bits bits)))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'chassis_power_buffer)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'chassis_power_buffer)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'shooter_heat)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'shooter_heat)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<RobotHeat>)))
  "Returns string type for a message object of type '<RobotHeat>"
  "roborts_msgs/RobotHeat")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RobotHeat)))
  "Returns string type for a message object of type 'RobotHeat"
  "roborts_msgs/RobotHeat")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<RobotHeat>)))
  "Returns md5sum for a message object of type '<RobotHeat>"
  "12a69f2d33ac7367772428034e998f18")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'RobotHeat)))
  "Returns md5sum for a message object of type 'RobotHeat"
  "12a69f2d33ac7367772428034e998f18")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<RobotHeat>)))
  "Returns full string definition for message of type '<RobotHeat>"
  (cl:format cl:nil "#robot power and heat data~%uint16 chassis_volt~%uint16 chassis_current~%float64  chassis_power~%uint16 chassis_power_buffer~%uint16 shooter_heat~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'RobotHeat)))
  "Returns full string definition for message of type 'RobotHeat"
  (cl:format cl:nil "#robot power and heat data~%uint16 chassis_volt~%uint16 chassis_current~%float64  chassis_power~%uint16 chassis_power_buffer~%uint16 shooter_heat~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <RobotHeat>))
  (cl:+ 0
     2
     2
     8
     2
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <RobotHeat>))
  "Converts a ROS message object to a list"
  (cl:list 'RobotHeat
    (cl:cons ':chassis_volt (chassis_volt msg))
    (cl:cons ':chassis_current (chassis_current msg))
    (cl:cons ':chassis_power (chassis_power msg))
    (cl:cons ':chassis_power_buffer (chassis_power_buffer msg))
    (cl:cons ':shooter_heat (shooter_heat msg))
))
