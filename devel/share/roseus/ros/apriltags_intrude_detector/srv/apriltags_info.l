;; Auto-generated. Do not edit!


(when (boundp 'apriltags_intrude_detector::apriltags_info)
  (if (not (find-package "APRILTAGS_INTRUDE_DETECTOR"))
    (make-package "APRILTAGS_INTRUDE_DETECTOR"))
  (shadow 'apriltags_info (find-package "APRILTAGS_INTRUDE_DETECTOR")))
(unless (find-package "APRILTAGS_INTRUDE_DETECTOR::APRILTAGS_INFO")
  (make-package "APRILTAGS_INTRUDE_DETECTOR::APRILTAGS_INFO"))
(unless (find-package "APRILTAGS_INTRUDE_DETECTOR::APRILTAGS_INFOREQUEST")
  (make-package "APRILTAGS_INTRUDE_DETECTOR::APRILTAGS_INFOREQUEST"))
(unless (find-package "APRILTAGS_INTRUDE_DETECTOR::APRILTAGS_INFORESPONSE")
  (make-package "APRILTAGS_INTRUDE_DETECTOR::APRILTAGS_INFORESPONSE"))

(in-package "ROS")



(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass apriltags_intrude_detector::apriltags_infoRequest
  :super ros::object
  :slots ())

(defmethod apriltags_intrude_detector::apriltags_infoRequest
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(defclass apriltags_intrude_detector::apriltags_infoResponse
  :super ros::object
  :slots (_polygons _ids ))

(defmethod apriltags_intrude_detector::apriltags_infoResponse
  (:init
   (&key
    ((:polygons __polygons) (let (r) (dotimes (i 0) (push (instance geometry_msgs::Polygon :init) r)) r))
    ((:ids __ids) (make-array 0 :initial-element 0 :element-type :integer))
    )
   (send-super :init)
   (setq _polygons __polygons)
   (setq _ids __ids)
   self)
  (:polygons
   (&rest __polygons)
   (if (keywordp (car __polygons))
       (send* _polygons __polygons)
     (progn
       (if __polygons (setq _polygons (car __polygons)))
       _polygons)))
  (:ids
   (&optional __ids)
   (if __ids (setq _ids __ids)) _ids)
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/Polygon[] _polygons
    (apply #'+ (send-all _polygons :serialization-length)) 4
    ;; int8[] _ids
    (* 1    (length _ids)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geometry_msgs/Polygon[] _polygons
     (write-long (length _polygons) s)
     (dolist (elem _polygons)
       (send elem :serialize s)
       )
     ;; int8[] _ids
     (write-long (length _ids) s)
     (dotimes (i (length _ids))
       (write-byte (elt _ids i) s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geometry_msgs/Polygon[] _polygons
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _polygons (let (r) (dotimes (i n) (push (instance geometry_msgs::Polygon :init) r)) r))
     (dolist (elem- _polygons)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; int8[] _ids
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _ids (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _ids i) (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> (elt _ids i) 127) (setf (elt _ids i) (- (elt _ids i) 256)))
     ))
   ;;
   self)
  )

(defclass apriltags_intrude_detector::apriltags_info
  :super ros::object
  :slots ())

(setf (get apriltags_intrude_detector::apriltags_info :md5sum-) "1c6a00f14d4c3b3ffcd440f6c4b8a029")
(setf (get apriltags_intrude_detector::apriltags_info :datatype-) "apriltags_intrude_detector/apriltags_info")
(setf (get apriltags_intrude_detector::apriltags_info :request) apriltags_intrude_detector::apriltags_infoRequest)
(setf (get apriltags_intrude_detector::apriltags_info :response) apriltags_intrude_detector::apriltags_infoResponse)

(defmethod apriltags_intrude_detector::apriltags_infoRequest
  (:response () (instance apriltags_intrude_detector::apriltags_infoResponse :init)))

(setf (get apriltags_intrude_detector::apriltags_infoRequest :md5sum-) "1c6a00f14d4c3b3ffcd440f6c4b8a029")
(setf (get apriltags_intrude_detector::apriltags_infoRequest :datatype-) "apriltags_intrude_detector/apriltags_infoRequest")
(setf (get apriltags_intrude_detector::apriltags_infoRequest :definition-)
      "---
geometry_msgs/Polygon[] polygons
int8[] ids


================================================================================
MSG: geometry_msgs/Polygon
#A specification of a polygon where the first and last points are assumed to be connected
Point32[] points

================================================================================
MSG: geometry_msgs/Point32
# This contains the position of a point in free space(with 32 bits of precision).
# It is recommeded to use Point wherever possible instead of Point32.  
# 
# This recommendation is to promote interoperability.  
#
# This message is designed to take up less space when sending
# lots of points at once, as in the case of a PointCloud.  

float32 x
float32 y
")

(setf (get apriltags_intrude_detector::apriltags_infoResponse :md5sum-) "1c6a00f14d4c3b3ffcd440f6c4b8a029")
(setf (get apriltags_intrude_detector::apriltags_infoResponse :datatype-) "apriltags_intrude_detector/apriltags_infoResponse")
(setf (get apriltags_intrude_detector::apriltags_infoResponse :definition-)
      "---
geometry_msgs/Polygon[] polygons
int8[] ids


================================================================================
MSG: geometry_msgs/Polygon
#A specification of a polygon where the first and last points are assumed to be connected
Point32[] points

================================================================================
MSG: geometry_msgs/Point32
# This contains the position of a point in free space(with 32 bits of precision).
# It is recommeded to use Point wherever possible instead of Point32.  
# 
# This recommendation is to promote interoperability.  
#
# This message is designed to take up less space when sending
# lots of points at once, as in the case of a PointCloud.  

float32 x
float32 y
")



(provide :apriltags_intrude_detector/apriltags_info "1c6a00f14d4c3b3ffcd440f6c4b8a029")


