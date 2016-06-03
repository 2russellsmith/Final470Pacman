; Auto-generated. Do not edit!


(cl:in-package sphero_swarm_node-srv)


;//! \htmlinclude SpheroInfo-request.msg.html

(cl:defclass <SpheroInfo-request> (roslisp-msg-protocol:ros-message)
  ((name
    :reader name
    :initarg :name
    :type cl:string
    :initform "")
   (bt_addr
    :reader bt_addr
    :initarg :bt_addr
    :type cl:string
    :initform ""))
)

(cl:defclass SpheroInfo-request (<SpheroInfo-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SpheroInfo-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SpheroInfo-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sphero_swarm_node-srv:<SpheroInfo-request> is deprecated: use sphero_swarm_node-srv:SpheroInfo-request instead.")))

(cl:ensure-generic-function 'name-val :lambda-list '(m))
(cl:defmethod name-val ((m <SpheroInfo-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sphero_swarm_node-srv:name-val is deprecated.  Use sphero_swarm_node-srv:name instead.")
  (name m))

(cl:ensure-generic-function 'bt_addr-val :lambda-list '(m))
(cl:defmethod bt_addr-val ((m <SpheroInfo-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sphero_swarm_node-srv:bt_addr-val is deprecated.  Use sphero_swarm_node-srv:bt_addr instead.")
  (bt_addr m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SpheroInfo-request>) ostream)
  "Serializes a message object of type '<SpheroInfo-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'name))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'bt_addr))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'bt_addr))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SpheroInfo-request>) istream)
  "Deserializes a message object of type '<SpheroInfo-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'bt_addr) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'bt_addr) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SpheroInfo-request>)))
  "Returns string type for a service object of type '<SpheroInfo-request>"
  "sphero_swarm_node/SpheroInfoRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SpheroInfo-request)))
  "Returns string type for a service object of type 'SpheroInfo-request"
  "sphero_swarm_node/SpheroInfoRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SpheroInfo-request>)))
  "Returns md5sum for a message object of type '<SpheroInfo-request>"
  "b7dd77d16ce84367917a2e9ab291530a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SpheroInfo-request)))
  "Returns md5sum for a message object of type 'SpheroInfo-request"
  "b7dd77d16ce84367917a2e9ab291530a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SpheroInfo-request>)))
  "Returns full string definition for message of type '<SpheroInfo-request>"
  (cl:format cl:nil "string name~%string bt_addr~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SpheroInfo-request)))
  "Returns full string definition for message of type 'SpheroInfo-request"
  (cl:format cl:nil "string name~%string bt_addr~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SpheroInfo-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'name))
     4 (cl:length (cl:slot-value msg 'bt_addr))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SpheroInfo-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SpheroInfo-request
    (cl:cons ':name (name msg))
    (cl:cons ':bt_addr (bt_addr msg))
))
;//! \htmlinclude SpheroInfo-response.msg.html

(cl:defclass <SpheroInfo-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:fixnum
    :initform 0))
)

(cl:defclass SpheroInfo-response (<SpheroInfo-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SpheroInfo-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SpheroInfo-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sphero_swarm_node-srv:<SpheroInfo-response> is deprecated: use sphero_swarm_node-srv:SpheroInfo-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <SpheroInfo-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sphero_swarm_node-srv:success-val is deprecated.  Use sphero_swarm_node-srv:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SpheroInfo-response>) ostream)
  "Serializes a message object of type '<SpheroInfo-response>"
  (cl:let* ((signed (cl:slot-value msg 'success)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SpheroInfo-response>) istream)
  "Deserializes a message object of type '<SpheroInfo-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'success) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SpheroInfo-response>)))
  "Returns string type for a service object of type '<SpheroInfo-response>"
  "sphero_swarm_node/SpheroInfoResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SpheroInfo-response)))
  "Returns string type for a service object of type 'SpheroInfo-response"
  "sphero_swarm_node/SpheroInfoResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SpheroInfo-response>)))
  "Returns md5sum for a message object of type '<SpheroInfo-response>"
  "b7dd77d16ce84367917a2e9ab291530a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SpheroInfo-response)))
  "Returns md5sum for a message object of type 'SpheroInfo-response"
  "b7dd77d16ce84367917a2e9ab291530a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SpheroInfo-response>)))
  "Returns full string definition for message of type '<SpheroInfo-response>"
  (cl:format cl:nil "int8 success~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SpheroInfo-response)))
  "Returns full string definition for message of type 'SpheroInfo-response"
  (cl:format cl:nil "int8 success~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SpheroInfo-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SpheroInfo-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SpheroInfo-response
    (cl:cons ':success (success msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SpheroInfo)))
  'SpheroInfo-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SpheroInfo)))
  'SpheroInfo-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SpheroInfo)))
  "Returns string type for a service object of type '<SpheroInfo>"
  "sphero_swarm_node/SpheroInfo")