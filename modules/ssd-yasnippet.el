(require 'yasnippet)
;(yas--initialize)
(yas/load-directory (concat emacs-dir "snippets"))
(setq yas/triggers-in-field t)




;; r-autoyas
(require 'r-autoyas)
(add-hook 'ess-mode-hook 'r-autoyas-ess-activate)
(add-hook 'ess-mode 'yas/minor-mode-on)
(setq r-autoyas-expand-package-functions-only nil)
(setq r-autoyas-use-r-based-dot-replacement nil)
;; (setq r-autoyas-remove-explicit-assignments nil)


(define-key yas-minor-mode-map (kbd "<tab>") nil)
(define-key yas-minor-mode-map (kbd "TAB") nil)
(define-key yas-minor-mode-map (kbd "C-<tab>") 'yas-expand)
(define-key yas/keymap (kbd "C-<tab>") 'yas-next-field-or-maybe-expand)
(define-key yas/keymap (kbd "<tab>") 'cdlatex-tab)
