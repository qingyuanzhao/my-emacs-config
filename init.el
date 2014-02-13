;; Emacs configuration entry point

;; The following is based on the installation directions
;; for Emacs Starter kit, which can be found at
;; https://github.com/technomancy/emacs-starter-kit


(when (>= emacs-major-version 24)
  (require 'package)
  (setq package-archives '(("marmalade" . "http://marmalade-repo.org/packages/")
                           ;; ("gnu" . "http://elpa.gnu.org/packages/")
                           ("melpa" . "http://melpa.milkbox.net/packages/")
                           ))
  (package-initialize)
  )


(when (not package-archive-contents)
  (package-refresh-contents))


(defvar my-packages '(ido-ubiquitous ess flymake flymake-ruby flymake-shell
                      org-magit auctex magit python yasnippet color-theme
                      zenburn-theme anti-zenburn-theme writegood-mode maxframe python-mode ipython pos-tip auto-complete autopair auctex-latexmk r-autoyas browse-kill-ring rebox2 matlab-mode solarized-theme soothe-theme)
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;; load vendor and custom files
(defvar emacs-dir (file-name-directory load-file-name)
  "top level emacs dir")
(defvar vendor-dir (concat emacs-dir "vendor/")
  "Packages not yet avilable in ELPA")
(defvar module-dir (concat emacs-dir "modules/")
  "The core of my emacs config")

;; Add to load path
(add-to-list 'load-path vendor-dir)
(add-to-list 'load-path module-dir)

;; Require packages in modules/
(mapc 'load (directory-files module-dir nil "^[^#].*el$"))


;; Default font
(set-default-font "monaco-16")



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(csv-separators (quote (";" "	")))
 '(custom-safe-themes (quote ("d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" default)))
 '(tab-stop-list (quote (2 4 8 10 12 14 16 18 20 22 24 26 28 30 32))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-lock-warning-face ((((class color) (background light)) (:foreground "darkgreen")))))


(setq server-use-tcp t)
(server-start)
