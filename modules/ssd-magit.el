(require 'magit)
(define-key global-map "\M-\C-g" 'magit-status)
;; Fix the issue of committing in a newly opened window
(set-variable 'magit-emacsclient-executable "/usr/local/Cellar/emacs/24.3/bin/emacsclient")
