;; Workaround for poorly made ELPA repo
(require 'ess-site)
(require 'ess-rutils)
(require 'ess-eldoc)
(setq ess-ask-for-ess-directory nil)




(setq ess-source-directory
      (lambda ()
        (concat ess-directory "Src/")))

(add-hook 'ess-mode-hook
          (lambda ()
            (local-set-key (kbd "C-c d") 'ess-rdired)))


(add-hook 'inferior-ess-mode-hook
          '(lambda ()
             (local-set-key (kbd "C-c d") 'ess-rdired)))

(add-hook 'ess-transcript-mode-hook
          '(lambda ()
             (local-set-key (kbd "C-c d") 'ess-rdired)))
