;; Auto-generated. Do not edit!


(when (boundp 'sphero_swarm_node::SpheroColor)
  (if (not (find-package "SPHERO_SWARM_NODE"))
    (make-package "SPHERO_SWARM_NODE"))
  (shadow 'SpheroColor (find-package "SPHERO_SWARM_NODE")))
(unless (find-package "SPHERO_SWARM_NODE::SPHEROCOLOR")
  (make-package "SPHERO_SWARM_NODE::SPHEROCOLOR"))

(in-package "ROS")
;;//! \htmlinclude SpheroColor.msg.html


(defclass sphero_swarm_node::SpheroColor
  :super ros::object
  :slots (_name _r _g _b _a ))

(defmethod sphero_swarm_node::SpheroColor
  (:init
   (&key
    ((:name __name) "")
    ((:r __r) 0.0)
    ((:g __g) 0.0)
    ((:b __b) 0.0)
    ((:a __a) 0.0)
    )
   (send-super :init)
   (setq _name (string __name))
   (setq _r (float __r))
   (setq _g (float __g))
   (setq _b (float __b))
   (setq _a (float __a))
   self)
  (:name
   (&optional __name)
   (if __name (setq _name __name)) _name)
  (:r
   (&optional __r)
   (if __r (setq _r __r)) _r)
  (:g
   (&optional __g)
   (if __g (setq _g __g)) _g)
  (:b
   (&optional __b)
   (if __b (setq _b __b)) _b)
  (:a
   (&optional __a)
   (if __a (setq _a __a)) _a)
  (:serialization-length
   ()
   (+
    ;; string _name
    4 (length _name)
    ;; float32 _r
    4
    ;; float32 _g
    4
    ;; float32 _b
    4
    ;; float32 _a
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _name
       (write-long (length _name) s) (princ _name s)
     ;; float32 _r
       (sys::poke _r (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _g
       (sys::poke _g (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _b
       (sys::poke _b (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _a
       (sys::poke _a (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; float32 _r
     (setq _r (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _g
     (setq _g (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _b
     (setq _b (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _a
     (setq _a (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get sphero_swarm_node::SpheroColor :md5sum-) "a101c99ac2ead202753f34ba8e5ed649")
(setf (get sphero_swarm_node::SpheroColor :datatype-) "sphero_swarm_node/SpheroColor")
(setf (get sphero_swarm_node::SpheroColor :definition-)
      "string name
float32 r
float32 g
float32 b
float32 a

")



(provide :sphero_swarm_node/SpheroColor "a101c99ac2ead202753f34ba8e5ed649")


