
(cl:in-package :asdf)

(defsystem "sphero_swarm_node-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
               :std_msgs-msg
)
  :components ((:file "_package")
    (:file "SpheroDisableStabilization" :depends-on ("_package_SpheroDisableStabilization"))
    (:file "_package_SpheroDisableStabilization" :depends-on ("_package"))
    (:file "SpheroColor" :depends-on ("_package_SpheroColor"))
    (:file "_package_SpheroColor" :depends-on ("_package"))
    (:file "SpheroImu" :depends-on ("_package_SpheroImu"))
    (:file "_package_SpheroImu" :depends-on ("_package"))
    (:file "SpheroHeading" :depends-on ("_package_SpheroHeading"))
    (:file "_package_SpheroHeading" :depends-on ("_package"))
    (:file "SpheroBackLed" :depends-on ("_package_SpheroBackLed"))
    (:file "_package_SpheroBackLed" :depends-on ("_package"))
    (:file "SpheroAngularVelocity" :depends-on ("_package_SpheroAngularVelocity"))
    (:file "_package_SpheroAngularVelocity" :depends-on ("_package"))
    (:file "SpheroTurn" :depends-on ("_package_SpheroTurn"))
    (:file "_package_SpheroTurn" :depends-on ("_package"))
    (:file "SpheroOdometry" :depends-on ("_package_SpheroOdometry"))
    (:file "_package_SpheroOdometry" :depends-on ("_package"))
    (:file "SpheroSwarmCollision" :depends-on ("_package_SpheroSwarmCollision"))
    (:file "_package_SpheroSwarmCollision" :depends-on ("_package"))
    (:file "SpheroTwist" :depends-on ("_package_SpheroTwist"))
    (:file "_package_SpheroTwist" :depends-on ("_package"))
  ))