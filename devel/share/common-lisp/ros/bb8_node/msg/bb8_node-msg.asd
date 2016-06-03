
(cl:in-package :asdf)

(defsystem "bb8_node-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "SpheroCollision" :depends-on ("_package_SpheroCollision"))
    (:file "_package_SpheroCollision" :depends-on ("_package"))
  ))