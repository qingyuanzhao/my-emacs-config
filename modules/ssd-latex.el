;; Basic latex settings
(require 'tex-site) ;Activate AUCTeX
(load "auctex.el" nil t t)
(load "preview.el" nil t t)


;; In skim set preference to be /usr/local/bin/emacsclient -f ~/.emacs.d/server/server
;;OS X Madness
(if (eq system-type 'darwin)
    (progn
      (setenv "PATH"
              (concat "/usr/texbin" ":"
                      (getenv "PATH")))
      (setq TeX-view-program-selection '((output-pdf "PDF Viewer")))
      ;; Skim's displayline is used for forward search (from .tex to .pdf)
      ;; option -b highlights the current line; option -g opens Skim in the background
      (setq TeX-view-program-list
            '(("PDF Viewer" "/Applications/Skim.app/Contents/SharedSupport/displayline -b %n %o %b")))
      ))

(add-hook 'LaTeX-mode-hook
          (lambda ()
            (setq flyspell-mode nil)
            (setq TeX-PDF-mode t)       ; PDF mode enable, not plain
            (setq TeX-auto-save t)
            (setq TeX-parse-self t)
            (setq TeX-save-query nil)
            (setq-default TeX-master nil)
            (setq-default TeX-insert-braces nil)
            (setq TeX-source-correlate-method 'synctex)
            (TeX-source-correlate-mode 1)
            (add-to-list 'TeX-command-list '("XeLaTeX" "xelatex -shell-escape %(mode) %t" TeX-run-TeX nil  (latex-mode) ))
            (add-to-list 'TeX-command-list '("pdfLaTeX" "pdflatex -shell-escape %(mode) %t" TeX-run-TeX nil  (latex-mode) ))
            (add-to-list 'TeX-command-list '("latexmk" "latexmk -pdf %s" TeX-run-TeX nil t
                                             :help "Run latexmk on file"))
            (add-to-list 'TeX-command-list '("latexmkpvc" "latexmk -pvc -pdf %s" TeX-run-TeX nil t
                                             :help "Run latexmk on file"))
            (setq TeX-command-default "latexmkpvc")
            (setq TeX-auto-untabify t     ; remove all tabs before saving
                  TeX-show-compilation t) ; display compilation windows
            (imenu-add-menubar-index)
            (define-key LaTeX-mode-map (kbd "TAB") 'TeX-complete-symbol)
            (define-key LaTeX-mode-map [M-S-mouse-1] 'TeX-view) ; bind CMD + shift + click to run TeX-view
            (auto-fill-mode 1)
            (reftex-mode 1)
            (latex-math-mode 1)
            (linum-mode 1)
            (setq TeX-DVI-via-PDFTeX t)
            (setq LaTeX-math-abbrev-prefix '";")  ;Set the math mode prefix to
            (setq TeX-electric-escape nil)
            (add-to-list 'cdlatex-math-modify-alist
                         '(98 "\\boldsymbol" "\\textbf" t nil nil))
            (add-to-list 'cdlatex-math-modify-alist
                         '(115 "\\mathbb" nil t nil nil))
            (setq cdlatex-math-symbol-prefix 168)
            (setq cdlatex-math-symbol-alist
                  '((?< ("\\leq" "\\leftarrow" "\\min" ))
                    (?> ("\\geq" "\\rightarrow" "\\max"))
                    ))
            (cdlatex-reset-mode)
            (setq cdlatex-paired-parens "$")
            ))


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


(setq TeX-macro-global '("/usr/local/texlive/2013/texmf-dist/tex/"))
(setq TeX-macro-private '("/Users/hera/.emacs.d/elpa/auctex-11.87.2/latex/"
                          "~/Users/hera/.emacs.d/auctex/"))
(setq TeX-auto-private '("/Users/hera/.emacs.d/auctex/auto"))

;; cdlatex
;; Need to replace last-command-char to last-command-event in cdlatex.el!!
(autoload 'cdlatex-mode "cdlatex" "CDLaTeX Mode" t)
(autoload 'turn-on-cdlatex "cdlatex" "CDLaTeX Mode" nil)
(add-hook 'LaTeX-mode-hook 'turn-on-cdlatex)   ; with AUCTeX LaTeX mode
(add-hook 'latex-mode-hook 'turn-on-cdlatex)   ; with Emacs latex mode

;; XeLaTeX
;; (setq TeX-open-quote "“")
;; (setq TeX-close-quote "”")
