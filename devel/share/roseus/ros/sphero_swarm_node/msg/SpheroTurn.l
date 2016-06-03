;; Auto-generated. Do not edit!


(when (boundp 'sphero_swarm_node::SpheroTurn)
  (if (not (find-package "SPHERO_SWARM_NODE"))
    (make-package "SPHERO_SWARM_NODE"))
  (shadow 'SpheroTurn (find-package "SPHERO_SWARM_NODE")))
(unless (find-package "SPHERO_SWARM_NODE::SPHEROTURN")
  (make-package "SPHERO_SWARM_NODE::SPHEROTURN"))

(in-package "ROS")
;;//! \htmlinclude SpheroTurn.msg.html


(defclass sphero_swarm_node::SpheroTurn
  :super ros::object
  :slots (_name _turn ))

(defmethod sphero_swarm_node::SpheroTurn
  (:init
   (&key
    ((:name __name) "")
    ((:turn __turn) 0.0)
    )
   (send-super :init)
   (setq _name (string __name))
   (setq _turn (float __turn))
   self)
  (:name
   (&optional __name)
   (if __name (setq _name __name)) _name)
  (:turn
   (&optional __turn)
   (if __turn (setq _turn __turn)) _turn)
  (:serialization-length
   ()
   (+
    ;; string _name
    4 (length _name)
    ;; float32 _turn
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _name
       (write-long (length _name) s) (princ _name s)
     ;; float32 _turn
       (sys::poke _turn (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; float32 _turn
     (setq _turn (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get sphero_swarm_node::SpheroTurn :md5sum-) "a5123b5acc94971eac4ee956c3f5507c")
(setf (get sphero_swarm_node::SpheroTurn :datatype-) "sphero_swarm_node/SpheroTurn")
(setf (get sphero_swarm_node::SpheroTurn :definition-)
      "string name
float32 turn

")



(provide :sphero_swarm_node/SpheroTurn "a5123b5acc94971eac4ee956c3f5507c")


