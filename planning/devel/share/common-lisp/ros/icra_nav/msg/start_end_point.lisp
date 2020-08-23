; Auto-generated. Do not edit!


(cl:in-package icra_nav-msg)


;//! \htmlinclude start_end_point.msg.html

(cl:defclass <start_end_point> (roslisp-msg-protocol:ros-message)
  ((flStartX
    :reader flStartX
    :initarg :flStartX
    :type cl:float
    :initform 0.0)
   (flStartY
    :reader flStartY
    :initarg :flStartY
    :type cl:float
    :initform 0.0)
   (flEndX
    :reader flEndX
    :initarg :flEndX
    :type cl:float
    :initform 0.0)
   (flEndY
    :reader flEndY
    :initarg :flEndY
    :type cl:float
    :initform 0.0))
)

(cl:defclass start_end_point (<start_end_point>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <start_end_point>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'start_end_point)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name icra_nav-msg:<start_end_point> is deprecated: use icra_nav-msg:start_end_point instead.")))

(cl:ensure-generic-function 'flStartX-val :lambda-list '(m))
(cl:defmethod flStartX-val ((m <start_end_point>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader icra_nav-msg:flStartX-val is deprecated.  Use icra_nav-msg:flStartX instead.")
  (flStartX m))

(cl:ensure-generic-function 'flStartY-val :lambda-list '(m))
(cl:defmethod flStartY-val ((m <start_end_point>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader icra_nav-msg:flStartY-val is deprecated.  Use icra_nav-msg:flStartY instead.")
  (flStartY m))

(cl:ensure-generic-function 'flEndX-val :lambda-list '(m))
(cl:defmethod flEndX-val ((m <start_end_point>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader icra_nav-msg:flEndX-val is deprecated.  Use icra_nav-msg:flEndX instead.")
  (flEndX m))

(cl:ensure-generic-function 'flEndY-val :lambda-list '(m))
(cl:defmethod flEndY-val ((m <start_end_point>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader icra_nav-msg:flEndY-val is deprecated.  Use icra_nav-msg:flEndY instead.")
  (flEndY m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <start_end_point>) ostream)
  "Serializes a message object of type '<start_end_point>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'flStartX))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'flStartY))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'flEndX))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'flEndY))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <start_end_point>) istream)
  "Deserializes a message object of type '<start_end_point>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'flStartX) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'flStartY) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'flEndX) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'flEndY) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<start_end_point>)))
  "Returns string type for a message object of type '<start_end_point>"
  "icra_nav/start_end_point")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'start_end_point)))
  "Returns string type for a message object of type 'start_end_point"
  "icra_nav/start_end_point")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<start_end_point>)))
  "Returns md5sum for a message object of type '<start_end_point>"
  "7b46825f0775aab6934c6297120354ac")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'start_end_point)))
  "Returns md5sum for a message object of type 'start_end_point"
  "7b46825f0775aab6934c6297120354ac")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<start_end_point>)))
  "Returns full string definition for message of type '<start_end_point>"
  (cl:format cl:nil "float32 flStartX~%float32 flStartY~%float32 flEndX~%float32 flEndY~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'start_end_point)))
  "Returns full string definition for message of type 'start_end_point"
  (cl:format cl:nil "float32 flStartX~%float32 flStartY~%float32 flEndX~%float32 flEndY~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <start_end_point>))
  (cl:+ 0
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <start_end_point>))
  "Converts a ROS message object to a list"
  (cl:list 'start_end_point
    (cl:cons ':flStartX (flStartX msg))
    (cl:cons ':flStartY (flStartY msg))
    (cl:cons ':flEndX (flEndX msg))
    (cl:cons ':flEndY (flEndY msg))
))
