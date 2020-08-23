; Auto-generated. Do not edit!


(cl:in-package roborts_msgs-msg)


;//! \htmlinclude ShootState.msg.html

(cl:defclass <ShootState> (roslisp-msg-protocol:ros-message)
  ((single_shoot
    :reader single_shoot
    :initarg :single_shoot
    :type cl:integer
    :initform 0)
   (continue_shoot
    :reader continue_shoot
    :initarg :continue_shoot
    :type cl:integer
    :initform 0)
   (run_friction_whell
    :reader run_friction_whell
    :initarg :run_friction_whell
    :type cl:integer
    :initform 0)
   (friction_whell_speed
    :reader friction_whell_speed
    :initarg :friction_whell_speed
    :type cl:integer
    :initform 0))
)

(cl:defclass ShootState (<ShootState>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ShootState>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ShootState)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name roborts_msgs-msg:<ShootState> is deprecated: use roborts_msgs-msg:ShootState instead.")))

(cl:ensure-generic-function 'single_shoot-val :lambda-list '(m))
(cl:defmethod single_shoot-val ((m <ShootState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader roborts_msgs-msg:single_shoot-val is deprecated.  Use roborts_msgs-msg:single_shoot instead.")
  (single_shoot m))

(cl:ensure-generic-function 'continue_shoot-val :lambda-list '(m))
(cl:defmethod continue_shoot-val ((m <ShootState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader roborts_msgs-msg:continue_shoot-val is deprecated.  Use roborts_msgs-msg:continue_shoot instead.")
  (continue_shoot m))

(cl:ensure-generic-function 'run_friction_whell-val :lambda-list '(m))
(cl:defmethod run_friction_whell-val ((m <ShootState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader roborts_msgs-msg:run_friction_whell-val is deprecated.  Use roborts_msgs-msg:run_friction_whell instead.")
  (run_friction_whell m))

(cl:ensure-generic-function 'friction_whell_speed-val :lambda-list '(m))
(cl:defmethod friction_whell_speed-val ((m <ShootState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader roborts_msgs-msg:friction_whell_speed-val is deprecated.  Use roborts_msgs-msg:friction_whell_speed instead.")
  (friction_whell_speed m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ShootState>) ostream)
  "Serializes a message object of type '<ShootState>"
  (cl:let* ((signed (cl:slot-value msg 'single_shoot)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'continue_shoot)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'run_friction_whell)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'friction_whell_speed)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ShootState>) istream)
  "Deserializes a message object of type '<ShootState>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'single_shoot) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'continue_shoot) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'run_friction_whell) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'friction_whell_speed) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ShootState>)))
  "Returns string type for a message object of type '<ShootState>"
  "roborts_msgs/ShootState")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ShootState)))
  "Returns string type for a message object of type 'ShootState"
  "roborts_msgs/ShootState")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ShootState>)))
  "Returns md5sum for a message object of type '<ShootState>"
  "36f858c917904d9229bf553ee5e21890")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ShootState)))
  "Returns md5sum for a message object of type 'ShootState"
  "36f858c917904d9229bf553ee5e21890")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ShootState>)))
  "Returns full string definition for message of type '<ShootState>"
  (cl:format cl:nil "int32 single_shoot~%int32 continue_shoot~%int32 run_friction_whell~%int32 friction_whell_speed~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ShootState)))
  "Returns full string definition for message of type 'ShootState"
  (cl:format cl:nil "int32 single_shoot~%int32 continue_shoot~%int32 run_friction_whell~%int32 friction_whell_speed~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ShootState>))
  (cl:+ 0
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ShootState>))
  "Converts a ROS message object to a list"
  (cl:list 'ShootState
    (cl:cons ':single_shoot (single_shoot msg))
    (cl:cons ':continue_shoot (continue_shoot msg))
    (cl:cons ':run_friction_whell (run_friction_whell msg))
    (cl:cons ':friction_whell_speed (friction_whell_speed msg))
))
