(require 'yasnippet)
(yas--initialize)
(yas/load-directory (concat emacs-dir "snippets"))

;; r-autoyas
(require 'r-autoyas)
(add-hook 'ess-mode-hook 'r-autoyas-ess-activate)
(add-hook 'ess-mode 'yas/minor-mode-on)
(setq r-autoyas-expand-package-functions-only nil)
(setq r-autoyas-use-r-based-dot-replacement nil)
;; (setq r-autoyas-remove-explicit-assignments nil)
