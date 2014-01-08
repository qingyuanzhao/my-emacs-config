;; Basic latex settings
(require 'tex-site) ;Activate AUCTeX
(load "auctex-pkg.el" nil t t)
(load "preview.el" nil t t)


;; load Reftex
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)   ; with AUCTeX LaTeX mode
(autoload 'reftex-mode     "reftex" "RefTeX Minor Mode" t)
(autoload 'turn-on-reftex  "reftex" "RefTeX Minor Mode" nil)
(autoload 'reftex-citation "reftex-cite" "Make citation" nil)
(autoload 'reftex-index-phrase-mode "reftex-index" "Phrase mode" t)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)   ; with AUCTeX LaTeX mode
(add-hook 'latex-mode-hook 'turn-on-reftex)   ; with Emacs latex mode

;; Make RefTeX faster
(setq reftex-enable-partial-scans t)
(setq reftex-save-parse-info t)
(setq reftex-use-multiple-selection-buffers t)
(setq reftex-plug-into-AUCTeX t)

;; Make RefTeX work with Org-Mode
;; use 'C-c (' instead of 'C-c [' because the latter is already
;; defined in orgmode to the add-to-agenda command.
(defun org-mode-reftex-setup ()
  (load-library "reftex")
  (and (buffer-file-name)
       (file-exists-p (buffer-file-name))
       (reftex-parse-all))
  (define-key org-mode-map (kbd "C-c (") 'reftex-citation))

(add-hook 'org-mode-hook 'org-mode-reftex-setup)

;; RefTeX formats for biblatex (not natbib)
(setq reftex-cite-format
      '(
        (?\C-m . "\\cite[]{%l}")
        (?t . "\\textcite{%l}")
        (?a . "\\autocite[]{%l}")
        (?p . "\\parencite{%l}")
        (?f . "\\footcite[][]{%l}")
        (?F . "\\fullcite[]{%l}")
        (?x . "[]{%l}")
        (?X . "{%l}")
        ))

(setq font-latex-match-reference-keywords
      '(("cite" "[{")
        ("cites" "[{}]")
        ("footcite" "[{")
        ("footcites" "[{")
        ("parencite" "[{")
        ("textcite" "[{")
        ("fullcite" "[{")
        ("citetitle" "[{")
        ("citetitles" "[{")
        ("headlessfullcite" "[{")))

(setq reftex-cite-prompt-optional-args nil)
(setq reftex-cite-cleanup-optional-args t)



(setq TeX-auto-save t)
(setq TeX-parse-self t)



(add-hook 'LaTeX-mode-hook
          (lambda ()
            (add-to-list 'TeX-command-list '("XeLaTeX" "xelatex -shell-escape %(mode) %t" TeX-run-TeX nil  (latex-mode) ))
            (add-to-list 'TeX-command-list '("pdfLaTeX" "pdflatex -shell-escape %(mode) %t" TeX-run-TeX nil  (latex-mode) ))
            (setq TeX-command-default "XeLaTeX")
            (setq TeX-auto-untabify t     ; remove all tabs before saving
                  TeX-show-compilation t) ; display compilation windows
            (setq TeX-PDF-mode t)       ; PDF mode enable, not plain
            (setq TeX-save-query nil)
            (imenu-add-menubar-index)
            (define-key LaTeX-mode-map (kbd "TAB") 'TeX-complete-symbol)
            (auto-fill-mode 1)
            (reftex-mode 1)
            (latex-math-mode 1)
            (linum-mode 1)
            (setq TeX-DVI-via-PDFTeX t)
            (setq LaTeX-math-abbrev-prefix '";")  ;Set the math mode prefix to
            (setq TeX-electric-escape t))
          )


;; XeLaTeX
(setq TeX-open-quote "“")
(setq TeX-close-quote "”")



;; OS X Madness
(if (eq system-type 'darwin)
    (progn
      (setenv "PATH"
              (concat "/usr/texbin" ":"
                      (getenv "PATH")))
      (setq TeX-view-program-list '(("Shell Default" "open %o")))
      (setq TeX-view-program-selection '((output-pdf "Shell Default")))))