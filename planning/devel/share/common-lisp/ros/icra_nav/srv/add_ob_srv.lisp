; Auto-generated. Do not edit!


(cl:in-package icra_nav-srv)


;//! \htmlinclude add_ob_srv-request.msg.html

(cl:defclass <add_ob_srv-request> (roslisp-msg-protocol:ros-message)
  ((inFrom
    :reader inFrom
    :initarg :inFrom
    :type cl:integer
    :initform 0)
   (inTo
    :reader inTo
    :initarg :inTo
    :type cl:integer
    :initform 0)
   (flObstacleX
    :reader flObstacleX
    :initarg :flObstacleX
    :type cl:float
    :initform 0.0)
   (flObstacleY
    :reader flObstacleY
    :initarg :flObstacleY
    :type cl:float
    :initform 0.0))
)

(cl:defclass add_ob_srv-request (<add_ob_srv-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <add_ob_srv-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'add_ob_srv-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name icra_nav-srv:<add_ob_srv-request> is deprecated: use icra_nav-srv:add_ob_srv-request instead.")))

(cl:ensure-generic-function 'inFrom-val :lambda-list '(m))
(cl:defmethod inFrom-val ((m <add_ob_srv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader icra_nav-srv:inFrom-val is deprecated.  Use icra_nav-srv:inFrom instead.")
  (inFrom m))

(cl:ensure-generic-function 'inTo-val :lambda-list '(m))
(cl:defmethod inTo-val ((m <add_ob_srv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader icra_nav-srv:inTo-val is deprecated.  Use icra_nav-srv:inTo instead.")
  (inTo m))

(cl:ensure-generic-function 'flObstacleX-val :lambda-list '(m))
(cl:defmethod flObstacleX-val ((m <add_ob_srv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader icra_nav-srv:flObstacleX-val is deprecated.  Use icra_nav-srv:flObstacleX instead.")
  (flObstacleX m))

(cl:ensure-generic-function 'flObstacleY-val :lambda-list '(m))
(cl:defmethod flObstacleY-val ((m <add_ob_srv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader icra_nav-srv:flObstacleY-val is deprecated.  Use icra_nav-srv:flObstacleY instead.")
  (flObstacleY m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <add_ob_srv-request>) ostream)
  "Serializes a message object of type '<add_ob_srv-request>"
  (cl:let* ((signed (cl:slot-value msg 'inFrom)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'inTo)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'flObstacleX))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'flObstacleY))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <add_ob_srv-request>) istream)
  "Deserializes a message object of type '<add_ob_srv-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'inFrom) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'inTo) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'flObstacleX) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'flObstacleY) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<add_ob_srv-request>)))
  "Returns string type for a service object of type '<add_ob_srv-request>"
  "icra_nav/add_ob_srvRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'add_ob_srv-request)))
  "Returns string type for a service object of type 'add_ob_srv-request"
  "icra_nav/add_ob_srvRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<add_ob_srv-request>)))
  "Returns md5sum for a message object of type '<add_ob_srv-request>"
  "af88fad9fb4ff2ed0a7581060e7c41e9")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'add_ob_srv-request)))
  "Returns md5sum for a message object of type 'add_ob_srv-request"
  "af88fad9fb4ff2ed0a7581060e7c41e9")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<add_ob_srv-request>)))
  "Returns full string definition for message of type '<add_ob_srv-request>"
  (cl:format cl:nil "int32 inFrom~%int32 inTo~%float32 flObstacleX~%float32 flObstacleY~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'add_ob_srv-request)))
  "Returns full string definition for message of type 'add_ob_srv-request"
  (cl:format cl:nil "int32 inFrom~%int32 inTo~%float32 flObstacleX~%float32 flObstacleY~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <add_ob_srv-request>))
  (cl:+ 0
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <add_ob_srv-request>))
  "Converts a ROS message object to a list"
  (cl:list 'add_ob_srv-request
    (cl:cons ':inFrom (inFrom msg))
    (cl:cons ':inTo (inTo msg))
    (cl:cons ':flObstacleX (flObstacleX msg))
    (cl:cons ':flObstacleY (flObstacleY msg))
))
;//! \htmlinclude add_ob_srv-response.msg.html

(cl:defclass <add_ob_srv-response> (roslisp-msg-protocol:ros-message)
  ((boSuccess
    :reader boSuccess
    :initarg :boSuccess
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass add_ob_srv-response (<add_ob_srv-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <add_ob_srv-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'add_ob_srv-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name icra_nav-srv:<add_ob_srv-response> is deprecated: use icra_nav-srv:add_ob_srv-response instead.")))

(cl:ensure-generic-function 'boSuccess-val :lambda-list '(m))
(cl:defmethod boSuccess-val ((m <add_ob_srv-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader icra_nav-srv:boSuccess-val is deprecated.  Use icra_nav-srv:boSuccess instead.")
  (boSuccess m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <add_ob_srv-response>) ostream)
  "Serializes a message object of type '<add_ob_srv-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'boSuccess) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <add_ob_srv-response>) istream)
  "Deserializes a message object of type '<add_ob_srv-response>"
    (cl:setf (cl:slot-value msg 'boSuccess) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<add_ob_srv-response>)))
  "Returns string type for a service object of type '<add_ob_srv-response>"
  "icra_nav/add_ob_srvResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'add_ob_srv-response)))
  "Returns string type for a service object of type 'add_ob_srv-response"
  "icra_nav/add_ob_srvResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<add_ob_srv-response>)))
  "Returns md5sum for a message object of type '<add_ob_srv-response>"
  "af88fad9fb4ff2ed0a7581060e7c41e9")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'add_ob_srv-response)))
  "Returns md5sum for a message object of type 'add_ob_srv-response"
  "af88fad9fb4ff2ed0a7581060e7c41e9")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<add_ob_srv-response>)))
  "Returns full string definition for message of type '<add_ob_srv-response>"
  (cl:format cl:nil "bool boSuccess~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'add_ob_srv-response)))
  "Returns full string definition for message of type 'add_ob_srv-response"
  (cl:format cl:nil "bool boSuccess~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <add_ob_srv-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <add_ob_srv-response>))
  "Converts a ROS message object to a list"
  (cl:list 'add_ob_srv-response
    (cl:cons ':boSuccess (boSuccess msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'add_ob_srv)))
  'add_ob_srv-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'add_ob_srv)))
  'add_ob_srv-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'add_ob_srv)))
  "Returns string type for a service object of type '<add_ob_srv>"
  "icra_nav/add_ob_srv")