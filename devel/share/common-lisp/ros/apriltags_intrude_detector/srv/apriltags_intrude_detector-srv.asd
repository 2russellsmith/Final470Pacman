
(cl:in-package :asdf)

(defsystem "apriltags_intrude_detector-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
)
  :components ((:file "_package")
    (:file "apriltags_intrude" :depends-on ("_package_apriltags_intrude"))
    (:file "_package_apriltags_intrude" :depends-on ("_package"))
    (:file "apriltags_info" :depends-on ("_package_apriltags_info"))
    (:file "_package_apriltags_info" :depends-on ("_package"))
  ))