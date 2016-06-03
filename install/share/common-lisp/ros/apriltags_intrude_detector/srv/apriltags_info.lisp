; Auto-generated. Do not edit!


(cl:in-package apriltags_intrude_detector-srv)


;//! \htmlinclude apriltags_info-request.msg.html

(cl:defclass <apriltags_info-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass apriltags_info-request (<apriltags_info-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <apriltags_info-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'apriltags_info-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name apriltags_intrude_detector-srv:<apriltags_info-request> is deprecated: use apriltags_intrude_detector-srv:apriltags_info-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <apriltags_info-request>) ostream)
  "Serializes a message object of type '<apriltags_info-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <apriltags_info-request>) istream)
  "Deserializes a message object of type '<apriltags_info-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<apriltags_info-request>)))
  "Returns string type for a service object of type '<apriltags_info-request>"
  "apriltags_intrude_detector/apriltags_infoRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'apriltags_info-request)))
  "Returns string type for a service object of type 'apriltags_info-request"
  "apriltags_intrude_detector/apriltags_infoRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<apriltags_info-request>)))
  "Returns md5sum for a message object of type '<apriltags_info-request>"
  "1c6a00f14d4c3b3ffcd440f6c4b8a029")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'apriltags_info-request)))
  "Returns md5sum for a message object of type 'apriltags_info-request"
  "1c6a00f14d4c3b3ffcd440f6c4b8a029")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<apriltags_info-request>)))
  "Returns full string definition for message of type '<apriltags_info-request>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'apriltags_info-request)))
  "Returns full string definition for message of type 'apriltags_info-request"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <apriltags_info-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <apriltags_info-request>))
  "Converts a ROS message object to a list"
  (cl:list 'apriltags_info-request
))
;//! \htmlinclude apriltags_info-response.msg.html

(cl:defclass <apriltags_info-response> (roslisp-msg-protocol:ros-message)
  ((polygons
    :reader polygons
    :initarg :polygons
    :type (cl:vector geometry_msgs-msg:Polygon)
   :initform (cl:make-array 0 :element-type 'geometry_msgs-msg:Polygon :initial-element (cl:make-instance 'geometry_msgs-msg:Polygon)))
   (ids
    :reader ids
    :initarg :ids
    :type (cl:vector cl:fixnum)
   :initform (cl:make-array 0 :element-type 'cl:fixnum :initial-element 0)))
)

(cl:defclass apriltags_info-response (<apriltags_info-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <apriltags_info-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'apriltags_info-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name apriltags_intrude_detector-srv:<apriltags_info-response> is deprecated: use apriltags_intrude_detector-srv:apriltags_info-response instead.")))

(cl:ensure-generic-function 'polygons-val :lambda-list '(m))
(cl:defmethod polygons-val ((m <apriltags_info-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader apriltags_intrude_detector-srv:polygons-val is deprecated.  Use apriltags_intrude_detector-srv:polygons instead.")
  (polygons m))

(cl:ensure-generic-function 'ids-val :lambda-list '(m))
(cl:defmethod ids-val ((m <apriltags_info-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader apriltags_intrude_detector-srv:ids-val is deprecated.  Use apriltags_intrude_detector-srv:ids instead.")
  (ids m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <apriltags_info-response>) ostream)
  "Serializes a message object of type '<apriltags_info-response>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'polygons))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'polygons))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'ids))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    ))
   (cl:slot-value msg 'ids))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <apriltags_info-response>) istream)
  "Deserializes a message object of type '<apriltags_info-response>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'polygons) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'polygons)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'geometry_msgs-msg:Polygon))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'ids) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'ids)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256)))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<apriltags_info-response>)))
  "Returns string type for a service object of type '<apriltags_info-response>"
  "apriltags_intrude_detector/apriltags_infoResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'apriltags_info-response)))
  "Returns string type for a service object of type 'apriltags_info-response"
  "apriltags_intrude_detector/apriltags_infoResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<apriltags_info-response>)))
  "Returns md5sum for a message object of type '<apriltags_info-response>"
  "1c6a00f14d4c3b3ffcd440f6c4b8a029")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'apriltags_info-response)))
  "Returns md5sum for a message object of type 'apriltags_info-response"
  "1c6a00f14d4c3b3ffcd440f6c4b8a029")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<apriltags_info-response>)))
  "Returns full string definition for message of type '<apriltags_info-response>"
  (cl:format cl:nil "geometry_msgs/Polygon[] polygons~%int8[] ids~%~%~%================================================================================~%MSG: geometry_msgs/Polygon~%#A specification of a polygon where the first and last points are assumed to be connected~%Point32[] points~%~%================================================================================~%MSG: geometry_msgs/Point32~%# This contains the position of a point in free space(with 32 bits of precision).~%# It is recommeded to use Point wherever possible instead of Point32.  ~%# ~%# This recommendation is to promote interoperability.  ~%#~%# This message is designed to take up less space when sending~%# lots of points at once, as in the case of a PointCloud.  ~%~%float32 x~%float32 y~%float32 z~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'apriltags_info-response)))
  "Returns full string definition for message of type 'apriltags_info-response"
  (cl:format cl:nil "geometry_msgs/Polygon[] polygons~%int8[] ids~%~%~%================================================================================~%MSG: geometry_msgs/Polygon~%#A specification of a polygon where the first and last points are assumed to be connected~%Point32[] points~%~%================================================================================~%MSG: geometry_msgs/Point32~%# This contains the position of a point in free space(with 32 bits of precision).~%# It is recommeded to use Point wherever possible instead of Point32.  ~%# ~%# This recommendation is to promote interoperability.  ~%#~%# This message is designed to take up less space when sending~%# lots of points at once, as in the case of a PointCloud.  ~%~%float32 x~%float32 y~%float32 z~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <apriltags_info-response>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'polygons) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'ids) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 1)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <apriltags_info-response>))
  "Converts a ROS message object to a list"
  (cl:list 'apriltags_info-response
    (cl:cons ':polygons (polygons msg))
    (cl:cons ':ids (ids msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'apriltags_info)))
  'apriltags_info-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'apriltags_info)))
  'apriltags_info-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'apriltags_info)))
  "Returns string type for a service object of type '<apriltags_info>"
  "apriltags_intrude_detector/apriltags_info")