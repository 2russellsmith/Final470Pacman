;; Auto-generated. Do not edit!


(when (boundp 'apriltags_intrude_detector::apriltags_intrude)
  (if (not (find-package "APRILTAGS_INTRUDE_DETECTOR"))
    (make-package "APRILTAGS_INTRUDE_DETECTOR"))
  (shadow 'apriltags_intrude (find-package "APRILTAGS_INTRUDE_DETECTOR")))
(unless (find-package "APRILTAGS_INTRUDE_DETECTOR::APRILTAGS_INTRUDE")
  (make-package "APRILTAGS_INTRUDE_DETECTOR::APRILTAGS_INTRUDE"))
(unless (find-package "APRILTAGS_INTRUDE_DETECTOR::APRILTAGS_INTRUDEREQUEST")
  (make-package "APRILTAGS_INTRUDE_DETECTOR::APRILTAGS_INTRUDEREQUEST"))
(unless (find-package "APRILTAGS_INTRUDE_DETECTOR::APRILTAGS_INTRUDERESPONSE")
  (make-package "APRILTAGS_INTRUDE_DETECTOR::APRILTAGS_INTRUDERESPONSE"))

(in-package "ROS")





(defclass apriltags_intrude_detector::apriltags_intrudeRequest
  :super ros::object
  :slots (_x _y ))

(defmethod apriltags_intrude_detector::apriltags_intrudeRequest
  (:init
   (&key
    ((:x __x) 0.0)
    ((:y __y) 0.0)
    )
   (send-super :init)
   (setq _x (float __x))
   (setq _y (float __y))
   self)
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:y
   (&optional __y)
   (if __y (setq _y __y)) _y)
  (:serialization-length
   ()
   (+
    ;; float32 _x
    4
    ;; float32 _y
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _x
       (sys::poke _x (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _y
       (sys::poke _y (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _x
     (setq _x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _y
     (setq _y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(defclass apriltags_intrude_detector::apriltags_intrudeResponse
  :super ros::object
  :slots (_id ))

(defmethod apriltags_intrude_detector::apriltags_intrudeResponse
  (:init
   (&key
    ((:id __id) 0)
    )
   (send-super :init)
   (setq _id (round __id))
   self)
  (:id
   (&optional __id)
   (if __id (setq _id __id)) _id)
  (:serialization-length
   ()
   (+
    ;; int8 _id
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int8 _id
       (write-byte _id s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int8 _id
     (setq _id (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _id 127) (setq _id (- _id 256)))
   ;;
   self)
  )

(defclass apriltags_intrude_detector::apriltags_intrude
  :super ros::object
  :slots ())

(setf (get apriltags_intrude_detector::apriltags_intrude :md5sum-) "443a09552f8457c3ab7679cc90f2c84e")
(setf (get apriltags_intrude_detector::apriltags_intrude :datatype-) "apriltags_intrude_detector/apriltags_intrude")
(setf (get apriltags_intrude_detector::apriltags_intrude :request) apriltags_intrude_detector::apriltags_intrudeRequest)
(setf (get apriltags_intrude_detector::apriltags_intrude :response) apriltags_intrude_detector::apriltags_intrudeResponse)

(defmethod apriltags_intrude_detector::apriltags_intrudeRequest
  (:response () (instance apriltags_intrude_detector::apriltags_intrudeResponse :init)))

(setf (get apriltags_intrude_detector::apriltags_intrudeRequest :md5sum-) "443a09552f8457c3ab7679cc90f2c84e")
(setf (get apriltags_intrude_detector::apriltags_intrudeRequest :datatype-) "apriltags_intrude_detector/apriltags_intrudeRequest")
(setf (get apriltags_intrude_detector::apriltags_intrudeRequest :definition-)
      "float32 x
float32 y
---
int8 id

")

(setf (get apriltags_intrude_detector::apriltags_intrudeResponse :md5sum-) "443a09552f8457c3ab7679cc90f2c84e")
(setf (get apriltags_intrude_detector::apriltags_intrudeResponse :datatype-) "apriltags_intrude_detector/apriltags_intrudeResponse")
(setf (get apriltags_intrude_detector::apriltags_intrudeResponse :definition-)
      "float32 x
float32 y
---
int8 id

")



(provide :apriltags_intrude_detector/apriltags_intrude "443a09552f8457c3ab7679cc90f2c84e")


