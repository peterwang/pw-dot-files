(provide 'pw-faces-settings)

(when (not window-system)
  (set-face-foreground 'minibuffer-prompt "cyan")
  t)

(message "faces settings loaded.")