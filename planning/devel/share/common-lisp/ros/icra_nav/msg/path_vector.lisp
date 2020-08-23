; Auto-generated. Do not edit!


(cl:in-package icra_nav-msg)


;//! \htmlinclude path_vector.msg.html

(cl:defclass <path_vector> (roslisp-msg-protocol:ros-message)
  ((vfPositionX
    :reader vfPositionX
    :initarg :vfPositionX
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0))
   (vfPositionY
    :reader vfPositionY
    :initarg :vfPositionY
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass path_vector (<path_vector>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <path_vector>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'path_vector)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name icra_nav-msg:<path_vector> is deprecated: use icra_nav-msg:path_vector instead.")))

(cl:ensure-generic-function 'vfPositionX-val :lambda-list '(m))
(cl:defmethod vfPositionX-val ((m <path_vector>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader icra_nav-msg:vfPositionX-val is deprecated.  Use icra_nav-msg:vfPositionX instead.")
  (vfPositionX m))

(cl:ensure-generic-function 'vfPositionY-val :lambda-list '(m))
(cl:defmethod vfPositionY-val ((m <path_vector>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader icra_nav-msg:vfPositionY-val is deprecated.  Use icra_nav-msg:vfPositionY instead.")
  (vfPositionY m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <path_vector>) ostream)
  "Serializes a message object of type '<path_vector>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'vfPositionX))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'vfPositionX))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'vfPositionY))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'vfPositionY))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <path_vector>) istream)
  "Deserializes a message object of type '<path_vector>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'vfPositionX) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'vfPositionX)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits))))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'vfPositionY) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'vfPositionY)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<path_vector>)))
  "Returns string type for a message object of type '<path_vector>"
  "icra_nav/path_vector")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'path_vector)))
  "Returns string type for a message object of type 'path_vector"
  "icra_nav/path_vector")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<path_vector>)))
  "Returns md5sum for a message object of type '<path_vector>"
  "e633e5e50a58ce55b89c873561d948a7")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'path_vector)))
  "Returns md5sum for a message object of type 'path_vector"
  "e633e5e50a58ce55b89c873561d948a7")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<path_vector>)))
  "Returns full string definition for message of type '<path_vector>"
  (cl:format cl:nil "float32[] vfPositionX~%float32[] vfPositionY~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'path_vector)))
  "Returns full string definition for message of type 'path_vector"
  (cl:format cl:nil "float32[] vfPositionX~%float32[] vfPositionY~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <path_vector>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'vfPositionX) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'vfPositionY) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <path_vector>))
  "Converts a ROS message object to a list"
  (cl:list 'path_vector
    (cl:cons ':vfPositionX (vfPositionX msg))
    (cl:cons ':vfPositionY (vfPositionY msg))
))
