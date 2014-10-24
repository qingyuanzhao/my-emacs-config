;; Keybinding
;;set command key to be meta and set option key to be Ctrl
(when (eq system-type 'darwin)
  (when (string= user-login-name "hera")
    (setq mac-command-modifier 'meta mac-option-modifier 'ctrl))
  (when (string= user-login-name "yhe1")
    (setq mac-command-modifier 'meta mac-option-modifier 'ctrl))
  (when (string= user-login-name "qyzhao")
    (setq mac-command-modifier 'ctrl mac-option-modifier 'meta)))




(global-set-key (kbd "C-z") 'undo)

;; Set yasnippet expansion key to C-o
(global-set-key (kbd "C-o") 'yas-expand-from-trigger-key)


;; Fontsize
(define-key global-map (kbd "C-+") 'text-scale-increase)
(define-key global-map (kbd "C--") 'text-scale-decrease)


;; Filefiding
(global-set-key (kbd "C-x f") 'recentf-ido-find-file)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(when (require 'browse-kill-ring nil 'noerror)
  (browse-kill-ring-default-keybindings))

;; Indentation
(global-set-key (kbd "C-x ^") 'join-line)



(global-set-key (kbd "<f8> r") '(lambda () (interactive) (find-file-read-only "~/Dropbox/org/notes/reference.org")))
(global-set-key (kbd "<f8> n") 'org-narrow-to-subtree)
(global-set-key (kbd "<f8> w") 'widen)
