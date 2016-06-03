;; Auto-generated. Do not edit!


(when (boundp 'sphero_swarm_node::SpheroHeading)
  (if (not (find-package "SPHERO_SWARM_NODE"))
    (make-package "SPHERO_SWARM_NODE"))
  (shadow 'SpheroHeading (find-package "SPHERO_SWARM_NODE")))
(unless (find-package "SPHERO_SWARM_NODE::SPHEROHEADING")
  (make-package "SPHERO_SWARM_NODE::SPHEROHEADING"))

(in-package "ROS")
;;//! \htmlinclude SpheroHeading.msg.html


(defclass sphero_swarm_node::SpheroHeading
  :super ros::object
  :slots (_name _heading ))

(defmethod sphero_swarm_node::SpheroHeading
  (:init
   (&key
    ((:name __name) "")
    ((:heading __heading) 0.0)
    )
   (send-super :init)
   (setq _name (string __name))
   (setq _heading (float __heading))
   self)
  (:name
   (&optional __name)
   (if __name (setq _name __name)) _name)
  (:heading
   (&optional __heading)
   (if __heading (setq _heading __heading)) _heading)
  (:serialization-length
   ()
   (+
    ;; string _name
    4 (length _name)
    ;; float32 _heading
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _name
       (write-long (length _name) s) (princ _name s)
     ;; float32 _heading
       (sys::poke _heading (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; float32 _heading
     (setq _heading (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get sphero_swarm_node::SpheroHeading :md5sum-) "b4e9b156f6244799b2f2da71f9b5a530")
(setf (get sphero_swarm_node::SpheroHeading :datatype-) "sphero_swarm_node/SpheroHeading")
(setf (get sphero_swarm_node::SpheroHeading :definition-)
      "string name
float32 heading

")



(provide :sphero_swarm_node/SpheroHeading "b4e9b156f6244799b2f2da71f9b5a530")


