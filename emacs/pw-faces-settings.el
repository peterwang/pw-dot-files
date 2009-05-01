(provide 'pw-faces-settings)

(when (not window-system)
  (set-face-foreground 'minibuffer-prompt "Cyan")
  t)

(message "faces settings loaded.")