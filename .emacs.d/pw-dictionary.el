;;; dictionary

(add-to-list 'load-path "~/.emacs.d/vendor/dictionary-el")

(autoload 'dictionary-search "dictionary" "Ask for a word and search it in all dictionaries" t)
(autoload 'dictionary-match-words "dictionary" "Ask for a word and search all matching words in the dictionaries" t)
(autoload 'dictionary-lookup-definition "dictionary" "Unconditionally lookup the word at point." t)
(autoload 'dictionary "dictionary" "Create a new dictionary buffer" t)
(autoload 'dictionary-mouse-popup-matching-words "dictionary" "Display entries matching the word at the cursor" t)
(autoload 'dictionary-popup-matching-words "dictionary" "Display entries matching the word at the point" t)
(autoload 'dictionary-tooltip-mode "dictionary" "Display tooltips for the current word" t)
(autoload 'global-dictionary-tooltip-mode "dictionary" "Enable/disable dictionary-tooltip-mode for all buffers" t)
(global-set-key "\C-cs" 'dictionary-search)
(global-set-key "\C-cm" 'dictionary-match-words)
(eval-after-load "dictionary"
		 '(progn
		   (setq dictionary-use-single-buffer t
		    dictionary-server "localhost")))
