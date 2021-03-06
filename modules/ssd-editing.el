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
;;(electric-pair-mode t)
;;(electric-indent-mode t)
;;(electric-layout-mode t)

;; Autopair mode
(require 'autopair)
(autopair-global-mode) ;; to enable in all buffers



;; Autocompletion/snippets
(global-set-key (kbd "M-'") 'hippie-expand)

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


;; kill-ring
;;(setq kill-ring-max 200)
(require 'browse-kill-ring)
  (when (require 'browse-kill-ring nil 'noerror)
  (browse-kill-ring-default-keybindings))



;; (require 'auto-complete-config)
;; (ac-config-default)
;; (setq ac-quick-help-prefer-pos-tip t)
;; (require 'pos-tip)


;; rebox2 setting
(setq rebox-style-loop '(20 33))
(require 'rebox2)
(global-set-key [(meta q)] 'rebox-dwim)
(global-set-key [(shift meta q)] 'rebox-cycle)
