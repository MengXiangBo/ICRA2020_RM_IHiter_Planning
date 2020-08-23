
(cl:in-package :asdf)

(defsystem "roborts_msgs-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "FricWhl" :depends-on ("_package_FricWhl"))
    (:file "_package_FricWhl" :depends-on ("_package"))
    (:file "GimbalMode" :depends-on ("_package_GimbalMode"))
    (:file "_package_GimbalMode" :depends-on ("_package"))
    (:file "ShootCmd" :depends-on ("_package_ShootCmd"))
    (:file "_package_ShootCmd" :depends-on ("_package"))
  ))