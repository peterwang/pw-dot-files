(setq gnus-select-method '(nntp "news.gmane.org"))
;;;(setq gnus-select-method '(nntp "news.newsfan.net"))

;(setq smtpmail-smtp-server "smtp@host.com")
;(setq user-mail-address "stefan@host.com")
;(setq message-send-mail-real-function 'smtpmail-send-it)

(setq gnus-summary-line-format "%O%U%R%z%d %B%(%[%4L: %-22,22f%]%) %s\n")
(setq gnus-summary-mode-line-format "Gnus: %p [%A / Sc:%4z] %Z")

(setq gnus-summary-same-subject "")
(setq gnus-sum-thread-tree-root "")
(setq gnus-sum-thread-tree-single-indent "")
(setq gnus-sum-thread-tree-leaf-with-other "+-> ")
(setq gnus-sum-thread-tree-vertical "|")
(setq gnus-sum-thread-tree-single-leaf "`-> ")
