;; org-mode settings
(setq org-completion-use-ido t)




(setq org-use-speed-commands t)
;;Org-auto-mode
(add-to-list 'auto-mode-alist '("\\.\\(org\\|org_archive\\|txt\\)$" . org-mode))

(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t
      org-agenda-files '("~/org/"
                         "~/org/deft"))



;; org-capture
;; to quickly capture new tasks
(define-key global-map "\C-cc" 'org-capture)
(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/org/gtd.org" "Tasks")
         "* TODO %?\n  %i\n")
        ("p" "Project" entry (file+headline "~/org/gtd.org" "Projects")
         "* %?\n %i\n")))

;; refile targets for cleaning up collection
(setq org-refile-targets (quote ((nil :maxlevel . 2)
                                 (org-agenda-files :maxlevel . 3)))
      org-refile-allow-creating-parent-node t)

;; This activates a number of widely used languages, you are encouraged
;; to activate more languages using the customize interface for the
;; `=org-babel-load-languages=' variable, or with an elisp form like the
;; one below.  The customize interface of `=org-babel-load-languages='
;; contains an up to date list of the currently supported languages.

  (org-babel-do-load-languages
   'org-babel-load-languages
   '((emacs-lisp . t)
     (sh . t)
     (R . t)
     (perl . t)
     (ruby . t)
     (python . t)
     (js . t)
     (haskell . t)
     (clojure . t)
     (ditaa . t)
     (octave . t)
     (matlab . t)))
