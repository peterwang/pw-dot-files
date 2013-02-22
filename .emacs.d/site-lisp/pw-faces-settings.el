;; customize faces of emacs in a terminal/console 

(provide 'pw-faces-settings)

(when (not window-system)
  ;; cyan
  (set-face-foreground 'minibuffer-prompt "#00ffff")
  ;; blue3
  (set-face-background 'region "#0000cd")
  ;; dark cyan
  (eval-after-load "comint"
    '(set-face-foreground 'comint-highlight-prompt "#008b8b"))
  t)

(message "faces settings loaded.")