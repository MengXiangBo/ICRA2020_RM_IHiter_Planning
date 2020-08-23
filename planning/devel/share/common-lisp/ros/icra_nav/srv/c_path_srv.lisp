; Auto-generated. Do not edit!


(cl:in-package icra_nav-srv)


;//! \htmlinclude c_path_srv-request.msg.html

(cl:defclass <c_path_srv-request> (roslisp-msg-protocol:ros-message)
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
   (vfConstraintPositionX
    :reader vfConstraintPositionX
    :initarg :vfConstraintPositionX
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0))
   (vfConstraintPositionY
    :reader vfConstraintPositionY
    :initarg :vfConstraintPositionY
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass c_path_srv-request (<c_path_srv-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <c_path_srv-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'c_path_srv-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name icra_nav-srv:<c_path_srv-request> is deprecated: use icra_nav-srv:c_path_srv-request instead.")))

(cl:ensure-generic-function 'vfPathPositionX-val :lambda-list '(m))
(cl:defmethod vfPathPositionX-val ((m <c_path_srv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader icra_nav-srv:vfPathPositionX-val is deprecated.  Use icra_nav-srv:vfPathPositionX instead.")
  (vfPathPositionX m))

(cl:ensure-generic-function 'vfPathPositionY-val :lambda-list '(m))
(cl:defmethod vfPathPositionY-val ((m <c_path_srv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader icra_nav-srv:vfPathPositionY-val is deprecated.  Use icra_nav-srv:vfPathPositionY instead.")
  (vfPathPositionY m))

(cl:ensure-generic-function 'vfConstraintPositionX-val :lambda-list '(m))
(cl:defmethod vfConstraintPositionX-val ((m <c_path_srv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader icra_nav-srv:vfConstraintPositionX-val is deprecated.  Use icra_nav-srv:vfConstraintPositionX instead.")
  (vfConstraintPositionX m))

(cl:ensure-generic-function 'vfConstraintPositionY-val :lambda-list '(m))
(cl:defmethod vfConstraintPositionY-val ((m <c_path_srv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader icra_nav-srv:vfConstraintPositionY-val is deprecated.  Use icra_nav-srv:vfConstraintPositionY instead.")
  (vfConstraintPositionY m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <c_path_srv-request>) ostream)
  "Serializes a message object of type '<c_path_srv-request>"
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
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'vfConstraintPositionX))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'vfConstraintPositionX))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'vfConstraintPositionY))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'vfConstraintPositionY))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <c_path_srv-request>) istream)
  "Deserializes a message object of type '<c_path_srv-request>"
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
  (cl:setf (cl:slot-value msg 'vfConstraintPositionX) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'vfConstraintPositionX)))
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
  (cl:setf (cl:slot-value msg 'vfConstraintPositionY) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'vfConstraintPositionY)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<c_path_srv-request>)))
  "Returns string type for a service object of type '<c_path_srv-request>"
  "icra_nav/c_path_srvRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'c_path_srv-request)))
  "Returns string type for a service object of type 'c_path_srv-request"
  "icra_nav/c_path_srvRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<c_path_srv-request>)))
  "Returns md5sum for a message object of type '<c_path_srv-request>"
  "f1e3a6001bed64b556a690d0f407f1c9")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'c_path_srv-request)))
  "Returns md5sum for a message object of type 'c_path_srv-request"
  "f1e3a6001bed64b556a690d0f407f1c9")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<c_path_srv-request>)))
  "Returns full string definition for message of type '<c_path_srv-request>"
  (cl:format cl:nil "float32[] vfPathPositionX~%float32[] vfPathPositionY~%float32[] vfConstraintPositionX~%float32[] vfConstraintPositionY~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'c_path_srv-request)))
  "Returns full string definition for message of type 'c_path_srv-request"
  (cl:format cl:nil "float32[] vfPathPositionX~%float32[] vfPathPositionY~%float32[] vfConstraintPositionX~%float32[] vfConstraintPositionY~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <c_path_srv-request>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'vfPathPositionX) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'vfPathPositionY) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'vfConstraintPositionX) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'vfConstraintPositionY) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <c_path_srv-request>))
  "Converts a ROS message object to a list"
  (cl:list 'c_path_srv-request
    (cl:cons ':vfPathPositionX (vfPathPositionX msg))
    (cl:cons ':vfPathPositionY (vfPathPositionY msg))
    (cl:cons ':vfConstraintPositionX (vfConstraintPositionX msg))
    (cl:cons ':vfConstraintPositionY (vfConstraintPositionY msg))
))
;//! \htmlinclude c_path_srv-response.msg.html

(cl:defclass <c_path_srv-response> (roslisp-msg-protocol:ros-message)
  ((boSuccess
    :reader boSuccess
    :initarg :boSuccess
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass c_path_srv-response (<c_path_srv-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <c_path_srv-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'c_path_srv-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name icra_nav-srv:<c_path_srv-response> is deprecated: use icra_nav-srv:c_path_srv-response instead.")))

(cl:ensure-generic-function 'boSuccess-val :lambda-list '(m))
(cl:defmethod boSuccess-val ((m <c_path_srv-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader icra_nav-srv:boSuccess-val is deprecated.  Use icra_nav-srv:boSuccess instead.")
  (boSuccess m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <c_path_srv-response>) ostream)
  "Serializes a message object of type '<c_path_srv-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'boSuccess) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <c_path_srv-response>) istream)
  "Deserializes a message object of type '<c_path_srv-response>"
    (cl:setf (cl:slot-value msg 'boSuccess) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<c_path_srv-response>)))
  "Returns string type for a service object of type '<c_path_srv-response>"
  "icra_nav/c_path_srvResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'c_path_srv-response)))
  "Returns string type for a service object of type 'c_path_srv-response"
  "icra_nav/c_path_srvResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<c_path_srv-response>)))
  "Returns md5sum for a message object of type '<c_path_srv-response>"
  "f1e3a6001bed64b556a690d0f407f1c9")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'c_path_srv-response)))
  "Returns md5sum for a message object of type 'c_path_srv-response"
  "f1e3a6001bed64b556a690d0f407f1c9")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<c_path_srv-response>)))
  "Returns full string definition for message of type '<c_path_srv-response>"
  (cl:format cl:nil "bool boSuccess~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'c_path_srv-response)))
  "Returns full string definition for message of type 'c_path_srv-response"
  (cl:format cl:nil "bool boSuccess~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <c_path_srv-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <c_path_srv-response>))
  "Converts a ROS message object to a list"
  (cl:list 'c_path_srv-response
    (cl:cons ':boSuccess (boSuccess msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'c_path_srv)))
  'c_path_srv-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'c_path_srv)))
  'c_path_srv-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'c_path_srv)))
  "Returns string type for a service object of type '<c_path_srv>"
  "icra_nav/c_path_srv")