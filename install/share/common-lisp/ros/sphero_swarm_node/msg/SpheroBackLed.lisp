; Auto-generated. Do not edit!


(cl:in-package sphero_swarm_node-msg)


;//! \htmlinclude SpheroBackLed.msg.html

(cl:defclass <SpheroBackLed> (roslisp-msg-protocol:ros-message)
  ((name
    :reader name
    :initarg :name
    :type cl:string
    :initform "")
   (back_led
    :reader back_led
    :initarg :back_led
    :type cl:float
    :initform 0.0))
)

(cl:defclass SpheroBackLed (<SpheroBackLed>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SpheroBackLed>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SpheroBackLed)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sphero_swarm_node-msg:<SpheroBackLed> is deprecated: use sphero_swarm_node-msg:SpheroBackLed instead.")))

(cl:ensure-generic-function 'name-val :lambda-list '(m))
(cl:defmethod name-val ((m <SpheroBackLed>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sphero_swarm_node-msg:name-val is deprecated.  Use sphero_swarm_node-msg:name instead.")
  (name m))

(cl:ensure-generic-function 'back_led-val :lambda-list '(m))
(cl:defmethod back_led-val ((m <SpheroBackLed>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sphero_swarm_node-msg:back_led-val is deprecated.  Use sphero_swarm_node-msg:back_led instead.")
  (back_led m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SpheroBackLed>) ostream)
  "Serializes a message object of type '<SpheroBackLed>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'name))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'back_led))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SpheroBackLed>) istream)
  "Deserializes a message object of type '<SpheroBackLed>"
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
    (cl:setf (cl:slot-value msg 'back_led) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SpheroBackLed>)))
  "Returns string type for a message object of type '<SpheroBackLed>"
  "sphero_swarm_node/SpheroBackLed")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SpheroBackLed)))
  "Returns string type for a message object of type 'SpheroBackLed"
  "sphero_swarm_node/SpheroBackLed")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SpheroBackLed>)))
  "Returns md5sum for a message object of type '<SpheroBackLed>"
  "d427143c65efd6f97ef90d6e139b367c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SpheroBackLed)))
  "Returns md5sum for a message object of type 'SpheroBackLed"
  "d427143c65efd6f97ef90d6e139b367c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SpheroBackLed>)))
  "Returns full string definition for message of type '<SpheroBackLed>"
  (cl:format cl:nil "string name~%float32 back_led~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SpheroBackLed)))
  "Returns full string definition for message of type 'SpheroBackLed"
  (cl:format cl:nil "string name~%float32 back_led~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SpheroBackLed>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'name))
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SpheroBackLed>))
  "Converts a ROS message object to a list"
  (cl:list 'SpheroBackLed
    (cl:cons ':name (name msg))
    (cl:cons ':back_led (back_led msg))
))
