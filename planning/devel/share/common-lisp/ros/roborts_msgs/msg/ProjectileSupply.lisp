; Auto-generated. Do not edit!


(cl:in-package roborts_msgs-msg)


;//! \htmlinclude ProjectileSupply.msg.html

(cl:defclass <ProjectileSupply> (roslisp-msg-protocol:ros-message)
  ((number
    :reader number
    :initarg :number
    :type cl:fixnum
    :initform 0))
)

(cl:defclass ProjectileSupply (<ProjectileSupply>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ProjectileSupply>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ProjectileSupply)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name roborts_msgs-msg:<ProjectileSupply> is deprecated: use roborts_msgs-msg:ProjectileSupply instead.")))

(cl:ensure-generic-function 'number-val :lambda-list '(m))
(cl:defmethod number-val ((m <ProjectileSupply>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader roborts_msgs-msg:number-val is deprecated.  Use roborts_msgs-msg:number instead.")
  (number m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ProjectileSupply>) ostream)
  "Serializes a message object of type '<ProjectileSupply>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'number)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ProjectileSupply>) istream)
  "Deserializes a message object of type '<ProjectileSupply>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'number)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ProjectileSupply>)))
  "Returns string type for a message object of type '<ProjectileSupply>"
  "roborts_msgs/ProjectileSupply")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ProjectileSupply)))
  "Returns string type for a message object of type 'ProjectileSupply"
  "roborts_msgs/ProjectileSupply")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ProjectileSupply>)))
  "Returns md5sum for a message object of type '<ProjectileSupply>"
  "29e94f7568510a2f9241abcc8f191b4f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ProjectileSupply)))
  "Returns md5sum for a message object of type 'ProjectileSupply"
  "29e94f7568510a2f9241abcc8f191b4f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ProjectileSupply>)))
  "Returns full string definition for message of type '<ProjectileSupply>"
  (cl:format cl:nil "#projectile supply~%uint8 number~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ProjectileSupply)))
  "Returns full string definition for message of type 'ProjectileSupply"
  (cl:format cl:nil "#projectile supply~%uint8 number~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ProjectileSupply>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ProjectileSupply>))
  "Converts a ROS message object to a list"
  (cl:list 'ProjectileSupply
    (cl:cons ':number (number msg))
))
