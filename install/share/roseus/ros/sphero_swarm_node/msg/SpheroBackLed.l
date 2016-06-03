;; Auto-generated. Do not edit!


(when (boundp 'sphero_swarm_node::SpheroBackLed)
  (if (not (find-package "SPHERO_SWARM_NODE"))
    (make-package "SPHERO_SWARM_NODE"))
  (shadow 'SpheroBackLed (find-package "SPHERO_SWARM_NODE")))
(unless (find-package "SPHERO_SWARM_NODE::SPHEROBACKLED")
  (make-package "SPHERO_SWARM_NODE::SPHEROBACKLED"))

(in-package "ROS")
;;//! \htmlinclude SpheroBackLed.msg.html


(defclass sphero_swarm_node::SpheroBackLed
  :super ros::object
  :slots (_name _back_led ))

(defmethod sphero_swarm_node::SpheroBackLed
  (:init
   (&key
    ((:name __name) "")
    ((:back_led __back_led) 0.0)
    )
   (send-super :init)
   (setq _name (string __name))
   (setq _back_led (float __back_led))
   self)
  (:name
   (&optional __name)
   (if __name (setq _name __name)) _name)
  (:back_led
   (&optional __back_led)
   (if __back_led (setq _back_led __back_led)) _back_led)
  (:serialization-length
   ()
   (+
    ;; string _name
    4 (length _name)
    ;; float32 _back_led
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _name
       (write-long (length _name) s) (princ _name s)
     ;; float32 _back_led
       (sys::poke _back_led (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; float32 _back_led
     (setq _back_led (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get sphero_swarm_node::SpheroBackLed :md5sum-) "d427143c65efd6f97ef90d6e139b367c")
(setf (get sphero_swarm_node::SpheroBackLed :datatype-) "sphero_swarm_node/SpheroBackLed")
(setf (get sphero_swarm_node::SpheroBackLed :definition-)
      "string name
float32 back_led

")



(provide :sphero_swarm_node/SpheroBackLed "d427143c65efd6f97ef90d6e139b367c")


