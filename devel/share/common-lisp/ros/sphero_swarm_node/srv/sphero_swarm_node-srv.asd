
(cl:in-package :asdf)

(defsystem "sphero_swarm_node-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "SpheroInfo" :depends-on ("_package_SpheroInfo"))
    (:file "_package_SpheroInfo" :depends-on ("_package"))
  ))