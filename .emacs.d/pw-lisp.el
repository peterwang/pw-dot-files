
(load (expand-file-name "~/quicklisp/slime-helper.el"))
(setq inferior-lisp-program "~/apps/sbcl/bin/sbcl")

(require 'slime)

(slime-setup '(slime-fancy
	       slime-fancy-inspector
	       slime-repl
	       slime-fuzzy
	       slime-presentations
	       slime-autodoc
	       slime-indentation))

(setq slime-complete-symbol-function 'slime-fuzzy-complete-symbol)
(setq slime-net-coding-system 'utf-8-unix)
(setq lisp-indent-function 'common-lisp-indent-function)
(setq slime-startup-animation t)
(setq slime-enable-evaluate-in-emacs t)
(setq slime-log-events t)
(setq slime-outline-mode-in-events-buffer nil)
(setq slime-repl-return-behaviour :send-only-if-after-complete)
(setq slime-autodoc-use-multiline-p t)
(setq slime-highlight-compiler-notes t)
(setq slime-fuzzy-completion-in-place nil)
(setq common-lisp-hyperspec-root
      "/opt/local/share/doc/lisp/HyperSpec-7-0/HyperSpec/")
