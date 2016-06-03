;; Auto-generated. Do not edit!


(when (boundp 'sphero_swarm_node::SpheroAngularVelocity)
  (if (not (find-package "SPHERO_SWARM_NODE"))
    (make-package "SPHERO_SWARM_NODE"))
  (shadow 'SpheroAngularVelocity (find-package "SPHERO_SWARM_NODE")))
(unless (find-package "SPHERO_SWARM_NODE::SPHEROANGULARVELOCITY")
  (make-package "SPHERO_SWARM_NODE::SPHEROANGULARVELOCITY"))

(in-package "ROS")
;;//! \htmlinclude SpheroAngularVelocity.msg.html


(defclass sphero_swarm_node::SpheroAngularVelocity
  :super ros::object
  :slots (_name _angular_velocity ))

(defmethod sphero_swarm_node::SpheroAngularVelocity
  (:init
   (&key
    ((:name __name) "")
    ((:angular_velocity __angular_velocity) 0.0)
    )
   (send-super :init)
   (setq _name (string __name))
   (setq _angular_velocity (float __angular_velocity))
   self)
  (:name
   (&optional __name)
   (if __name (setq _name __name)) _name)
  (:angular_velocity
   (&optional __angular_velocity)
   (if __angular_velocity (setq _angular_velocity __angular_velocity)) _angular_velocity)
  (:serialization-length
   ()
   (+
    ;; string _name
    4 (length _name)
    ;; float32 _angular_velocity
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _name
       (write-long (length _name) s) (princ _name s)
     ;; float32 _angular_velocity
       (sys::poke _angular_velocity (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; float32 _angular_velocity
     (setq _angular_velocity (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get sphero_swarm_node::SpheroAngularVelocity :md5sum-) "65cdfa5e84df9fdae55115e56bef3bff")
(setf (get sphero_swarm_node::SpheroAngularVelocity :datatype-) "sphero_swarm_node/SpheroAngularVelocity")
(setf (get sphero_swarm_node::SpheroAngularVelocity :definition-)
      "string name
float32 angular_velocity

")



(provide :sphero_swarm_node/SpheroAngularVelocity "65cdfa5e84df9fdae55115e56bef3bff")


