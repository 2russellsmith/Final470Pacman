;; Auto-generated. Do not edit!


(when (boundp 'sphero_swarm_node::SpheroTwist)
  (if (not (find-package "SPHERO_SWARM_NODE"))
    (make-package "SPHERO_SWARM_NODE"))
  (shadow 'SpheroTwist (find-package "SPHERO_SWARM_NODE")))
(unless (find-package "SPHERO_SWARM_NODE::SPHEROTWIST")
  (make-package "SPHERO_SWARM_NODE::SPHEROTWIST"))

(in-package "ROS")
;;//! \htmlinclude SpheroTwist.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass sphero_swarm_node::SpheroTwist
  :super ros::object
  :slots (_name _linear _angular ))

(defmethod sphero_swarm_node::SpheroTwist
  (:init
   (&key
    ((:name __name) "")
    ((:linear __linear) (instance geometry_msgs::Vector3 :init))
    ((:angular __angular) (instance geometry_msgs::Vector3 :init))
    )
   (send-super :init)
   (setq _name (string __name))
   (setq _linear __linear)
   (setq _angular __angular)
   self)
  (:name
   (&optional __name)
   (if __name (setq _name __name)) _name)
  (:linear
   (&rest __linear)
   (if (keywordp (car __linear))
       (send* _linear __linear)
     (progn
       (if __linear (setq _linear (car __linear)))
       _linear)))
  (:angular
   (&rest __angular)
   (if (keywordp (car __angular))
       (send* _angular __angular)
     (progn
       (if __angular (setq _angular (car __angular)))
       _angular)))
  (:serialization-length
   ()
   (+
    ;; string _name
    4 (length _name)
    ;; geometry_msgs/Vector3 _linear
    (send _linear :serialization-length)
    ;; geometry_msgs/Vector3 _angular
    (send _angular :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _name
       (write-long (length _name) s) (princ _name s)
     ;; geometry_msgs/Vector3 _linear
       (send _linear :serialize s)
     ;; geometry_msgs/Vector3 _angular
       (send _angular :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; geometry_msgs/Vector3 _linear
     (send _linear :deserialize buf ptr-) (incf ptr- (send _linear :serialization-length))
   ;; geometry_msgs/Vector3 _angular
     (send _angular :deserialize buf ptr-) (incf ptr- (send _angular :serialization-length))
   ;;
   self)
  )

(setf (get sphero_swarm_node::SpheroTwist :md5sum-) "d9b209833fd737ccfb12e73a6bc3716e")
(setf (get sphero_swarm_node::SpheroTwist :datatype-) "sphero_swarm_node/SpheroTwist")
(setf (get sphero_swarm_node::SpheroTwist :definition-)
      "string name
geometry_msgs/Vector3 linear
geometry_msgs/Vector3 angular

================================================================================
MSG: geometry_msgs/Vector3
# This represents a vector in free space. 

float64 x
float64 y
float64 z
")



(provide :sphero_swarm_node/SpheroTwist "d9b209833fd737ccfb12e73a6bc3716e")


