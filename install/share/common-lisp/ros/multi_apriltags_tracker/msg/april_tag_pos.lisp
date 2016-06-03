; Auto-generated. Do not edit!


(cl:in-package multi_apriltags_tracker-msg)


;//! \htmlinclude april_tag_pos.msg.html

(cl:defclass <april_tag_pos> (roslisp-msg-protocol:ros-message)
  ((id
    :reader id
    :initarg :id
    :type (cl:vector cl:fixnum)
   :initform (cl:make-array 0 :element-type 'cl:fixnum :initial-element 0))
   (pose
    :reader pose
    :initarg :pose
    :type (cl:vector geometry_msgs-msg:Pose2D)
   :initform (cl:make-array 0 :element-type 'geometry_msgs-msg:Pose2D :initial-element (cl:make-instance 'geometry_msgs-msg:Pose2D))))
)

(cl:defclass april_tag_pos (<april_tag_pos>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <april_tag_pos>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'april_tag_pos)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name multi_apriltags_tracker-msg:<april_tag_pos> is deprecated: use multi_apriltags_tracker-msg:april_tag_pos instead.")))

(cl:ensure-generic-function 'id-val :lambda-list '(m))
(cl:defmethod id-val ((m <april_tag_pos>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader multi_apriltags_tracker-msg:id-val is deprecated.  Use multi_apriltags_tracker-msg:id instead.")
  (id m))

(cl:ensure-generic-function 'pose-val :lambda-list '(m))
(cl:defmethod pose-val ((m <april_tag_pos>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader multi_apriltags_tracker-msg:pose-val is deprecated.  Use multi_apriltags_tracker-msg:pose instead.")
  (pose m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <april_tag_pos>) ostream)
  "Serializes a message object of type '<april_tag_pos>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'id))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    ))
   (cl:slot-value msg 'id))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'pose))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'pose))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <april_tag_pos>) istream)
  "Deserializes a message object of type '<april_tag_pos>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'id) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'id)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256)))))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'pose) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'pose)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'geometry_msgs-msg:Pose2D))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<april_tag_pos>)))
  "Returns string type for a message object of type '<april_tag_pos>"
  "multi_apriltags_tracker/april_tag_pos")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'april_tag_pos)))
  "Returns string type for a message object of type 'april_tag_pos"
  "multi_apriltags_tracker/april_tag_pos")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<april_tag_pos>)))
  "Returns md5sum for a message object of type '<april_tag_pos>"
  "7d940b52850c16cf09dbca2e129664c5")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'april_tag_pos)))
  "Returns md5sum for a message object of type 'april_tag_pos"
  "7d940b52850c16cf09dbca2e129664c5")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<april_tag_pos>)))
  "Returns full string definition for message of type '<april_tag_pos>"
  (cl:format cl:nil "int8[] id~%geometry_msgs/Pose2D[] pose ~%~%================================================================================~%MSG: geometry_msgs/Pose2D~%# This expresses a position and orientation on a 2D manifold.~%~%float64 x~%float64 y~%float64 theta~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'april_tag_pos)))
  "Returns full string definition for message of type 'april_tag_pos"
  (cl:format cl:nil "int8[] id~%geometry_msgs/Pose2D[] pose ~%~%================================================================================~%MSG: geometry_msgs/Pose2D~%# This expresses a position and orientation on a 2D manifold.~%~%float64 x~%float64 y~%float64 theta~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <april_tag_pos>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'id) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 1)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'pose) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <april_tag_pos>))
  "Converts a ROS message object to a list"
  (cl:list 'april_tag_pos
    (cl:cons ':id (id msg))
    (cl:cons ':pose (pose msg))
))
