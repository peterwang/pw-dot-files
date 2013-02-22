;; 

(provide 'pw-muse-settings)

;; base settings
(add-to-list 'load-path "~/git/muse-el/lisp")
;(add-to-list 'load-path "c:/devel/git/muse-el/lisp")
(require 'muse-mode)
(require 'muse-publish)
(require 'muse-html)

(require 'muse-latex)
;; projects

(setq muse-publish-date-format "%Y-%m-%d")

(setq muse-latexcjk-header
  "\\documentclass{article}

\\usepackage{CJK,CJKutf8}
\\usepackage{indentfirst}
\\usepackage[unicode]{hyperref}
\\usepackage[pdftex]{graphicx}

\\def\\museincludegraphics{%
  \\begingroup
  \\catcode`\\|=0
  \\catcode`\\\\=12
  \\catcode`\\#=12
  \\includegraphics[width=0.75\\textwidth]
}

\\begin{document}
\\begin{CJK*}<lisp>(muse-latexcjk-encoding)</lisp>

\\title{<lisp>(muse-publish-escape-specials-in-string
  (muse-publishing-directive \"title\") 'document)</lisp>}
\\author{<lisp>(muse-publishing-directive \"author\")</lisp>}
\\date{<lisp>(muse-publishing-directive \"date\")</lisp>}

\\maketitle

<lisp>(and muse-publish-generate-contents
           (not muse-latex-permit-contents-tag)
           \"\\\\tableofcontents\n\\\\newpage\")</lisp>\n\n")


(setq muse-latex-slides-header
  "\\documentclass[CJK]{beamer}

\\usepackage[T1]{fontenc}
\\usepackage{CJK,CJKutf8}
\\usepackage{hyperref}
\\usepackage{graphicx}

\\def\\museincludegraphics{%
  \\begingroup
  \\catcode`\\|=0
  \\catcode`\\\\=12
  \\catcode`\\#=12
  \\includegraphics[width=0.75\\textwidth]
}

\\begin{document}
\\begin{CJK*}{UTF8}{hei}

\\title{<lisp>(muse-publish-escape-specials-in-string
  (muse-publishing-directive \"title\") 'document)</lisp>}
\\author{<lisp>(muse-publishing-directive \"author\")</lisp>}
\\date{<lisp>(muse-publishing-directive \"date\")</lisp>}

\\maketitle

<lisp>(and muse-publish-generate-contents
           \"\\\\tableofcontents\n\\\\newpage\")</lisp>\n\n")

(muse-derive-style "slidescjk" "latex"
                   :header 'muse-latex-slides-header
                   :tags   'muse-latex-slides-markup-tags
		   :footer 'muse-latexcjk-footer)

(setq muse-latexcjk-encoding-map
  '((utf-8              . "{UTF8}{hei}")
    (japanese-iso-8bit  . "[dnp]{JIS}{min}")
    (chinese-big5       . "{Bg5}{bsmi}")
    (mule-utf-8         . "{UTF8}{hei}")
    (chinese-iso-8bit   . "{GB}{hei}")
    (chinese-gbk        . "{GBK}{hei}")))