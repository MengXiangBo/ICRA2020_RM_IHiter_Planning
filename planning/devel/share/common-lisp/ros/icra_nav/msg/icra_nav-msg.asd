
(cl:in-package :asdf)

(defsystem "icra_nav-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "path_vector" :depends-on ("_package_path_vector"))
    (:file "_package_path_vector" :depends-on ("_package"))
    (:file "punish" :depends-on ("_package_punish"))
    (:file "_package_punish" :depends-on ("_package"))
    (:file "start_end_point" :depends-on ("_package_start_end_point"))
    (:file "_package_start_end_point" :depends-on ("_package"))
  ))