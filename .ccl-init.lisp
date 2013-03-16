;;; -*- mode:common-lisp; -*-
;;; The following lines added by ql:add-to-init-file:
#-quicklisp
(let ((quicklisp-init
	(merge-pathnames "quicklisp/setup.lisp"
			 (user-homedir-pathname))))
  (when (probe-file quicklisp-init)
    (load quicklisp-init)))

(dolist (p '("swank"
	     "quickproject"
	     "hunchentoot"
	     "drakma"
	     "cl-who"
	     "parenscript"
	     "clsql"))
  (ql:quickload p))

;;; quickproject
(setf quickproject:*author* "Peter Wang <ptr.wang@gmail.com>"
      quickproject:*license* "Copyright (c) 2012, Peter Wang. All rights reserved.")

(swank:create-server :port 4005 :dont-close t)
