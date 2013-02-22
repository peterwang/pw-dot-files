
(provide 'pw-c-style)

(defun pw-cc-style ()
  ;;(define-key c-mode-map [return] 'newline-and-indent)
  (define-key c-mode-map "\C-m" 'reindent-then-newline-and-indent)
  ;;(define-key c-mode-map "\C-ce" 'c-comment-edit)
  (interactive)
  (c-set-style "linux")
  ;;(c-toggle-auto-state)
  ;;(c-toggle-hungry-state)
  (setq c-basic-offset 4)
  (setq js2-basic-offset 4)
  (setq tab-width 4)
  (which-function-mode t))

(add-hook 'c-mode-hook 'pw-cc-style)
(add-hook 'c++-mode-hook 'pw-cc-style)
(add-hook 'php-mode-hook 'pw-cc-style)
(add-hook 'js2-mode-hook 'pw-cc-style)

(message "c style loaded.")