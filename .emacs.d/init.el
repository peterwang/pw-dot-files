;;; -*- coding: utf-8-unix; -*-
;;; init.el

(setq debug-on-error nil)

(add-hook 'after-init-hook
	  `(lambda ()
	     (setq dot-emacs-dir
		   ,(file-name-directory
		     (or load-file-name (buffer-file-name))))
	     (load-file (expand-file-name "pw-init.el" dot-emacs-dir))))

;;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(sql-connection-alist (quote (("peter@localhost:65432:peter" (sql-product (quote postgres)) (sql-user "peter") (sql-database "peter") (sql-server "localhost"))))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
