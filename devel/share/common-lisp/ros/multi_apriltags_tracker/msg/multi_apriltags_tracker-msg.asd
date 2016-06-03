
(cl:in-package :asdf)

(defsystem "multi_apriltags_tracker-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
)
  :components ((:file "_package")
    (:file "april_tag_pos" :depends-on ("_package_april_tag_pos"))
    (:file "_package_april_tag_pos" :depends-on ("_package"))
  ))