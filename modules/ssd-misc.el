;; Misc Configuration
(setq default-directory "~/Dropbox/")

;; (setq gist-use-curl t)



(require 'recentf)
(recentf-mode 1)

(setq initial-scratch-message "")

(setq default-major-mode 'org-mode)
(setq initial-major-mode 'org-mode)

;; Global Auto Revert mode is a global minor mode that reverts any buffer associated with a file when the file changes on disk.  Use `auto-revert-mode' to revert a particular buffer.

(global-auto-revert-mode 1)
(setq global-auto-revert-non-file-buffers t)


(setq kill-ring-max 200)



;; Abbrev
(setq default-abbrev-mode t)

(setq abbrev-file-name             ;; tell emacs where to read abbrev
      "~/.emacs.d/abbrev_defs")    ;; definitions from...
(setq save-abbrevs t)              ;; save abbrevs when files are saved
;; you will be asked before the abbreviations are saved
(quietly-read-abbrev-file)       ;; reads the abbreviations file on startup


;; bury *scratch* buffer instead of kill it
(defadvice kill-buffer (around kill-buffer-around-advice activate)
  (let ((buffer-to-kill (ad-get-arg 0)))
    (if (equal buffer-to-kill "*scratch*")
        (bury-buffer)
      ad-do-it)))

;; Rather than saving backup files scattered all over the file system, let them live in the backups/ directory inside of the starter kit.
(setq
   backup-by-copying t      ; don't clobber symlinks
   backup-directory-alist
    '(("." . "~/.saves"))    ; don't litter my fs tree
   delete-old-versions t
   kept-new-versions 6
   kept-old-versions 2
   version-control t)       ; use versioned backups
