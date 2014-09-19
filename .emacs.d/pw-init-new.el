;;; Cask & Pallet
(require 'cask "~/.cask/cask.el")
(cask-initialize)
(require 'pallet)

;;; UI
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(display-time-mode 1)
(column-number-mode 1)
(show-paren-mode 1)
(savehist-mode 1)
(ido-mode 'both)
(load-theme 'solarized-dark t)

(set-language-environment "UTF-8")
(fset 'yes-or-no-p 'y-or-n-p)

;;; Fonts
(set-frame-font "Monaco:pixelsize=14")
(dolist (p '(han cjk-misc bopomofo))
  (set-fontset-font (frame-parameter nil 'font) p '("Hei" . "unicode-bmp")))
(set-fontset-font (frame-parameter nil 'font) 'greek-iso8859-7 "Menlo")
;(require 'unicode-fonts)
;(unicode-fonts-setup)

;;; Variables
(progn
  (setq frame-title-format "%b - %f")
  (setq shell-file-name (executable-find "bash"))
  (setq sql-postgres-program (executable-find "psql92"))
  (setq geiser-racket-binary "/Applications/Racket v6.0.1/bin/mzscheme")
  ;;(setq geiser-racket-binary "/Users/peter/tmp/ikarus-0.0.3/ikarus")
  ;;(setq geiser-racket-binary "/Users/peter/repos/git/racket/racket/bin/racket")
  (setq display-time-day-and-date t)
  (setq display-time-24hr-format t)
  (setq make-backup-files nil)
  (setq dired-use-ls-dired nil)
  (setq inhibit-startup-screen t)
  (setq initial-scratch-message nil)
  (setq ring-bell-function (lambda () nil)))

;; Hooks
(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
(add-hook 'before-save-hook 'delete-trailing-whitespace)
