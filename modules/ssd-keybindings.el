;; Keybinding
;;set command key to be meta and set option key to be Ctrl
(setq mac-command-modifier 'meta mac-option-modifier 'ctrl)
(global-set-key (kbd "C-z") 'undo)


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
