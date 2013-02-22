
(provide 'pw-fonts-settings)

;; emacs 22
(when (and window-system (= emacs-major-version 22))
  (create-fontset-from-fontset-spec
   (concat
    "-outline-Monaco-normal-r-normal-normal-14-*-96-96-c-*-fontset-chinese,"
    "chinese-gb2312:-outline-Î¢ÈíÑÅºÚ-*-r-*-*-14-*-96-96-p-*-iso10646-1," 
    "mule-unicode-0100-24ff:-outline-Î¢ÈíÑÅºÚ-*-r-*-*-14-*-96-96-p-*-iso10646-1," 
    "korean-ksc5601:-outline-Î¢ÈíÑÅºÚ-*-r-*-*-14-*-96-96-p-*-iso10646-1," 
    "chinese-cns11643-5:-outline-Î¢ÈíÑÅºÚ-*-r-*-*-14-*-96-96-p-*-iso10646-1," 
    "chinese-cns11643-6:-outline-Î¢ÈíÑÅºÚ-*-r-*-*-14-*-96-96-p-*-iso10646-1," 
    "chinese-cns11643-7:-outline-Î¢ÈíÑÅºÚ-*-r-*-*-14-*-96-96-p-*-iso10646-1," 
    "sjis:-outline-Î¢ÈíÑÅºÚ-*-r-*-*-14-*-96-96-p-*-iso10646-1"))
  (set-default-font "fontset-chinese")
  (add-to-list 'default-frame-alist '(font . "fontset-chinese"))
  t)

;; emacs 23
(when (and window-system (= emacs-major-version 23))
  (defun my-default-font()
    (interactive)
    (set-default-font "Monaco")
    (set-fontset-font "fontset-default"
		      'han '("Microsoft YaHei" . "unicode-bmp"))
    (set-fontset-font (frame-parameter nil 'font)
		      'symbol '("Microsoft YaHei" . "unicode-bmp"))
    (set-fontset-font (frame-parameter nil 'font)
		      'cjk-misc '("Microsoft YaHei" . "unicode-bmp"))
    (set-fontset-font (frame-parameter nil 'font)
		      'bopomofo '("Microsoft YaHei" . "unicode-bmp")))

  (add-to-list 'after-make-frame-functions
	       (lambda (new-frame)
		 (select-frame new-frame)
		 (if window-system
		     (my-default-font))))
  (if window-system
      (my-default-font))
  t)

(message "fonts settings loaded.")