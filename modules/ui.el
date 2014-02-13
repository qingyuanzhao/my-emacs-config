;; Theme
;; (add-to-list 'custom-theme-load-path (concat emacs-dir "themes/"))
;; (load-theme 'ssd-colors t)
;; (load-theme 'anti-zenburn t)
;;(load-theme 'solarized-light t)
(load-theme 'solarized-dark t)

;; other ui
;; move into the theme eventually
(set-face-attribute 'mode-line nil :box nil)
(set-face-attribute 'mode-line-inactive nil :box nil)
;; font
(if (eq system-type 'darwin)
    (set-face-attribute 'default nil :height 120 :family "Monaco")
    (set-face-attribute 'default nil :height 100 :family "Monaco"))

;; Remove uncessary UI elements
(scroll-bar-mode -1)
(tool-bar-mode -1)
(fringe-mode -1)
(blink-cursor-mode -1)
(setq inhibit-startup-screen t)
(menu-bar-mode 1)

;; Modeline
(line-number-mode t)
(column-number-mode t)
(size-indication-mode t)

;;behavior
(fset 'yes-or-no-p 'y-or-n-p)

;; linum-mode style
(setq linum-format "%d ")

;;hl-line
;;(global-hl-line-mode)



;; run emacs in full screen
(require 'maxframe)
(setq mf-max-width 1280)  ;; Pixel width of main monitor.
(setq mf-max-height 720)  ;; Pixel width of main monitor.
(defvar my-fullscreen-p t "Check if fullscreen is on or off")
(defun my-toggle-fullscreen ()
  (interactive)
  (setq my-fullscreen-p (not my-fullscreen-p))
  (if my-fullscreen-p
      (restore-frame)
    (maximize-frame)))
(global-set-key (kbd "C-c f") 'my-toggle-fullscreen)





;; set default mode line format, conflict with csv mode
;; (setq-default mode-line-format
;;               (list
;;                ;; the buffer name; the file name as a tool tip
;;                '(:eval (propertize "%b " 'face 'font-lock-keyword-face
;;                                    'help-echo (buffer-file-name)))

;;                ;; line and column
;;                "(" ;; '%02' to set to 2 chars at least; prevents flickering
;;                (propertize "%02l" 'face 'font-lock-type-face) ","
;;                (propertize "%02c" 'face 'font-lock-type-face)
;;                ") "

;;                ;; relative position, size of file
;;                "["
;;                (propertize "%p" 'face 'font-lock-constant-face) ;; % above top
;;                "/"
;;                (propertize "%I" 'face 'font-lock-constant-face) ;; size
;;                "] "

;;                ;; the current major mode for the buffer.
;;                "["

;;                '(:eval (propertize "%m" 'face 'font-lock-string-face
;;                                    'help-echo buffer-file-coding-system))
;;                "] "


;;                "[" ;; insert vs overwrite mode, input-method in a tooltip
;;                '(:eval (propertize (if overwrite-mode "Ovr" "Ins")
;;                                    'face 'font-lock-preprocessor-face
;;                                    'help-echo (concat "Buffer is in "
;;                                                       (if overwrite-mode "overwrite" "insert") " mode")))

;;                ;; was this buffer modified since the last save?
;;                '(:eval (when (buffer-modified-p)
;;                          (concat ","  (propertize "Mod"
;;                                                   'face 'font-lock-warning-face
;;                                                   'help-echo "Buffer has been modified"))))

;;                ;; is this buffer read-only?
;;                '(:eval (when buffer-read-only
;;                          (concat ","  (propertize "RO"
;;                                                   'face 'font-lock-type-face
;;                                                   'help-echo "Buffer is read-only"))))
;;                "] "

;;                ;; add the time, with the date and the emacs uptime in the tooltip
;;                '(:eval (propertize (format-time-string "%H:%M")
;;                                    'help-echo
;;                                    (concat (format-time-string "%c; ")
;;                                            (emacs-uptime "Uptime:%hh"))))
;;                " --"
;;                ;; i don't want to see minor-modes; but if you want, uncomment this:
;;                ;; minor-mode-alist  ;; list of minor modes
;;                "%-" ;; fill with '-'
;;                ))
