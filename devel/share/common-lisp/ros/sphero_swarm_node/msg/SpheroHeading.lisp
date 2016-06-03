; Auto-generated. Do not edit!


(cl:in-package sphero_swarm_node-msg)


;//! \htmlinclude SpheroHeading.msg.html

(cl:defclass <SpheroHeading> (roslisp-msg-protocol:ros-message)
  ((name
    :reader name
    :initarg :name
    :type cl:string
    :initform "")
   (heading
    :reader heading
    :initarg :heading
    :type cl:float
    :initform 0.0))
)

(cl:defclass SpheroHeading (<SpheroHeading>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SpheroHeading>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SpheroHeading)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sphero_swarm_node-msg:<SpheroHeading> is deprecated: use sphero_swarm_node-msg:SpheroHeading instead.")))

(cl:ensure-generic-function 'name-val :lambda-list '(m))
(cl:defmethod name-val ((m <SpheroHeading>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sphero_swarm_node-msg:name-val is deprecated.  Use sphero_swarm_node-msg:name instead.")
  (name m))

(cl:ensure-generic-function 'heading-val :lambda-list '(m))
(cl:defmethod heading-val ((m <SpheroHeading>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sphero_swarm_node-msg:heading-val is deprecated.  Use sphero_swarm_node-msg:heading instead.")
  (heading m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SpheroHeading>) ostream)
  "Serializes a message object of type '<SpheroHeading>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'name))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'heading))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SpheroHeading>) istream)
  "Deserializes a message object of type '<SpheroHeading>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'heading) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SpheroHeading>)))
  "Returns string type for a message object of type '<SpheroHeading>"
  "sphero_swarm_node/SpheroHeading")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SpheroHeading)))
  "Returns string type for a message object of type 'SpheroHeading"
  "sphero_swarm_node/SpheroHeading")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SpheroHeading>)))
  "Returns md5sum for a message object of type '<SpheroHeading>"
  "b4e9b156f6244799b2f2da71f9b5a530")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SpheroHeading)))
  "Returns md5sum for a message object of type 'SpheroHeading"
  "b4e9b156f6244799b2f2da71f9b5a530")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SpheroHeading>)))
  "Returns full string definition for message of type '<SpheroHeading>"
  (cl:format cl:nil "string name~%float32 heading~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SpheroHeading)))
  "Returns full string definition for message of type 'SpheroHeading"
  (cl:format cl:nil "string name~%float32 heading~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SpheroHeading>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'name))
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SpheroHeading>))
  "Converts a ROS message object to a list"
  (cl:list 'SpheroHeading
    (cl:cons ':name (name msg))
    (cl:cons ':heading (heading msg))
))
