;; Navigation keys
(global-set-key [f12] 'eval-buffer)
(global-set-key [f1] 'recompile)
(global-set-key [f5] 'use-run)
(global-set-key [f6] 'next-error)
(global-set-key [f7] 'use-compile)
(global-set-key [?\C-r] 'replace-string)
(global-set-key [?\M-r] 'query-replace)
(global-set-key [?\C-z] 'undo)
(global-set-key [?\C-0] 'delete-window)
(global-set-key [?\C-1] 'delete-other-windows)
(global-set-key [?\C-2] 'split-window-vertically)
(global-set-key [?\C-3] 'split-window-horizontally)
(global-set-key [?\C-,] 'beginning-of-buffer)
(global-set-key [?\C-.] 'end-of-buffer)
(global-set-key (kbd "C-o") 'other-window)
(global-set-key (kbd "C-<left>") 'previous-buffer)
(global-set-key (kbd "C-<right>") 'next-buffer)
(global-set-key (kbd "s-x") 'kill-whole-line)
(global-set-key (kbd "C-x C-b") 'switch-to-buffer)
(global-set-key (kbd "C-h") 'scroll-down-command)
(global-set-key (kbd "C-g") 'scroll-up-command)
(global-set-key (kbd "C-w") 'scroll-down-line)
(global-set-key (kbd "C-v") 'scroll-up-line)
(global-set-key [?\C-u] 'upcase-word)
(define-key global-map [C-backspace] 'kill-word)
(global-set-key [C-return] 'save-buffer)
(global-set-key (kbd "s-<up>") 'beginning-of-buffer)
(global-set-key (kbd "s-<down>") 'end-of-buffer)
(global-set-key (kbd "C-t") 'goto-line)
(global-set-key (kbd "M-o") 'occur)
(global-unset-key (kbd "M-x"))
(global-set-key (kbd "C-x C-x") 'execute-extended-command)
(global-unset-key (kbd "C-k"))
(global-set-key (kbd "C-q") 'kill-line)

(defun move-line-up ()
  "Move the current line up by one line."
  (interactive)
  (transpose-lines 1)
  (forward-line -2))

(defun move-line-down ()
  "Move the current line down by one line."
  (interactive)
  (forward-line 1)
  (transpose-lines 1)
  (forward-line -1))

(global-set-key (kbd "M-<up>") 'move-line-up)
(global-set-key (kbd "M-<down>") 'move-line-down)

;; UI/UX
(setq inhibit-startup-message t)
(menu-bar-mode -1)
(tool-bar-mode -1)
;; (scroll-bar-mode -1)
(setq debug-on-error t)
(setq truncate-partial-width-windows nil)
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq ring-bell-function 'ignore)
(setq dabbrev-case-replace nil)
(setq dabbrev-case-fold-search t)
(setq dabbrev-upcase-means-case-search t)
(setq visible-bell t)
(setq undo-limit 800000)
(setq undo-strong-limit 1200000)
(setq undo-outer-limit 2000000)

;;

(global-display-line-numbers-mode 1)
(setq display-line-numbers-width 3)
(setq display-line-numbers-widen t)

(add-hook 'window-configuration-change-hook
          (lambda ()
            (setq display-line-numbers-width 3)))

(add-hook 'window-configuration-change-hook 'display-line-numbers-mode)

;;

(global-hl-line-mode t)
(set-face-attribute 'hl-line nil
                    :background "gray20")

;;

(require 'whitespace)

(setq whitespace-style '(face spaces space-mark))
(setq whitespace-space-regexp "\\( +\\)") ; Match one or more spaces
(setq whitespace-display-mappings
      '((space-mark 32 [183] [46])))      ; 32 is the ASCII code for space, 183 is for '·', fallback is '.'

(set-face-attribute 'whitespace-space nil
                    :foreground "gray30"
                    :background nil)

(global-whitespace-mode 1)


;; Perfomance | M1 Macbook
(setq gc-cons-threshold (* 50 1000 1000))    ;; Increase GC threshold to reduce pauses
(setq gc-cons-percentage 0.1)                ;; Reduce the frequency of GC
(setq native-comp-eln-load-path '("~/.emacs.d/eln-cache/" "."))
(setq comp-speed 3)                          ;; Set to a medium speed for native compilation
(setq read-process-output-max (* 1024 1024)) ;; 1MB
(setq auto-window-vscroll nil)               ;; Disable unnecessary window scrolling for better performance
(setq global-auto-revert-mode nil)           ;; Turn off auto-revert globally
(setq shell-command-switch "-c")             ;; Use async shell commands
(setq recentf-max-saved-items 100)           ;; Limit the number of recent files tracked
(setq redisplay-dont-pause t)                ;; Prevent Emacs from pausing during redisplay

;; Theme & Font
(custom-set-faces
 '(default ((t (:foreground "tan" :background "gray16"))))
 '(custom-group-tag-face ((t (:underline t :foreground "lightblue"))) t)
 '(custom-variable-tag-face ((t (:underline t :foreground "lightblue"))) t)
 '(font-lock-builtin-face ((t nil)))
 '(font-lock-comment-face ((t (:foreground "yellow"))))
 '(font-lock-function-name-face ((((class color) (background dark)) (:foreground "white"))))
 '(font-lock-keyword-face ((t (:foreground "white" :background "gray16"))))
 '(font-lock-string-face ((t (:foreground "gray160" :background "gray16"))))
 '(font-lock-variable-name-face ((((class color) (background dark)) (:foreground "white"))))
 '(font-lock-warning-face ((t (:bold t : foreground "red"))) )
 '(highlight ((t (: foreground "navyblue" : background "darkseagreen2"))))
 '(mode-line ((t (:inverse-video t))))
 '(region ((t (:background "blue"))))
 '(widget-field-face ((t (:foreground "white" :background "darkgray"))) t)
 '(widget-single-line-field-face ((t (:background "darkgray"))) t))

(global-font-lock-mode 1)
(set-cursor-color "lightgreen")
(set-background-color "gray16")
(set-face-foreground 'font-lock-builtin-face "lightgreen")
(set-face-attribute 'default nil :font "FiraMono Nerd Font Medium" :height 180)
