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
		      graphviz-dot-mode
		      ;solarized-theme
		      ;color-theme-sanityinc-solarized
		      color-theme-solarized
		      smex
		      session
		      anything
		      maxframe
		      magit
		      js2-mode
		      geben
		      haskell-mode
		      ghc
		      dsvn
		      ghci-completion
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
	"fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6"
	default))
(load-theme 'solarized-dark)

;; customize UI
(display-time-mode 1)
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

;; save command history
(savehist-mode 1)

;; recent files
(require 'recentf)
(recentf-mode 1)

;; dired-x
(add-hook 'dired-load-hook (lambda ()
			     (load "dired-x")))

;; desktop and session
(require 'desktop)
(desktop-save-mode 1)
(require 'session)
(add-hook 'after-init-hook 'session-initialize)
(setq desktop-globals-to-save '(desktop-missing-file-warning))

;; lisp
(load (expand-file-name "pw-lisp" dot-emacs-dir))

;; webdev
(load (expand-file-name "pw-webdev" dot-emacs-dir))

;; doxymacs
;(load (expand-file-name "pw-doxymacs" dot-emacs-dir))

;; dictionary
(load (expand-file-name "pw-dictionary" dot-emacs-dir))

;; w3m
(load (expand-file-name "pw-w3m" dot-emacs-dir))

;; haskell
(add-to-list 'exec-path "~/apps/ghc/bin")
(add-to-list 'exec-path "~/.cabal/bin")

(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)

(add-to-list 'load-path "~/.cabal/share/ghc-mod-1.11.3")

(autoload 'ghc-init "ghc" nil t)
(add-hook 'haskell-mode-hook (lambda () (ghc-init)))

(require 'ghci-completion)
(add-hook 'inferior-haskell-mode-hook 'turn-on-ghci-completion)

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
  (setq shell-file-name (executable-find "bash"))
  (setq display-time-day-and-date t)
  (setq display-time-24hr-format t)
  (setq make-backup-files nil)
  (setq dired-use-ls-dired nil)
  (setq inhibit-startup-screen t)
  (setq initial-scratch-message nil)
  (setq ring-bell-function (lambda () nil)))


(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
