
(setq mail-sources '((pop :user "admin" :password "1234" :server "127.0.0.1" :port 110)))
(setq user-mail-address "peterwang@vip.qq.com")
(setq smtpmail-smtp-server "127.0.0.1")
(setq message-send-mail-function 'smtpmail-send-it)
