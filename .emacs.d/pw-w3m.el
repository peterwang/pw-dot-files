;;; w3m
;;(add-to-list 'load-path "/opt/local/share/emacs/site-lisp/w3m")
(add-to-list 'load-path "~/repos/cvs/emacs-w3m")
;;(add-to-list 'exec-path "~/apps/erlang/bin")
(add-to-list 'exec-path "/opt/local/bin")
(require 'w3m-load)
(setq browse-url-browser-function 'w3m-browse-url
      w3m-fill-column 70
      w3m-use-cookies t)

;; fix faces
(eval-after-load
 "w3m-form"
 '(progn
   (set-face-foreground 'w3m-form "cyan")
   (set-face-foreground 'w3m-anchor "darkcyan")))
