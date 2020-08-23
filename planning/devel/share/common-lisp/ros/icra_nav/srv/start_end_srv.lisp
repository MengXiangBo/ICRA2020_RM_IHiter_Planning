; Auto-generated. Do not edit!


(cl:in-package icra_nav-srv)


;//! \htmlinclude start_end_srv-request.msg.html

(cl:defclass <start_end_srv-request> (roslisp-msg-protocol:ros-message)
  ((flPathStartX
    :reader flPathStartX
    :initarg :flPathStartX
    :type cl:float
    :initform 0.0)
   (flPathStartY
    :reader flPathStartY
    :initarg :flPathStartY
    :type cl:float
    :initform 0.0)
   (flPathEndX
    :reader flPathEndX
    :initarg :flPathEndX
    :type cl:float
    :initform 0.0)
   (flPathEndY
    :reader flPathEndY
    :initarg :flPathEndY
    :type cl:float
    :initform 0.0))
)

(cl:defclass start_end_srv-request (<start_end_srv-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <start_end_srv-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'start_end_srv-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name icra_nav-srv:<start_end_srv-request> is deprecated: use icra_nav-srv:start_end_srv-request instead.")))

(cl:ensure-generic-function 'flPathStartX-val :lambda-list '(m))
(cl:defmethod flPathStartX-val ((m <start_end_srv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader icra_nav-srv:flPathStartX-val is deprecated.  Use icra_nav-srv:flPathStartX instead.")
  (flPathStartX m))

(cl:ensure-generic-function 'flPathStartY-val :lambda-list '(m))
(cl:defmethod flPathStartY-val ((m <start_end_srv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader icra_nav-srv:flPathStartY-val is deprecated.  Use icra_nav-srv:flPathStartY instead.")
  (flPathStartY m))

(cl:ensure-generic-function 'flPathEndX-val :lambda-list '(m))
(cl:defmethod flPathEndX-val ((m <start_end_srv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader icra_nav-srv:flPathEndX-val is deprecated.  Use icra_nav-srv:flPathEndX instead.")
  (flPathEndX m))

(cl:ensure-generic-function 'flPathEndY-val :lambda-list '(m))
(cl:defmethod flPathEndY-val ((m <start_end_srv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader icra_nav-srv:flPathEndY-val is deprecated.  Use icra_nav-srv:flPathEndY instead.")
  (flPathEndY m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <start_end_srv-request>) ostream)
  "Serializes a message object of type '<start_end_srv-request>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'flPathStartX))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'flPathStartY))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'flPathEndX))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'flPathEndY))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <start_end_srv-request>) istream)
  "Deserializes a message object of type '<start_end_srv-request>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'flPathStartX) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'flPathStartY) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'flPathEndX) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'flPathEndY) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<start_end_srv-request>)))
  "Returns string type for a service object of type '<start_end_srv-request>"
  "icra_nav/start_end_srvRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'start_end_srv-request)))
  "Returns string type for a service object of type 'start_end_srv-request"
  "icra_nav/start_end_srvRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<start_end_srv-request>)))
  "Returns md5sum for a message object of type '<start_end_srv-request>"
  "276ffc8a587afd4c10db6438819f07e3")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'start_end_srv-request)))
  "Returns md5sum for a message object of type 'start_end_srv-request"
  "276ffc8a587afd4c10db6438819f07e3")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<start_end_srv-request>)))
  "Returns full string definition for message of type '<start_end_srv-request>"
  (cl:format cl:nil "float32 flPathStartX~%float32 flPathStartY~%float32 flPathEndX~%float32 flPathEndY~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'start_end_srv-request)))
  "Returns full string definition for message of type 'start_end_srv-request"
  (cl:format cl:nil "float32 flPathStartX~%float32 flPathStartY~%float32 flPathEndX~%float32 flPathEndY~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <start_end_srv-request>))
  (cl:+ 0
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <start_end_srv-request>))
  "Converts a ROS message object to a list"
  (cl:list 'start_end_srv-request
    (cl:cons ':flPathStartX (flPathStartX msg))
    (cl:cons ':flPathStartY (flPathStartY msg))
    (cl:cons ':flPathEndX (flPathEndX msg))
    (cl:cons ':flPathEndY (flPathEndY msg))
))
;//! \htmlinclude start_end_srv-response.msg.html

(cl:defclass <start_end_srv-response> (roslisp-msg-protocol:ros-message)
  ((boSuccess
    :reader boSuccess
    :initarg :boSuccess
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass start_end_srv-response (<start_end_srv-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <start_end_srv-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'start_end_srv-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name icra_nav-srv:<start_end_srv-response> is deprecated: use icra_nav-srv:start_end_srv-response instead.")))

(cl:ensure-generic-function 'boSuccess-val :lambda-list '(m))
(cl:defmethod boSuccess-val ((m <start_end_srv-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader icra_nav-srv:boSuccess-val is deprecated.  Use icra_nav-srv:boSuccess instead.")
  (boSuccess m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <start_end_srv-response>) ostream)
  "Serializes a message object of type '<start_end_srv-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'boSuccess) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <start_end_srv-response>) istream)
  "Deserializes a message object of type '<start_end_srv-response>"
    (cl:setf (cl:slot-value msg 'boSuccess) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<start_end_srv-response>)))
  "Returns string type for a service object of type '<start_end_srv-response>"
  "icra_nav/start_end_srvResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'start_end_srv-response)))
  "Returns string type for a service object of type 'start_end_srv-response"
  "icra_nav/start_end_srvResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<start_end_srv-response>)))
  "Returns md5sum for a message object of type '<start_end_srv-response>"
  "276ffc8a587afd4c10db6438819f07e3")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'start_end_srv-response)))
  "Returns md5sum for a message object of type 'start_end_srv-response"
  "276ffc8a587afd4c10db6438819f07e3")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<start_end_srv-response>)))
  "Returns full string definition for message of type '<start_end_srv-response>"
  (cl:format cl:nil "bool boSuccess~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'start_end_srv-response)))
  "Returns full string definition for message of type 'start_end_srv-response"
  (cl:format cl:nil "bool boSuccess~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <start_end_srv-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <start_end_srv-response>))
  "Converts a ROS message object to a list"
  (cl:list 'start_end_srv-response
    (cl:cons ':boSuccess (boSuccess msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'start_end_srv)))
  'start_end_srv-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'start_end_srv)))
  'start_end_srv-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'start_end_srv)))
  "Returns string type for a service object of type '<start_end_srv>"
  "icra_nav/start_end_srv")