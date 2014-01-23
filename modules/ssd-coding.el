;;python

(require 'python-mode)


;; octave
;; autolad octave mode for *.m-files
(autoload 'octave-mode "octave-mod" nil t)
(setq auto-mode-alist
      (cons '("\\.m$" . octave-mode) auto-mode-alist))
;; to turn on the abbrevs, auto-fill and font-lock features automatically
(add-hook 'octave-mode-hook
          (lambda ()
            (abbrev-mode 1)
            (auto-fill-mode 1)
            (if (eq window-system 'x)
                (font-lock-mode 1))))


;; ESS-mode
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
