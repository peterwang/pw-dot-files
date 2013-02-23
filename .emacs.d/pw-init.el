;;; -*- coding: utf-8-unix; -*-

;; package
(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages '(clojure-mode
		      clojure-test-mode
		      markdown-mode
		      yaml-mode
		      zenburn-theme
		      solarized-theme
		      smex
		      magit
		      js2-mode
		      geben
		      haskell-mode
		      paredit
		      yasnippet
		      auto-complete
		      ido-ubiquitous
		      marmalade))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;; load theme
(setq custom-safe-themes
      '("501caa208affa1145ccbb4b74b6cd66c3091e41c5bb66c677feda9def5eab19c"
	default))
(load-theme 'solarized-dark)

;; customize UI
(tool-bar-mode -1)
(scroll-bar-mode -1)
(column-number-mode 1)
(show-paren-mode 1)
(ido-mode 'both)
(ido-ubiquitous-mode 1)
(set-face-background 'secondary-selection "gray")

;; font
(set-frame-font "Monaco:pixelsize=14")
(dolist (p '(han symbol cjk-misc bopomofo))
  (set-fontset-font (frame-parameter nil 'font) p '("Hei" . "unicode-bmp")))

;; lisp
(load (expand-file-name "pw-lisp" dot-emacs-dir))

;; webdev
(load (expand-file-name "pw-webdev" dot-emacs-dir))

;; haskell

;; smex
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; auto-complete
(require 'auto-complete-config)
;(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)

;; config
(set-language-environment "UTF-8")
(fset 'yes-or-no-p 'y-or-n-p)


(progn
  (setq frame-title-format "%b - %f")
  (setq make-backup-files nil)
  (setq dired-use-ls-dired nil)
  (setq inhibit-startup-screen t)
  (setq initial-scratch-message nil)
  (setq ring-bell-function (lambda () nil)))
