(require 'color-theme)
(color-theme-initialize)
(color-theme-gtk-ide)
(require 'clojure-mode)
(clojure-font-lock-setup)
(require 'org)
(require 'htmlize)
(setq make-backup-files nil)
(setq debug-on-error t)
(setq book-path (expand-file-name "book"))
(setq org-html-validation-link nil)
(setq org-confirm-babel-evaluate nil)
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
    `(("books"
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
        :section-numbers nil
        :html-head-include-default-style nil
        )

       ;; where static files (images, pdfs) are stored
       ("blog-static"
         :base-directory ,book-path
         :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf\\|woff2\\|woff"
         :publishing-directory "public"
         :recursive t
         :publishing-function org-publish-attachment
         )
       ("blog" :components ("book-notes" "book-static"))
       )))
(set-org-publish-project-alist)
