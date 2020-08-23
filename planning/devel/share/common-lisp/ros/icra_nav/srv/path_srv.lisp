; Auto-generated. Do not edit!


(cl:in-package icra_nav-srv)


;//! \htmlinclude path_srv-request.msg.html

(cl:defclass <path_srv-request> (roslisp-msg-protocol:ros-message)
  ((vfPathPositionX
    :reader vfPathPositionX
    :initarg :vfPathPositionX
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0))
   (vfPathPositionY
    :reader vfPathPositionY
    :initarg :vfPathPositionY
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0))
   (viPathIndex
    :reader viPathIndex
    :initarg :viPathIndex
    :type (cl:vector cl:integer)
   :initform (cl:make-array 0 :element-type 'cl:integer :initial-element 0)))
)

(cl:defclass path_srv-request (<path_srv-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <path_srv-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'path_srv-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name icra_nav-srv:<path_srv-request> is deprecated: use icra_nav-srv:path_srv-request instead.")))

(cl:ensure-generic-function 'vfPathPositionX-val :lambda-list '(m))
(cl:defmethod vfPathPositionX-val ((m <path_srv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader icra_nav-srv:vfPathPositionX-val is deprecated.  Use icra_nav-srv:vfPathPositionX instead.")
  (vfPathPositionX m))

(cl:ensure-generic-function 'vfPathPositionY-val :lambda-list '(m))
(cl:defmethod vfPathPositionY-val ((m <path_srv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader icra_nav-srv:vfPathPositionY-val is deprecated.  Use icra_nav-srv:vfPathPositionY instead.")
  (vfPathPositionY m))

(cl:ensure-generic-function 'viPathIndex-val :lambda-list '(m))
(cl:defmethod viPathIndex-val ((m <path_srv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader icra_nav-srv:viPathIndex-val is deprecated.  Use icra_nav-srv:viPathIndex instead.")
  (viPathIndex m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <path_srv-request>) ostream)
  "Serializes a message object of type '<path_srv-request>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'vfPathPositionX))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'vfPathPositionX))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'vfPathPositionY))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'vfPathPositionY))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'viPathIndex))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:write-byte (cl:ldb (cl:byte 8 0) ele) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) ele) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) ele) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) ele) ostream))
   (cl:slot-value msg 'viPathIndex))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <path_srv-request>) istream)
  "Deserializes a message object of type '<path_srv-request>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'vfPathPositionX) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'vfPathPositionX)))
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
  (cl:setf (cl:slot-value msg 'vfPathPositionY) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'vfPathPositionY)))
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
  (cl:setf (cl:slot-value msg 'viPathIndex) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'viPathIndex)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:aref vals i)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:aref vals i)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:aref vals i)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:aref vals i)) (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<path_srv-request>)))
  "Returns string type for a service object of type '<path_srv-request>"
  "icra_nav/path_srvRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'path_srv-request)))
  "Returns string type for a service object of type 'path_srv-request"
  "icra_nav/path_srvRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<path_srv-request>)))
  "Returns md5sum for a message object of type '<path_srv-request>"
  "9252540c61646001ef1bfd31da90b1cc")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'path_srv-request)))
  "Returns md5sum for a message object of type 'path_srv-request"
  "9252540c61646001ef1bfd31da90b1cc")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<path_srv-request>)))
  "Returns full string definition for message of type '<path_srv-request>"
  (cl:format cl:nil "float32[] vfPathPositionX~%float32[] vfPathPositionY~%uint32[] viPathIndex~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'path_srv-request)))
  "Returns full string definition for message of type 'path_srv-request"
  (cl:format cl:nil "float32[] vfPathPositionX~%float32[] vfPathPositionY~%uint32[] viPathIndex~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <path_srv-request>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'vfPathPositionX) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'vfPathPositionY) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'viPathIndex) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <path_srv-request>))
  "Converts a ROS message object to a list"
  (cl:list 'path_srv-request
    (cl:cons ':vfPathPositionX (vfPathPositionX msg))
    (cl:cons ':vfPathPositionY (vfPathPositionY msg))
    (cl:cons ':viPathIndex (viPathIndex msg))
))
;//! \htmlinclude path_srv-response.msg.html

(cl:defclass <path_srv-response> (roslisp-msg-protocol:ros-message)
  ((boSuccess
    :reader boSuccess
    :initarg :boSuccess
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass path_srv-response (<path_srv-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <path_srv-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'path_srv-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name icra_nav-srv:<path_srv-response> is deprecated: use icra_nav-srv:path_srv-response instead.")))

(cl:ensure-generic-function 'boSuccess-val :lambda-list '(m))
(cl:defmethod boSuccess-val ((m <path_srv-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader icra_nav-srv:boSuccess-val is deprecated.  Use icra_nav-srv:boSuccess instead.")
  (boSuccess m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <path_srv-response>) ostream)
  "Serializes a message object of type '<path_srv-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'boSuccess) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <path_srv-response>) istream)
  "Deserializes a message object of type '<path_srv-response>"
    (cl:setf (cl:slot-value msg 'boSuccess) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<path_srv-response>)))
  "Returns string type for a service object of type '<path_srv-response>"
  "icra_nav/path_srvResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'path_srv-response)))
  "Returns string type for a service object of type 'path_srv-response"
  "icra_nav/path_srvResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<path_srv-response>)))
  "Returns md5sum for a message object of type '<path_srv-response>"
  "9252540c61646001ef1bfd31da90b1cc")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'path_srv-response)))
  "Returns md5sum for a message object of type 'path_srv-response"
  "9252540c61646001ef1bfd31da90b1cc")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<path_srv-response>)))
  "Returns full string definition for message of type '<path_srv-response>"
  (cl:format cl:nil "bool boSuccess~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'path_srv-response)))
  "Returns full string definition for message of type 'path_srv-response"
  (cl:format cl:nil "bool boSuccess~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <path_srv-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <path_srv-response>))
  "Converts a ROS message object to a list"
  (cl:list 'path_srv-response
    (cl:cons ':boSuccess (boSuccess msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'path_srv)))
  'path_srv-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'path_srv)))
  'path_srv-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'path_srv)))
  "Returns string type for a service object of type '<path_srv>"
  "icra_nav/path_srv")