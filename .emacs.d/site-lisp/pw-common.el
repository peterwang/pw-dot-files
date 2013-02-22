
(provide 'pw-common)

(require 'byte-opt) ; side-effect-free-fns
(require 'cl)
(load "cl-macs")
(load "cl-seq")
(load "cl-extra")
(require 'edmacro)
(require 'delsel)
(require 'easy-mmode)
(require 'regexp-opt)
(require 'dired-x)
(require 'dired-isearch)
(require 'advice)
(require 'avoid)

(message "common loaded.")

;;(server-start)

;; (require 'session)
;; (add-hook 'after-init-hook
;;        'session-initialize)
;(desktop-save-mode 1)
;(setq desktop-restore-eager 5)

;(setq Info-additional-directory-list
; '("/usr/share/info/emacs-snapshot-unicode/"))

;(add-to-list 'load-path (file-name-directory load-file-name) t)
;(require 'pw-global-settings)
;(require 'pw-fonts-settings)
;(require 'pw-c-style)
;(require 'pw-faces-settings)
