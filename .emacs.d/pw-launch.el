;;; irc

(defun pw-irc ()
  (interactive)
  (unless (boundp 'erc-password)
    (load-file "~/repos/git/pw/x.el.gpg"))
  (erc-tls
   :server "irc.freenode.net"
   :port 6697
   :nick erc-nick
   :password erc-password
   :full-name "Peter Wang"))
