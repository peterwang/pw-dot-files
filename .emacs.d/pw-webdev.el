;;; web development

;; js
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-hook 'js-mode-hook 'js2-minor-mode)

;; css

;; html

;; php
(add-to-list 'load-path
	     (expand-file-name "vendor/php-mode" dot-emacs-dir))
(require 'php-mode)

;; key map

(define-key php-mode-map (kbd "RET") 'newline-and-indent)

;; remote php debugging
(autoload 'geben "geben" "PHP Debugger on Emacs" t)
