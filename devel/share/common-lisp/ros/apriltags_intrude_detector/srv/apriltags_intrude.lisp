; Auto-generated. Do not edit!


(cl:in-package apriltags_intrude_detector-srv)


;//! \htmlinclude apriltags_intrude-request.msg.html

(cl:defclass <apriltags_intrude-request> (roslisp-msg-protocol:ros-message)
  ((x
    :reader x
    :initarg :x
    :type cl:float
    :initform 0.0)
   (y
    :reader y
    :initarg :y
    :type cl:float
    :initform 0.0))
)

(cl:defclass apriltags_intrude-request (<apriltags_intrude-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <apriltags_intrude-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'apriltags_intrude-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name apriltags_intrude_detector-srv:<apriltags_intrude-request> is deprecated: use apriltags_intrude_detector-srv:apriltags_intrude-request instead.")))

(cl:ensure-generic-function 'x-val :lambda-list '(m))
(cl:defmethod x-val ((m <apriltags_intrude-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader apriltags_intrude_detector-srv:x-val is deprecated.  Use apriltags_intrude_detector-srv:x instead.")
  (x m))

(cl:ensure-generic-function 'y-val :lambda-list '(m))
(cl:defmethod y-val ((m <apriltags_intrude-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader apriltags_intrude_detector-srv:y-val is deprecated.  Use apriltags_intrude_detector-srv:y instead.")
  (y m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <apriltags_intrude-request>) ostream)
  "Serializes a message object of type '<apriltags_intrude-request>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <apriltags_intrude-request>) istream)
  "Deserializes a message object of type '<apriltags_intrude-request>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'x) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'y) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<apriltags_intrude-request>)))
  "Returns string type for a service object of type '<apriltags_intrude-request>"
  "apriltags_intrude_detector/apriltags_intrudeRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'apriltags_intrude-request)))
  "Returns string type for a service object of type 'apriltags_intrude-request"
  "apriltags_intrude_detector/apriltags_intrudeRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<apriltags_intrude-request>)))
  "Returns md5sum for a message object of type '<apriltags_intrude-request>"
  "443a09552f8457c3ab7679cc90f2c84e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'apriltags_intrude-request)))
  "Returns md5sum for a message object of type 'apriltags_intrude-request"
  "443a09552f8457c3ab7679cc90f2c84e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<apriltags_intrude-request>)))
  "Returns full string definition for message of type '<apriltags_intrude-request>"
  (cl:format cl:nil "float32 x~%float32 y~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'apriltags_intrude-request)))
  "Returns full string definition for message of type 'apriltags_intrude-request"
  (cl:format cl:nil "float32 x~%float32 y~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <apriltags_intrude-request>))
  (cl:+ 0
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <apriltags_intrude-request>))
  "Converts a ROS message object to a list"
  (cl:list 'apriltags_intrude-request
    (cl:cons ':x (x msg))
    (cl:cons ':y (y msg))
))
;//! \htmlinclude apriltags_intrude-response.msg.html

(cl:defclass <apriltags_intrude-response> (roslisp-msg-protocol:ros-message)
  ((id
    :reader id
    :initarg :id
    :type cl:fixnum
    :initform 0))
)

(cl:defclass apriltags_intrude-response (<apriltags_intrude-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <apriltags_intrude-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'apriltags_intrude-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name apriltags_intrude_detector-srv:<apriltags_intrude-response> is deprecated: use apriltags_intrude_detector-srv:apriltags_intrude-response instead.")))

(cl:ensure-generic-function 'id-val :lambda-list '(m))
(cl:defmethod id-val ((m <apriltags_intrude-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader apriltags_intrude_detector-srv:id-val is deprecated.  Use apriltags_intrude_detector-srv:id instead.")
  (id m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <apriltags_intrude-response>) ostream)
  "Serializes a message object of type '<apriltags_intrude-response>"
  (cl:let* ((signed (cl:slot-value msg 'id)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <apriltags_intrude-response>) istream)
  "Deserializes a message object of type '<apriltags_intrude-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'id) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<apriltags_intrude-response>)))
  "Returns string type for a service object of type '<apriltags_intrude-response>"
  "apriltags_intrude_detector/apriltags_intrudeResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'apriltags_intrude-response)))
  "Returns string type for a service object of type 'apriltags_intrude-response"
  "apriltags_intrude_detector/apriltags_intrudeResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<apriltags_intrude-response>)))
  "Returns md5sum for a message object of type '<apriltags_intrude-response>"
  "443a09552f8457c3ab7679cc90f2c84e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'apriltags_intrude-response)))
  "Returns md5sum for a message object of type 'apriltags_intrude-response"
  "443a09552f8457c3ab7679cc90f2c84e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<apriltags_intrude-response>)))
  "Returns full string definition for message of type '<apriltags_intrude-response>"
  (cl:format cl:nil "int8 id~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'apriltags_intrude-response)))
  "Returns full string definition for message of type 'apriltags_intrude-response"
  (cl:format cl:nil "int8 id~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <apriltags_intrude-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <apriltags_intrude-response>))
  "Converts a ROS message object to a list"
  (cl:list 'apriltags_intrude-response
    (cl:cons ':id (id msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'apriltags_intrude)))
  'apriltags_intrude-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'apriltags_intrude)))
  'apriltags_intrude-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'apriltags_intrude)))
  "Returns string type for a service object of type '<apriltags_intrude>"
  "apriltags_intrude_detector/apriltags_intrude")