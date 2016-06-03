; Auto-generated. Do not edit!


(cl:in-package sphero_swarm_node-msg)


;//! \htmlinclude SpheroAngularVelocity.msg.html

(cl:defclass <SpheroAngularVelocity> (roslisp-msg-protocol:ros-message)
  ((name
    :reader name
    :initarg :name
    :type cl:string
    :initform "")
   (angular_velocity
    :reader angular_velocity
    :initarg :angular_velocity
    :type cl:float
    :initform 0.0))
)

(cl:defclass SpheroAngularVelocity (<SpheroAngularVelocity>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SpheroAngularVelocity>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SpheroAngularVelocity)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sphero_swarm_node-msg:<SpheroAngularVelocity> is deprecated: use sphero_swarm_node-msg:SpheroAngularVelocity instead.")))

(cl:ensure-generic-function 'name-val :lambda-list '(m))
(cl:defmethod name-val ((m <SpheroAngularVelocity>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sphero_swarm_node-msg:name-val is deprecated.  Use sphero_swarm_node-msg:name instead.")
  (name m))

(cl:ensure-generic-function 'angular_velocity-val :lambda-list '(m))
(cl:defmethod angular_velocity-val ((m <SpheroAngularVelocity>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sphero_swarm_node-msg:angular_velocity-val is deprecated.  Use sphero_swarm_node-msg:angular_velocity instead.")
  (angular_velocity m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SpheroAngularVelocity>) ostream)
  "Serializes a message object of type '<SpheroAngularVelocity>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'name))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'angular_velocity))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SpheroAngularVelocity>) istream)
  "Deserializes a message object of type '<SpheroAngularVelocity>"
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
    (cl:setf (cl:slot-value msg 'angular_velocity) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SpheroAngularVelocity>)))
  "Returns string type for a message object of type '<SpheroAngularVelocity>"
  "sphero_swarm_node/SpheroAngularVelocity")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SpheroAngularVelocity)))
  "Returns string type for a message object of type 'SpheroAngularVelocity"
  "sphero_swarm_node/SpheroAngularVelocity")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SpheroAngularVelocity>)))
  "Returns md5sum for a message object of type '<SpheroAngularVelocity>"
  "65cdfa5e84df9fdae55115e56bef3bff")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SpheroAngularVelocity)))
  "Returns md5sum for a message object of type 'SpheroAngularVelocity"
  "65cdfa5e84df9fdae55115e56bef3bff")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SpheroAngularVelocity>)))
  "Returns full string definition for message of type '<SpheroAngularVelocity>"
  (cl:format cl:nil "string name~%float32 angular_velocity~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SpheroAngularVelocity)))
  "Returns full string definition for message of type 'SpheroAngularVelocity"
  (cl:format cl:nil "string name~%float32 angular_velocity~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SpheroAngularVelocity>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'name))
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SpheroAngularVelocity>))
  "Converts a ROS message object to a list"
  (cl:list 'SpheroAngularVelocity
    (cl:cons ':name (name msg))
    (cl:cons ':angular_velocity (angular_velocity msg))
))
