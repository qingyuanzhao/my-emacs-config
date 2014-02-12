;;python
(require 'python-mode)
(setq-default py-shell-name "ipython")

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
                (font-lock-mode 1))
            (setq comment-start "%")
            ))


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


;; Matlab-mode
(load-library "matlab-load")
(setq matlab-shell-command "/Applications/MATLAB_R2013a_Student.app/bin/matlab")
(setq matlab-shell-command-switches '("-nodesktop -nosplash"))



(autoload 'matlab-mode "matlab" "Enter Matlab mode." t)
(setq auto-mode-alist (cons '("\\.m\\'" . matlab-mode) auto-mode-alist))
(autoload 'matlab-shell "matlab" "Interactive Matlab mode." t)

(defun my-matlab-mode-hook ()
  (setq matlab-function-indent t)       ; if you want function bodies indented
  (setq fill-column 76)                 ; where auto-fill should wrap
  (font-lock-mode 1)
  (turn-on-auto-fill)
  )
(setq matlab-mode-hook 'my-matlab-mode-hook)

(defun my-matlab-shell-mode-hook ()
  (setq matlab-function-indent t)       ; if you want function bodies indented
  (setq fill-column 76)                 ; where auto-fill should wrap
  (font-lock-mode 1)
  )
(setq matlab-shell-mode-hook 'my-matlab-shell-mode-hook)


(custom-set-variables
 '(tab-stop-list (quote (2 4 8 10 12 14 16 18 20 22 24 26 28 30 32))))
(custom-set-faces
 '(font-lock-warning-face ((((class color) (background light)) (:foreground "darkgreen")))))



;; for GDB/debugging in general
(global-set-key (kbd "<f12>") 'gud-cont)
(global-set-key (kbd "<f11>") 'gud-step);; equiv matlab step in
(global-set-key (kbd "<f10>") 'gud-next) ;; equiv matlab step 1
(global-set-key (kbd "<f9>") 'gud-finish) ;; equiv matlab step out
