; Auto-generated. Do not edit!


(cl:in-package roborts_msgs-srv)


;//! \htmlinclude GimbalMode-request.msg.html

(cl:defclass <GimbalMode-request> (roslisp-msg-protocol:ros-message)
  ((gimbal_mode
    :reader gimbal_mode
    :initarg :gimbal_mode
    :type cl:fixnum
    :initform 0))
)

(cl:defclass GimbalMode-request (<GimbalMode-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GimbalMode-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GimbalMode-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name roborts_msgs-srv:<GimbalMode-request> is deprecated: use roborts_msgs-srv:GimbalMode-request instead.")))

(cl:ensure-generic-function 'gimbal_mode-val :lambda-list '(m))
(cl:defmethod gimbal_mode-val ((m <GimbalMode-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader roborts_msgs-srv:gimbal_mode-val is deprecated.  Use roborts_msgs-srv:gimbal_mode instead.")
  (gimbal_mode m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GimbalMode-request>) ostream)
  "Serializes a message object of type '<GimbalMode-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'gimbal_mode)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GimbalMode-request>) istream)
  "Deserializes a message object of type '<GimbalMode-request>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'gimbal_mode)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GimbalMode-request>)))
  "Returns string type for a service object of type '<GimbalMode-request>"
  "roborts_msgs/GimbalModeRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GimbalMode-request)))
  "Returns string type for a service object of type 'GimbalMode-request"
  "roborts_msgs/GimbalModeRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GimbalMode-request>)))
  "Returns md5sum for a message object of type '<GimbalMode-request>"
  "fcba9db77a7e7488758d65b81c19e513")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GimbalMode-request)))
  "Returns md5sum for a message object of type 'GimbalMode-request"
  "fcba9db77a7e7488758d65b81c19e513")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GimbalMode-request>)))
  "Returns full string definition for message of type '<GimbalMode-request>"
  (cl:format cl:nil "uint8 gimbal_mode~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GimbalMode-request)))
  "Returns full string definition for message of type 'GimbalMode-request"
  (cl:format cl:nil "uint8 gimbal_mode~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GimbalMode-request>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GimbalMode-request>))
  "Converts a ROS message object to a list"
  (cl:list 'GimbalMode-request
    (cl:cons ':gimbal_mode (gimbal_mode msg))
))
;//! \htmlinclude GimbalMode-response.msg.html

(cl:defclass <GimbalMode-response> (roslisp-msg-protocol:ros-message)
  ((received
    :reader received
    :initarg :received
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass GimbalMode-response (<GimbalMode-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GimbalMode-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GimbalMode-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name roborts_msgs-srv:<GimbalMode-response> is deprecated: use roborts_msgs-srv:GimbalMode-response instead.")))

(cl:ensure-generic-function 'received-val :lambda-list '(m))
(cl:defmethod received-val ((m <GimbalMode-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader roborts_msgs-srv:received-val is deprecated.  Use roborts_msgs-srv:received instead.")
  (received m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GimbalMode-response>) ostream)
  "Serializes a message object of type '<GimbalMode-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'received) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GimbalMode-response>) istream)
  "Deserializes a message object of type '<GimbalMode-response>"
    (cl:setf (cl:slot-value msg 'received) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GimbalMode-response>)))
  "Returns string type for a service object of type '<GimbalMode-response>"
  "roborts_msgs/GimbalModeResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GimbalMode-response)))
  "Returns string type for a service object of type 'GimbalMode-response"
  "roborts_msgs/GimbalModeResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GimbalMode-response>)))
  "Returns md5sum for a message object of type '<GimbalMode-response>"
  "fcba9db77a7e7488758d65b81c19e513")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GimbalMode-response)))
  "Returns md5sum for a message object of type 'GimbalMode-response"
  "fcba9db77a7e7488758d65b81c19e513")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GimbalMode-response>)))
  "Returns full string definition for message of type '<GimbalMode-response>"
  (cl:format cl:nil "bool received~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GimbalMode-response)))
  "Returns full string definition for message of type 'GimbalMode-response"
  (cl:format cl:nil "bool received~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GimbalMode-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GimbalMode-response>))
  "Converts a ROS message object to a list"
  (cl:list 'GimbalMode-response
    (cl:cons ':received (received msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'GimbalMode)))
  'GimbalMode-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'GimbalMode)))
  'GimbalMode-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GimbalMode)))
  "Returns string type for a service object of type '<GimbalMode>"
  "roborts_msgs/GimbalMode")