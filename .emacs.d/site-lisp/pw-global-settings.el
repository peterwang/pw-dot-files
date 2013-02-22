;; some global settings

(provide 'pw-global-settings)

(set-language-environment "UTF-8")
(fset 'yes-or-no-p 'y-or-n-p)
(setq bookmark-default-file "~/.emacs.d/peter-bookmarks.el"
      inhibit-startup-screen t
      initial-scratch-message nil
      split-width-threshold 65535
      make-backup-files nil
      visible-bell nil
      ring-bell-function (lambda () 42)
      dired-use-ls-dired nil)
(ido-mode 'both)



(fset 'yes-or-no-p 'y-or-n-p)

(setq make-backup-files nil)
(setq inhibit-startup-screen t)
(setq inhibit-startup-message t)
(setq initial-scratch-message nil)
(setq show-paren-delay 0.2)
(setq show-paren-style 'parenthesis)
(setq frame-title-format "%b - %f")
(setq transient-mark-mode t)
(setq ansi-color-for-comint-mode t)
(setq display-time-day-and-date t)
(setq visible-bell nil)
(setq ring-bell-function (lambda () nil))

(display-time-mode 1)
(mouse-avoidance-mode 'jump)
(ido-mode 'both)
(tool-bar-mode -1)
(menu-bar-mode 1)
(scroll-bar-mode -1)
(show-paren-mode 1)
(blink-cursor-mode -1)

(when window-system
  (add-to-list 'default-frame-alist '(foreground-color . "Wheat"))
  (add-to-list 'default-frame-alist '(background-color . "black"))
  (add-to-list 'default-frame-alist '(cursor-color . "firebrick1"))
  (add-to-list 'default-frame-alist '(width . 108))
  (add-to-list 'default-frame-alist '(height . 30))
  t)

(message "global settings loaded.")

