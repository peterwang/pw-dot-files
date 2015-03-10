;;; -*- coding: utf-8-unix; -*-

;; package
(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)

(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages '(clojure-mode
                      ;clojurescript-mode
		      ;clojure-test-mode
                      ac-slime
                      cider
                      expand-region
                      geiser
                      ;emms
                      ack-and-a-half
                      ;sudo-ext
                      flx-ido
                      grizzl
                      emmet-mode
                      ;hamlet-mode
                      diff-hl
                      ;xclip
                      elpy
                      browse-kill-ring
                      auto-complete
                      elisp-slime-nav
                      password-vault
		      markdown-mode
                      puppet-mode
                      nginx-mode
		      yaml-mode
		      ;zenburn-theme
                      rust-mode
		      graphviz-dot-mode
                      php-mode
                      php-boris
                      php-eldoc
                      php-auto-yasnippets
                      ack
                      helm
                      helm-projectile
                      helm-anything
                      helm-themes
                      helm-spotify
                      helm-google
                      helm-dired-recent-dirs
                      highlight-symbol
		      ;solarized-theme
		      ;color-theme-sanityinc-solarized
                      fold-dwim
                      twittering-mode
                      ;erlang
                      ;; install from github repo
		      ;geiser
                      rainbow-delimiters
                      rainbow-mode
                      multiple-cursors
                      synonyms
                      projectile
                      kv ;; required by org-trello
                      org-trello
                      r5rs
                      pretty-lambdada
                      unicode-fonts
		      json-mode
		      ;color-theme-solarized
		      smex
		      session
		      anything
		      maxframe
		      magit
		      js2-mode
                      eredis
		      geben
		      haskell-mode
		      ghc
                      go-mode
                      tuareg ;; ocaml
                      web-mode
                      gist
                      nodejs-repl
		      dsvn
		      fsvn
		      ghci-completion
		      paredit
		      yasnippet
                      icicles
		      ido-ubiquitous
                      hackernews
		      marmalade
                      epoch-view))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;; load theme
(setq custom-safe-themes
      '("501caa208affa1145ccbb4b74b6cd66c3091e41c5bb66c677feda9def5eab19c"
	"fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6"
	default))
