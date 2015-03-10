;;; -*- coding: utf-8-unix; -*-
;;; init.el

;(setq debug-on-error nil)

(add-hook 'after-init-hook
	  `(lambda ()
	     (setq dot-emacs-dir
		   ,(file-name-directory
		     (or load-file-name (buffer-file-name))))
	     (load-file (expand-file-name "pw-init.el" dot-emacs-dir))))

;;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(haskell-process-auto-import-loaded-modules t)
 '(haskell-process-log t)
 '(haskell-process-suggest-remove-import-lines nil)
 '(haskell-process-type (quote cabal-repl))
 '(package-selected-packages
   (quote
    (zeal-at-point yaml-mode web-mode unicode-fonts twittering-mode tuareg textile-mode synonyms solarized-theme smex session rust-mode rinari rainbow-mode rainbow-delimiters r5rs puppet-mode pretty-lambdada php-eldoc php-boris php-auto-yasnippets perspective password-vault paredit org-trello nodejs-repl nginx-mode mwe-log-commands multiple-cursors maxframe marmalade markdown-mode magit lua-mode kv json-mode js2-mode ido-ubiquitous icicles highlight-symbol helm-themes helm-spotify helm-projectile helm-google helm-dired-recent-dirs helm-anything haskell-mode hamlet-mode hackernews grizzl graphviz-dot-mode go-mode gist ghci-completion ghc geiser geben fsvn fold-dwim flx-ido expand-region eredis epoch-view emmet-mode elpy elisp-slime-nav dsvn dockerfile-mode diff-hl debbugs dash-at-point browse-kill-ring adoc-mode ack-and-a-half ack ac-slime ac-cider)))
 '(sql-connection-alist
   (quote
    (("peter@localhost:65432:peter"
      (sql-product
       (quote postgres))
      (sql-user "peter")
      (sql-database "peter")
      (sql-server "localhost"))))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
