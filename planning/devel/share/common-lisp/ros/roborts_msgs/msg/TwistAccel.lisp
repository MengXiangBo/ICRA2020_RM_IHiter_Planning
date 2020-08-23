; Auto-generated. Do not edit!


(cl:in-package roborts_msgs-msg)


;//! \htmlinclude TwistAccel.msg.html

(cl:defclass <TwistAccel> (roslisp-msg-protocol:ros-message)
  ((twist
    :reader twist
    :initarg :twist
    :type geometry_msgs-msg:Twist
    :initform (cl:make-instance 'geometry_msgs-msg:Twist))
   (accel
    :reader accel
    :initarg :accel
    :type geometry_msgs-msg:Accel
    :initform (cl:make-instance 'geometry_msgs-msg:Accel)))
)

(cl:defclass TwistAccel (<TwistAccel>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <TwistAccel>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'TwistAccel)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name roborts_msgs-msg:<TwistAccel> is deprecated: use roborts_msgs-msg:TwistAccel instead.")))

(cl:ensure-generic-function 'twist-val :lambda-list '(m))
(cl:defmethod twist-val ((m <TwistAccel>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader roborts_msgs-msg:twist-val is deprecated.  Use roborts_msgs-msg:twist instead.")
  (twist m))

(cl:ensure-generic-function 'accel-val :lambda-list '(m))
(cl:defmethod accel-val ((m <TwistAccel>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader roborts_msgs-msg:accel-val is deprecated.  Use roborts_msgs-msg:accel instead.")
  (accel m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <TwistAccel>) ostream)
  "Serializes a message object of type '<TwistAccel>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'twist) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'accel) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <TwistAccel>) istream)
  "Deserializes a message object of type '<TwistAccel>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'twist) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'accel) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<TwistAccel>)))
  "Returns string type for a message object of type '<TwistAccel>"
  "roborts_msgs/TwistAccel")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TwistAccel)))
  "Returns string type for a message object of type 'TwistAccel"
  "roborts_msgs/TwistAccel")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<TwistAccel>)))
  "Returns md5sum for a message object of type '<TwistAccel>"
  "644e3af95741e8ff8b733f2fd1e014d8")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'TwistAccel)))
  "Returns md5sum for a message object of type 'TwistAccel"
  "644e3af95741e8ff8b733f2fd1e014d8")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<TwistAccel>)))
  "Returns full string definition for message of type '<TwistAccel>"
  (cl:format cl:nil "geometry_msgs/Twist twist~%geometry_msgs/Accel accel~%================================================================================~%MSG: geometry_msgs/Twist~%# This expresses velocity in free space broken into its linear and angular parts.~%Vector3  linear~%Vector3  angular~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%================================================================================~%MSG: geometry_msgs/Accel~%# This expresses acceleration in free space broken into its linear and angular parts.~%Vector3  linear~%Vector3  angular~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'TwistAccel)))
  "Returns full string definition for message of type 'TwistAccel"
  (cl:format cl:nil "geometry_msgs/Twist twist~%geometry_msgs/Accel accel~%================================================================================~%MSG: geometry_msgs/Twist~%# This expresses velocity in free space broken into its linear and angular parts.~%Vector3  linear~%Vector3  angular~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%================================================================================~%MSG: geometry_msgs/Accel~%# This expresses acceleration in free space broken into its linear and angular parts.~%Vector3  linear~%Vector3  angular~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <TwistAccel>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'twist))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'accel))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <TwistAccel>))
  "Converts a ROS message object to a list"
  (cl:list 'TwistAccel
    (cl:cons ':twist (twist msg))
    (cl:cons ':accel (accel msg))
))
