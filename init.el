;; Emacs configuration entry point

;; The following is based on the installation directions
;; for Emacs Starter kit, which can be found at
;; https://github.com/technomancy/emacs-starter-kit


(when (>= emacs-major-version 24)
  (require 'package)
  (setq package-archives '(("melpa" . "http://melpa.milkbox.net/packages/")))
  (package-initialize)
  )


(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages '(ido-ubiquitous ess flymake flymake-ruby flymake-shell
                      org-magit auctex magit python yasnippet color-theme
                      zenburn-theme anti-zenburn-theme writegood-mode maxframe)
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
(server-start)


;; Default font
(set-default-font "monaco-16")
