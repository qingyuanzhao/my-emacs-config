;; Settings for better editing

(setq-default indent-tabs-mode nil)
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(delete-selection-mode t)
(show-paren-mode t)

;; spell-checking
(setq-default ispell-program-name "aspell")
(add-hook 'text-mode-hook 'flyspell-mode)
(add-hook 'text-mode-hook 'turn-on-auto-fill)

;; programming hooks
(require 'linum)
(global-linum-mode 1)


;; uniq buffer names
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)
(setq uniquify-separator "/")
(setq uniquify-ignore-buffers-re "^\\*")

;;keybindings
(global-set-key (kbd "C-M-h") 'backward-kill-word)
(global-set-key (kbd "C-c +") 'text-scale-increase)
(global-set-key (kbd "C-c -") 'text-scale-decrease)
(global-set-key (kbd "C-.") 'repeat)

;; electric modes
(electric-pair-mode t)
;;(electric-indent-mode t)
;;(electric-layout-mode t)


;; Autocompletion/snippets
(global-set-key (kbd "M-'") 'hippie-expand)
(require 'yasnippet)
(yas--initialize)
(yas/load-directory (concat emacs-dir "snippets"))

;; Integrate hippie-expand with ya-snippet
(add-to-list 'hippie-expand-try-functions-list
             'yas/hippie-try-expand)

;; WriteGood-mode
(require 'writegood-mode)
;; (add-hook 'text-mode-hook 'writegood-turn-on)


;; csv-mode
(require 'csv-mode)
(add-to-list 'auto-mode-alist '("\\.[Cc][Ss][Vv]\\'" . csv-mode))
(autoload 'csv-mode "csv-mode"
  "Major mode for editing comma-separated value files." t)



(require 'auto-complete-config)
(ac-config-default)
(setq ac-quick-help-prefer-pos-tip t)
(require 'pos-tip)
