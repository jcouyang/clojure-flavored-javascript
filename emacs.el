(require 'color-theme)
(color-theme-initialize)
(color-theme-gtk-ide)
(require 'clojure-mode)
(clojure-font-lock-setup)
(require 'org)
(require 'ox-latex)
(require 'htmlize)
(setq make-backup-files nil)
(setq book-path (expand-file-name "book"))
(setq org-html-validation-link nil)
(setq org-confirm-babel-evaluate nil)
(add-to-list 'org-latex-classes
               '("tufte" "\\documentclass[11pt,twoside,openright,a5paper]{tufte-book}"
                  ("\\chapter{%s}" . "\\chapter*{%s}")
                  ("\\section{%s}" . "\\section*{%s}")
                  ("\\subsection{%s}" . "\\subsection*{%s}")
                  ))
(setq tex-compile-commands '(("xelatex %r")))
(setq tex-command "xelatex")
(setq-default TeX-engine 'xelatex)

(setq org-latex-pdf-process
      '("xelatex -interaction nonstopmode -output-directory %o %f"
        "xelatex -interaction nonstopmode -output-directory %o %f"
        "xelatex -interaction nonstopmode -output-directory %o %f"))

(setq locate-command "mdfind")
(setenv "PATH" (concat (getenv "PATH") ":/usr/local/share/npm/bin:/usr/local/bin:/usr/texbin"))
(setq exec-path (append exec-path '("/usr/local/bin" "/usr/texbin")))
(custom-set-variables
  '(org-publish-timestamp-directory
     (convert-standard-filename "public/.org-timestamps/")))
(setq postamble (with-temp-buffer
                  (insert-file-contents "html/postamble.html")
                  (buffer-string)))
(setq header (with-temp-buffer
                  (insert-file-contents "html/header.html")
                  (buffer-string)))
(defun set-org-publish-project-alist ()
  "Set publishing projects for Orgweb and Worg."
  (interactive)
  (setq org-publish-project-alist
    `(("html"
       ;; Directory for source files in org format
        :base-directory ,book-path
        :base-extension "org"
        :html-doctype "html5"
        :html-head ,header
        :html-html5-fancy t
        :html-postamble ,postamble
        ;; HTML directory
        :publishing-directory "public"
        :publishing-function org-html-publish-to-html
        :recursive t
        :headline-levels 5
        ;; :with-sub-superscript nil
        :section-numbers 3
        :makeindex t
        :exclude ".*"
        :include ("index.org" "zh/index.org")
        :html-head-include-default-style nil
        )
      ("pdf"
       ;; Directory for source files in org format
        :base-directory ,book-path
        :base-extension "org"
        :publishing-directory "public/pdf"
        :publishing-function org-latex-publish-to-pdf
        :headline-levels 5
        ;; :with-sub-superscript nil
        :section-numbers 3
        :makeindex t
        :exclude ".*"
        :include ("index.org" "zh/index.org")
        )

       ;; where static files (images, pdfs) are stored
       ("blog-static"
         :base-directory ,book-path
         :base-extension "css\\|js\\|png\\|jpg\\|gif\\|mp3\\|ogg\\|swf\\|woff2\\|woff"
         :publishing-directory "public"
         :recursive t
         :publishing-function org-publish-attachment
         )
       ("blog" :components ("book-notes" "book-static"))
       )))
(set-org-publish-project-alist)
