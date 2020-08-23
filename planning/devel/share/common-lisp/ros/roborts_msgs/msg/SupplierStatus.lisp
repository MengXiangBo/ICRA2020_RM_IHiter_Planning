; Auto-generated. Do not edit!


(cl:in-package roborts_msgs-msg)


;//! \htmlinclude SupplierStatus.msg.html

(cl:defclass <SupplierStatus> (roslisp-msg-protocol:ros-message)
  ((status
    :reader status
    :initarg :status
    :type cl:fixnum
    :initform 0))
)

(cl:defclass SupplierStatus (<SupplierStatus>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SupplierStatus>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SupplierStatus)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name roborts_msgs-msg:<SupplierStatus> is deprecated: use roborts_msgs-msg:SupplierStatus instead.")))

(cl:ensure-generic-function 'status-val :lambda-list '(m))
(cl:defmethod status-val ((m <SupplierStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader roborts_msgs-msg:status-val is deprecated.  Use roborts_msgs-msg:status instead.")
  (status m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<SupplierStatus>)))
    "Constants for message type '<SupplierStatus>"
  '((:CLOSE . 0)
    (:PREPARING . 1)
    (:SUPPLYING . 2))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'SupplierStatus)))
    "Constants for message type 'SupplierStatus"
  '((:CLOSE . 0)
    (:PREPARING . 1)
    (:SUPPLYING . 2))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SupplierStatus>) ostream)
  "Serializes a message object of type '<SupplierStatus>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'status)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SupplierStatus>) istream)
  "Deserializes a message object of type '<SupplierStatus>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'status)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SupplierStatus>)))
  "Returns string type for a message object of type '<SupplierStatus>"
  "roborts_msgs/SupplierStatus")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SupplierStatus)))
  "Returns string type for a message object of type 'SupplierStatus"
  "roborts_msgs/SupplierStatus")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SupplierStatus>)))
  "Returns md5sum for a message object of type '<SupplierStatus>"
  "81f3d032e85b689acf259876e6f8d051")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SupplierStatus)))
  "Returns md5sum for a message object of type 'SupplierStatus"
  "81f3d032e85b689acf259876e6f8d051")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SupplierStatus>)))
  "Returns full string definition for message of type '<SupplierStatus>"
  (cl:format cl:nil "#supplier status~%uint8 CLOSE = 0~%uint8 PREPARING = 1~%uint8 SUPPLYING = 2~%uint8 status~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SupplierStatus)))
  "Returns full string definition for message of type 'SupplierStatus"
  (cl:format cl:nil "#supplier status~%uint8 CLOSE = 0~%uint8 PREPARING = 1~%uint8 SUPPLYING = 2~%uint8 status~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SupplierStatus>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SupplierStatus>))
  "Converts a ROS message object to a list"
  (cl:list 'SupplierStatus
    (cl:cons ':status (status msg))
))
