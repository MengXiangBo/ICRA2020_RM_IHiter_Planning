
(cl:in-package :asdf)

(defsystem "icra_nav-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "add_ob_srv" :depends-on ("_package_add_ob_srv"))
    (:file "_package_add_ob_srv" :depends-on ("_package"))
    (:file "c_path_srv" :depends-on ("_package_c_path_srv"))
    (:file "_package_c_path_srv" :depends-on ("_package"))
    (:file "c_start_end_srv" :depends-on ("_package_c_start_end_srv"))
    (:file "_package_c_start_end_srv" :depends-on ("_package"))
    (:file "path_srv" :depends-on ("_package_path_srv"))
    (:file "_package_path_srv" :depends-on ("_package"))
    (:file "start_end_srv" :depends-on ("_package_start_end_srv"))
    (:file "_package_start_end_srv" :depends-on ("_package"))
  ))