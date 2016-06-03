;; Auto-generated. Do not edit!


(when (boundp 'sphero_swarm_node::SpheroInfo)
  (if (not (find-package "SPHERO_SWARM_NODE"))
    (make-package "SPHERO_SWARM_NODE"))
  (shadow 'SpheroInfo (find-package "SPHERO_SWARM_NODE")))
(unless (find-package "SPHERO_SWARM_NODE::SPHEROINFO")
  (make-package "SPHERO_SWARM_NODE::SPHEROINFO"))
(unless (find-package "SPHERO_SWARM_NODE::SPHEROINFOREQUEST")
  (make-package "SPHERO_SWARM_NODE::SPHEROINFOREQUEST"))
(unless (find-package "SPHERO_SWARM_NODE::SPHEROINFORESPONSE")
  (make-package "SPHERO_SWARM_NODE::SPHEROINFORESPONSE"))

(in-package "ROS")





(defclass sphero_swarm_node::SpheroInfoRequest
  :super ros::object
  :slots (_name _bt_addr ))

(defmethod sphero_swarm_node::SpheroInfoRequest
  (:init
   (&key
    ((:name __name) "")
    ((:bt_addr __bt_addr) "")
    )
   (send-super :init)
   (setq _name (string __name))
   (setq _bt_addr (string __bt_addr))
   self)
  (:name
   (&optional __name)
   (if __name (setq _name __name)) _name)
  (:bt_addr
   (&optional __bt_addr)
   (if __bt_addr (setq _bt_addr __bt_addr)) _bt_addr)
  (:serialization-length
   ()
   (+
    ;; string _name
    4 (length _name)
    ;; string _bt_addr
    4 (length _bt_addr)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _name
       (write-long (length _name) s) (princ _name s)
     ;; string _bt_addr
       (write-long (length _bt_addr) s) (princ _bt_addr s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _bt_addr
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _bt_addr (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass sphero_swarm_node::SpheroInfoResponse
  :super ros::object
  :slots (_success ))

(defmethod sphero_swarm_node::SpheroInfoResponse
  (:init
   (&key
    ((:success __success) 0)
    )
   (send-super :init)
   (setq _success (round __success))
   self)
  (:success
   (&optional __success)
   (if __success (setq _success __success)) _success)
  (:serialization-length
   ()
   (+
    ;; int8 _success
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int8 _success
       (write-byte _success s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int8 _success
     (setq _success (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _success 127) (setq _success (- _success 256)))
   ;;
   self)
  )

(defclass sphero_swarm_node::SpheroInfo
  :super ros::object
  :slots ())

(setf (get sphero_swarm_node::SpheroInfo :md5sum-) "b7dd77d16ce84367917a2e9ab291530a")
(setf (get sphero_swarm_node::SpheroInfo :datatype-) "sphero_swarm_node/SpheroInfo")
(setf (get sphero_swarm_node::SpheroInfo :request) sphero_swarm_node::SpheroInfoRequest)
(setf (get sphero_swarm_node::SpheroInfo :response) sphero_swarm_node::SpheroInfoResponse)

(defmethod sphero_swarm_node::SpheroInfoRequest
  (:response () (instance sphero_swarm_node::SpheroInfoResponse :init)))

(setf (get sphero_swarm_node::SpheroInfoRequest :md5sum-) "b7dd77d16ce84367917a2e9ab291530a")
(setf (get sphero_swarm_node::SpheroInfoRequest :datatype-) "sphero_swarm_node/SpheroInfoRequest")
(setf (get sphero_swarm_node::SpheroInfoRequest :definition-)
      "string name
string bt_addr
---
int8 success

")

(setf (get sphero_swarm_node::SpheroInfoResponse :md5sum-) "b7dd77d16ce84367917a2e9ab291530a")
(setf (get sphero_swarm_node::SpheroInfoResponse :datatype-) "sphero_swarm_node/SpheroInfoResponse")
(setf (get sphero_swarm_node::SpheroInfoResponse :definition-)
      "string name
string bt_addr
---
int8 success

")



(provide :sphero_swarm_node/SpheroInfo "b7dd77d16ce84367917a2e9ab291530a")


