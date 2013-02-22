;;; -*- coding: utf-8-unix; -*-
;;; init.el

(add-hook 'after-init-hook
	  `(lambda ()
	     (setq dot-emacs-dir
		   ,(file-name-directory
		     (or load-file-name (buffer-file-name))))
	     (load-file (expand-file-name "pw-init.el" dot-emacs-dir))))

;;; init.el ends here
