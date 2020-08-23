; Auto-generated. Do not edit!


(cl:in-package icra_nav-msg)


;//! \htmlinclude punish.msg.html

(cl:defclass <punish> (roslisp-msg-protocol:ros-message)
  ((viPunishAreas
    :reader viPunishAreas
    :initarg :viPunishAreas
    :type (cl:vector cl:integer)
   :initform (cl:make-array 0 :element-type 'cl:integer :initial-element 0)))
)

(cl:defclass punish (<punish>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <punish>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'punish)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name icra_nav-msg:<punish> is deprecated: use icra_nav-msg:punish instead.")))

(cl:ensure-generic-function 'viPunishAreas-val :lambda-list '(m))
(cl:defmethod viPunishAreas-val ((m <punish>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader icra_nav-msg:viPunishAreas-val is deprecated.  Use icra_nav-msg:viPunishAreas instead.")
  (viPunishAreas m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <punish>) ostream)
  "Serializes a message object of type '<punish>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'viPunishAreas))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    ))
   (cl:slot-value msg 'viPunishAreas))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <punish>) istream)
  "Deserializes a message object of type '<punish>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'viPunishAreas) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'viPunishAreas)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296)))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<punish>)))
  "Returns string type for a message object of type '<punish>"
  "icra_nav/punish")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'punish)))
  "Returns string type for a message object of type 'punish"
  "icra_nav/punish")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<punish>)))
  "Returns md5sum for a message object of type '<punish>"
  "901ef32caa07726292504b26e2c68f0d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'punish)))
  "Returns md5sum for a message object of type 'punish"
  "901ef32caa07726292504b26e2c68f0d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<punish>)))
  "Returns full string definition for message of type '<punish>"
  (cl:format cl:nil "int32[] viPunishAreas~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'punish)))
  "Returns full string definition for message of type 'punish"
  (cl:format cl:nil "int32[] viPunishAreas~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <punish>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'viPunishAreas) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <punish>))
  "Converts a ROS message object to a list"
  (cl:list 'punish
    (cl:cons ':viPunishAreas (viPunishAreas msg))
))
