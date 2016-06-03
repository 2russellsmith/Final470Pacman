;; Auto-generated. Do not edit!


(when (boundp 'multi_apriltags_tracker::april_tag_pos)
  (if (not (find-package "MULTI_APRILTAGS_TRACKER"))
    (make-package "MULTI_APRILTAGS_TRACKER"))
  (shadow 'april_tag_pos (find-package "MULTI_APRILTAGS_TRACKER")))
(unless (find-package "MULTI_APRILTAGS_TRACKER::APRIL_TAG_POS")
  (make-package "MULTI_APRILTAGS_TRACKER::APRIL_TAG_POS"))

(in-package "ROS")
;;//! \htmlinclude april_tag_pos.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass multi_apriltags_tracker::april_tag_pos
  :super ros::object
  :slots (_id _pose ))

(defmethod multi_apriltags_tracker::april_tag_pos
  (:init
   (&key
    ((:id __id) (make-array 0 :initial-element 0 :element-type :integer))
    ((:pose __pose) (let (r) (dotimes (i 0) (push (instance geometry_msgs::Pose2D :init) r)) r))
    )
   (send-super :init)
   (setq _id __id)
   (setq _pose __pose)
   self)
  (:id
   (&optional __id)
   (if __id (setq _id __id)) _id)
  (:pose
   (&rest __pose)
   (if (keywordp (car __pose))
       (send* _pose __pose)
     (progn
       (if __pose (setq _pose (car __pose)))
       _pose)))
  (:serialization-length
   ()
   (+
    ;; int8[] _id
    (* 1    (length _id)) 4
    ;; geometry_msgs/Pose2D[] _pose
    (apply #'+ (send-all _pose :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int8[] _id
     (write-long (length _id) s)
     (dotimes (i (length _id))
       (write-byte (elt _id i) s)
       )
     ;; geometry_msgs/Pose2D[] _pose
     (write-long (length _pose) s)
     (dolist (elem _pose)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int8[] _id
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _id (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _id i) (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> (elt _id i) 127) (setf (elt _id i) (- (elt _id i) 256)))
     ))
   ;; geometry_msgs/Pose2D[] _pose
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _pose (let (r) (dotimes (i n) (push (instance geometry_msgs::Pose2D :init) r)) r))
     (dolist (elem- _pose)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get multi_apriltags_tracker::april_tag_pos :md5sum-) "7d940b52850c16cf09dbca2e129664c5")
(setf (get multi_apriltags_tracker::april_tag_pos :datatype-) "multi_apriltags_tracker/april_tag_pos")
(setf (get multi_apriltags_tracker::april_tag_pos :definition-)
      "int8[] id
geometry_msgs/Pose2D[] pose 

================================================================================
MSG: geometry_msgs/Pose2D
# This expresses a position and orientation on a 2D manifold.

float64 x
float64 y
float64 theta
")



(provide :multi_apriltags_tracker/april_tag_pos "7d940b52850c16cf09dbca2e129664c5")


