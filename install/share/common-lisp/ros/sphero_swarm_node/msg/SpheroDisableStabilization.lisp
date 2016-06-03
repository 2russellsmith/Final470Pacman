; Auto-generated. Do not edit!


(cl:in-package sphero_swarm_node-msg)


;//! \htmlinclude SpheroDisableStabilization.msg.html

(cl:defclass <SpheroDisableStabilization> (roslisp-msg-protocol:ros-message)
  ((name
    :reader name
    :initarg :name
    :type cl:string
    :initform "")
   (disable
    :reader disable
    :initarg :disable
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass SpheroDisableStabilization (<SpheroDisableStabilization>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SpheroDisableStabilization>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SpheroDisableStabilization)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sphero_swarm_node-msg:<SpheroDisableStabilization> is deprecated: use sphero_swarm_node-msg:SpheroDisableStabilization instead.")))

(cl:ensure-generic-function 'name-val :lambda-list '(m))
(cl:defmethod name-val ((m <SpheroDisableStabilization>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sphero_swarm_node-msg:name-val is deprecated.  Use sphero_swarm_node-msg:name instead.")
  (name m))

(cl:ensure-generic-function 'disable-val :lambda-list '(m))
(cl:defmethod disable-val ((m <SpheroDisableStabilization>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sphero_swarm_node-msg:disable-val is deprecated.  Use sphero_swarm_node-msg:disable instead.")
  (disable m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SpheroDisableStabilization>) ostream)
  "Serializes a message object of type '<SpheroDisableStabilization>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'name))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'disable) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SpheroDisableStabilization>) istream)
  "Deserializes a message object of type '<SpheroDisableStabilization>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:setf (cl:slot-value msg 'disable) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SpheroDisableStabilization>)))
  "Returns string type for a message object of type '<SpheroDisableStabilization>"
  "sphero_swarm_node/SpheroDisableStabilization")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SpheroDisableStabilization)))
  "Returns string type for a message object of type 'SpheroDisableStabilization"
  "sphero_swarm_node/SpheroDisableStabilization")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SpheroDisableStabilization>)))
  "Returns md5sum for a message object of type '<SpheroDisableStabilization>"
  "d0791519f7d1ce09678d98d9d8040a02")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SpheroDisableStabilization)))
  "Returns md5sum for a message object of type 'SpheroDisableStabilization"
  "d0791519f7d1ce09678d98d9d8040a02")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SpheroDisableStabilization>)))
  "Returns full string definition for message of type '<SpheroDisableStabilization>"
  (cl:format cl:nil "string name~%bool disable~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SpheroDisableStabilization)))
  "Returns full string definition for message of type 'SpheroDisableStabilization"
  (cl:format cl:nil "string name~%bool disable~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SpheroDisableStabilization>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'name))
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SpheroDisableStabilization>))
  "Converts a ROS message object to a list"
  (cl:list 'SpheroDisableStabilization
    (cl:cons ':name (name msg))
    (cl:cons ':disable (disable msg))
))