(load-theme 'solarized-dark t)
;; (load-theme 'solarized-light t)

;; customize UI
(display-time-mode 1)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(column-number-mode 1)
(show-paren-mode 1)
(ido-mode 'both)
;(ido-ubiquitous-mode 1)
;(set-face-background 'secondary-selection "gray")

;; font
(set-frame-font "Monaco:pixelsize=16")
(dolist (p '(han cjk-misc bopomofo))
  (set-fontset-font (frame-parameter nil 'font) p '("Hei" . "unicode-bmp")))

(set-fontset-font (frame-parameter nil 'font) 'greek-iso8859-7 "Menlo")

;(require 'unicode-fonts)
;(unicode-fonts-setup)

;; save command history
(savehist-mode 1)

;; svn
(require 'dsvn)

;; recent files
(require 'recentf)
(recentf-mode 1)

;; dired-x
(add-hook 'dired-load-hook (lambda ()
			     (load "dired-x")))

;; yaml mode
(require 'yaml-mode)

(require 'paredit)
(add-hook 'scheme-mode-hook 'enable-paredit-mode)
;(add-hook 'scheme-mode-hook 'pretty-lambda-mode)

(add-hook 'lisp-mode-hook 'enable-paredit-mode)
;(add-hook 'lisp-mode-hook 'pretty-lambda-mode)

(add-hook 'clojure-mode-hook 'enable-paredit-mode)
;(add-hook 'clojure-mode-hook 'nrepl-turn-on-eldoc-mode)
;(add-hook 'clojure-mode-hook 'pretty-lambda-mode)

;(add-hook 'nrepl-repl-mode-hook 'enable-paredit-mode)
;(add-hook 'nrepl-mode-hook 'pretty-lambda-mode)
(add-hook 'cider-repl-mode-hook 'enable-paredit-mode)

(add-hook 'slime-repl-mode-hook 'enable-paredit-mode)
(defun override-slime-repl-bindings-with-paredit ()
  (define-key slime-repl-mode-map
      (read-kbd-macro paredit-backward-delete-key) 'paredit-backward-delete))
(add-hook 'slime-repl-mode-hook 'override-slime-repl-bindings-with-paredit)

(add-hook 'geiser-repl-mode-hook 'enable-paredit-mode)

(add-hook 'emacs-lisp-mode-hook 'enable-paredit-mode)
(add-hook 'ielm-mode-hook 'enable-paredit-mode)

;; desktop and session
(require 'desktop)
(desktop-save-mode 1)
(require 'session)
(add-hook 'after-init-hook 'session-initialize)
(setq desktop-globals-to-save '(desktop-missing-file-warning))

;; defaults
(load (expand-file-name "pw-defaults" dot-emacs-dir))

;; launch
(load (expand-file-name "pw-launch" dot-emacs-dir))

;; gnus
(load (expand-file-name "pw-gnus" dot-emacs-dir))

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
;(add-to-list 'exec-path "~/apps/ghc/bin")
;(add-to-list 'exec-path "~/.cabal/bin")

(defun haskell-style ()
  "Sets the current buffer to use Haskell Style. Meant to be
  added to `haskell-mode-hook'"
  (interactive)
  (setq tab-width 4
        haskell-indentation-layout-offset 4
        haskell-indentation-left-offset 4
        haskell-indentation-ifte-offset 4))

(add-hook 'haskell-mode-hook 'haskell-style)
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
;; (add-hook 'haskell-mode-hook (lambda () (setq haskell-indent-spaces 4)))
;; (add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
;;(add-hook 'haskell-mode-hook (lambda () (setq haskell-font-lock-symbols 'unicode)))

;;(add-to-list 'load-path "~/.cabal/share/ghc-mod-1.11.3")

;;(autoload 'ghc-init "ghc" nil t)
;;(add-hook 'haskell-mode-hook (lambda () (ghc-init)))

;; (require 'ghci-completion)
;; (add-hook 'inferior-haskell-mode-hook 'turn-on-ghci-completion)
(custom-set-variables
  '(haskell-process-suggest-remove-import-lines nil)
  '(haskell-process-auto-import-loaded-modules t)
  '(haskell-process-log t)
  '(haskell-process-type 'cabal-repl))

(define-key haskell-mode-map (kbd "C-c C-l") 'haskell-process-load-or-reload)
(define-key haskell-mode-map (kbd "C-`") 'haskell-interactive-bring)
(define-key haskell-mode-map (kbd "C-c C-z") 'haskell-interactive-bring)
(define-key haskell-mode-map (kbd "C-c C-t") 'haskell-process-do-type)
(define-key haskell-mode-map (kbd "C-c C-i") 'haskell-process-do-info)
(define-key haskell-mode-map (kbd "C-c C-c") 'haskell-process-cabal-build)
(define-key haskell-mode-map (kbd "C-c C-k") 'haskell-interactive-mode-clear)
(define-key haskell-mode-map (kbd "C-c c") 'haskell-process-cabal)
(define-key haskell-mode-map (kbd "SPC") 'haskell-mode-contextual-space)
(define-key haskell-mode-map (kbd "M-.") 'haskell-mode-jump-to-def)

;(define-key haskell-cabal-mode-map (kbd "C-`") 'haskell-interactive-bring)
;(define-key haskell-cabal-mode-map (kbd "C-c C-k") 'haskell-interactive-mode-clear)
;(define-key haskell-cabal-mode-map (kbd "C-c C-c") 'haskell-process-cabal-build)
;(define-key haskell-cabal-mode-map (kbd "C-c c") 'haskell-process-cabal)

;; smex
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)
(global-set-key (kbd "C-x C-b") 'bs-show)
(global-set-key (kbd "C-c k") 'browse-kill-ring)

;; org
(setq org-default-notes-file "~/tmp/notes.org")
(define-key global-map "\C-cc" 'org-capture)

(require 'php-auto-yasnippets)
(define-key php-mode-map (kbd "C-c C-y") 'yas/create-php-snippet)

;; auto-complete
;; (require 'auto-complete-config)
;; (add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
;; (ac-config-default)

;; folding
(add-to-list 'load-path "~/.emacs.d/vendor/folding.el")
(when (load "folding" 'nomessage 'noerror)
    (folding-mode-add-find-file-hook))

;; config
(set-language-environment "UTF-8")
(fset 'yes-or-no-p 'y-or-n-p)

;; geiser
;(load-file "~/repos/git/geiser/elisp/geiser.el")
(require 'geiser)

(progn
  (setq frame-title-format "%b - %f")
  (setq shell-file-name (executable-find "bash"))
  (setq sql-postgres-program (executable-find "psql92"))
  (setq geiser-racket-binary "/Applications/Racket v6.1/bin/mzscheme")
  ;;(setq geiser-racket-binary "/Users/peter/tmp/ikarus-0.0.3/ikarus")
  ;;(setq geiser-racket-binary "/Users/peter/repos/git/racket/racket/bin/racket")
  (setq display-time-day-and-date t)
  (setq display-time-24hr-format t)
  (setq make-backup-files nil)
  (setq dired-use-ls-dired nil)
  (setq inhibit-startup-screen t)
  (setq initial-scratch-message nil)
  (setq ring-bell-function (lambda () nil)))


(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; erlang
(add-to-list 'load-path "/opt/local/lib/erlang/lib/tools-2.7/emacs")
(setq erlang-root-dir "/opt/local/lib/erlang")
(add-to-list 'exec-path "/opt/local/lib/erlang/bin")
(require 'erlang-start)
(setq inferior-erlang-machine-options '("-sname" "emacs@localhost"))
(add-to-list 'load-path "~/repos/git/distel/elisp")
(require 'distel)
(distel-setup)

(progn
  (setenv "JVM_OPTS" "-Xmx2048m -server")
  (menu-bar-mode 1)
  (set-frame-position nil 0 0)
  (set-frame-size nil 140 35))

(global-set-key (kbd "C-c h") 'helm-mini)

(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)

(dolist (hook '(emacs-lisp-mode-hook ielm-mode-hook))
  (add-hook hook 'turn-on-elisp-slime-nav-mode))

(setq php-boris-command "~/repos/git/boris/bin/boris")

;(global-undo-tree-mode 1)

;;; emms
;; (emms-standard)
;; (emms-default-players)
;; (setq emms-repeat-playlist t)
;; (setq emms-player-list '(emms-player-mplayer))
;; (setq emms-source-file-default-directory "~/Box Documents/Music/")


(defun pw-update-repos ()
  (interactive)
  (async-shell-command "svn up /workspace/{www-site-trunk,app-proxy,app-skynet,ops-puppet,ops-fabric,ops-sensu}" (get-buffer-create " *repos-update*")))
(global-set-key (kbd "C-c p u") 'pw-update-repos)

;; projectile
(projectile-global-mode 1)
(setq projectile-enable-caching t)
(setq projectile-completion-system 'ido)
(add-to-list 'projectile-globally-ignored-directories ".svn")
(global-set-key (kbd "C-c h") 'helm-projectile)
(global-set-key (kbd "C-c i") 'helm-imenu)
(global-set-key (kbd "C-c t") 'helm-etags-select)

(defun run-php-test ()
  "Run spreaker php tests"
  (interactive)
  (let* ((tmpl "sudo ssh vagrant@127.0.0.1 -p 2222 -o StrictHostKeyChecking=no -i ~/.vagrant.d/insecure_private_key \"cd /workspace/www-site && php symfony %s\"")
         (f (buffer-file-name))
         (cmd (cond
                ((string-match "test/unit" f)
                 (format "test:unit %s" (substring (file-name-base f) 0 -4)))
                ((string-match "test/functional" f)
                 (when (string-match "test/functional/\\(\\w+\\)/\\(\\w+.\\w+\\)Test.php" f)
                   (format "test:functional %s %s"
                           (match-string-no-properties 1 f)
                           (match-string-no-properties 2 f))))
                (t nil))))
    (if cmd
        ;;(async-shell-command (format tmpl cmd) (get-buffer-create " *php-test*"))
        (compilation-start (format tmpl cmd))
        (message "Not a php test"))))

(add-to-list
 'compilation-error-regexp-alist-alist
 '(php "Failed test \\(.*\\) at line \\([0-9]+\\)" 1 2 nil nil))

;; not ok 1
;; #     Failed test (./test/unit/util/spUtilTest.php at line 34)

;; not ok 2 - request parameter action is pagex
;; #     Failed test (./lib/vendor/symfony-1.4.20/lib/test/sfTesterRequest.class.php at line 48)

;; INFO path
(eval-after-load 'info
                 '(progn
                   (push "/opt/local/share/info/" Info-default-directory-list)
                   ;; (push "~/.emacs.d/info/" Info-default-directory-list)
                   ))

(global-set-key (kbd "s-r") 'run-php-test)

(eval-after-load 'w3m-search
                 '(progn
                   (push '("youdao" "http://www.youdao.com/search?q=%s") w3m-search-engine-alist)
                   (setq w3m-search-default-engine "yahoo")))
