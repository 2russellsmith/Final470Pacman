;; Auto-generated. Do not edit!


(when (boundp 'sphero_swarm_node::SpheroDisableStabilization)
  (if (not (find-package "SPHERO_SWARM_NODE"))
    (make-package "SPHERO_SWARM_NODE"))
  (shadow 'SpheroDisableStabilization (find-package "SPHERO_SWARM_NODE")))
(unless (find-package "SPHERO_SWARM_NODE::SPHERODISABLESTABILIZATION")
  (make-package "SPHERO_SWARM_NODE::SPHERODISABLESTABILIZATION"))

(in-package "ROS")
;;//! \htmlinclude SpheroDisableStabilization.msg.html


(defclass sphero_swarm_node::SpheroDisableStabilization
  :super ros::object
  :slots (_name _disable ))

(defmethod sphero_swarm_node::SpheroDisableStabilization
  (:init
   (&key
    ((:name __name) "")
    ((:disable __disable) nil)
    )
   (send-super :init)
   (setq _name (string __name))
   (setq _disable __disable)
   self)
  (:name
   (&optional __name)
   (if __name (setq _name __name)) _name)
  (:disable
   (&optional __disable)
   (if __disable (setq _disable __disable)) _disable)
  (:serialization-length
   ()
   (+
    ;; string _name
    4 (length _name)
    ;; bool _disable
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _name
       (write-long (length _name) s) (princ _name s)
     ;; bool _disable
       (if _disable (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; bool _disable
     (setq _disable (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(setf (get sphero_swarm_node::SpheroDisableStabilization :md5sum-) "d0791519f7d1ce09678d98d9d8040a02")
(setf (get sphero_swarm_node::SpheroDisableStabilization :datatype-) "sphero_swarm_node/SpheroDisableStabilization")
(setf (get sphero_swarm_node::SpheroDisableStabilization :definition-)
      "string name
bool disable

")



(provide :sphero_swarm_node/SpheroDisableStabilization "d0791519f7d1ce09678d98d9d8040a02")


