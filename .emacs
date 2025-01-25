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

;; Backups
(setq backup-directory-alist `(("." . "~/.emacs-saves")))
(setq auto-save-file-name-transforms `((".*" "~/.emacs-saves/" t)))

;; UI
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

(setq inhibit-startup-message t)
(setq initial-scratch-message "Unfortunately, there's radio connected to my brain.")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-save-default nil)
 '(auto-save-interval 0)
 '(auto-save-list-file-prefix nil)
 '(auto-save-timeout 0)
 '(auto-show-mode t t)
 '(delete-auto-save-files nil)
 '(delete-old-versions 'other)
 '(imenu-auto-rescan t)
 '(imenu-auto-rescan-maxout 500000)
 '(kept-new-versions 5)
 '(kept-old-versions 5)
 '(make-backup-file-name-function 'ignore)
 '(make-backup-files nil)
 '(mouse-wheel-follow-mouse nil)
 '(mouse-wheel-progressive-speed nil)
 '(mouse-wheel-scroll-amount '(15)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:foreground "#d3b58d" :background "#041818"))))
 '(custom-group-tag-face ((t (:underline t foreground "lightblue"))) t)
 '(custom-variable-tag-face ((t (:underline t foreground "lightblue"))) t)
 '(font-lock-builtin-face ((t nil)))
 '(font-lock-comment-face ((t (:foreground "#3fdf1f"))))
 '(font-lock-function-name-face ((((class color) (background dark)) (:foreground "white"))))
 '(font-lock-keyword-face ((t (:foreground "white"))))
 '(font-lock-string-face ((t (:foreground "#0fdfaf"))))
 '(font-lock-variable-name-face ((((class color) (background dark)) (:foreground "#c8d4ec"))))
 '(font-lock-warning-face ((t (:bold t foreground "#504038"))))
 '(highlight ((t (:foreground "navyblue" :background "darkseagreen2"))))
 '(mode-line ((t (:inverse-video t))))
 '(region ((t (:background "blue"))))
 '(widget-field-face ((t (:foreground "white"))) t)
 '(widget-single-line-field-face ((t (:background "darkgray"))) t))

(global-font-lock-mode 1)
(set-cursor-color "lightgreen")
(set-background-color "#072626")
(set-face-attribute 'default nil :font "FiraMono Nerd Font Medium" :height 160)

(set-face-foreground 'font-lock-builtin-face "lightgreen")

;(set-face-font 'modeline "Lucida Console: Regular:14")
;(set-face-font 'modeline "7x14")
;(set-default-font "7x14")
;(set-default-font "-monotype-courier new-medium-r-normal--0-0-0-0-m-0-ascii-0")
;(set-default-font "-b&h-lucida console-medium-r-semi condensed--0-0-0-0-m-0-ascii-0")
;(set-default-font "-*-Fixedsys-r-*-*-*-*-*-*-*-*-*-ansi-")
;(set-face-attribute 'default nil font "Anonymous Pro-14")


;(Setq c-font-lock-keywords c-font-lock-keywords-2
;      c++-font-lock-keywords c++-font-lock-keywords-2
;      lisp-font-lock-keywords lisp-font-lock-keywords-2)

;; Bright-red TODOs
 (setq fixme-modes '(c++-mode c-mode emacs-lisp-mode))
 (make-face 'font-lock-fixme-face)
 (make-face 'font-lock-note-face)
 (mapc (lambda (mode)
	 (font-lock-add-keywords
	  mode
	  '(("\\<\\(TODO\\)" 1 'font-lock-fixme-face t)
            ("\\<\\(NOTE\\)" 1 'font-lock-note-face t))))
	fixme-modes)
 (modify-face 'font-lock-fixme-face "Red" nil nil t nil t nil nil)
(modify-face 'font-lock-note-face "Dark Green" nil nil t nil t nil nil)

;; Accepted file extensions and their appropriate modes
(setq auto-mode-alist
      (append
       '(("\\.cpp$"    . c++-mode)
         ("\\.hin$"    . c++-mode)
         ("\\.cin$"    . c++-mode)
         ("\\.inl$"    . c++-mode)
         ("\\.rdc$"    . c++-mode)
         ("\\.h$"    . c++-mode)
         ("\\.c$"   . c++-mode)
         ("\\.cc$"   . c++-mode)
         ("\\.c8$"   . c++-mode)
         ("\\.txt$" . indented-text-mode)
         ("\\.emacs$" . emacs-lisp-mode)
         ("\\.gen$" . gen-mode)
         ("\\.ms$" . fundamental-mode)
         ("\\.m$" . objc-mode)
         ("\\.mm$" . objc-mode)
         ) auto-mode-alist))

;; C++ indentation style
(defconst c-style
  '((c-electric-pound-behavior   . nil)
    (c-tab-always-indent         . t)
    (c-comment-only-line-offset  . 0)
    (c-hanging-braces-alist      . ((class-open)
                                    (class-close)
                                    (defun-open)
                                    (defun-close)
                                    (inline-open)
                                    (inline-close)
                                    (brace-list-open)
                                    (brace-list-close)
                                    (brace-list-intro)
                                    (brace-list-entry)
                                    (block-open)
                                    (block-close)
                                    (substatement-open)
                                    (statement-case-open)
                                    (class-open)))
    (c-hanging-colons-alist      . ((inher-intro)
                                    (case-label)
                                    (label)
                                    (access-label)
                                    (access-key)
                                    (member-init-intro)))
    (c-cleanup-list              . (scope-operator
                                    list-close-comma
                                    defun-close-semi))
    (c-offsets-alist             . ((arglist-close         .  c-lineup-arglist)
                                    (label                 . -4)
                                    (access-label          . -4)
                                    (substatement-open     .  0)
                                    (statement-case-intro  .  4)
                                    (statement-block-intro .  c-lineup-for)
                                    (case-label            .  4)
                                    (block-open            .  0)
                                    (inline-open           .  0)
                                    (topmost-intro-cont    .  0)
                                    (knr-argdecl-intro     . -4)
                                    (brace-list-open       .  0)
                                    (brace-list-intro      .  4)))
    (c-echo-syntactic-information-p . t))
    "C++ Style")

;; C++ mode handling
(defun c-hook ()
  (c-add-style c-style t)
  (setq tab-width 4
	indent-tabs-mode nil)
  (c-set-offset 'member-init-intro '++)
  (c-toggle-auto-hungry-state -1)
  (define-key c++-mode-map "\C-m" 'newline-and-indent)
  (setq c-hanging-semi&comma-criteria '((lambda () 'stop)))
  (setq dabbrev-case-replace t)
  (setq dabbrev-case-fold-search t)
  (setq dabbrev-upcase-means-case-search t)
  (abbrev-mode 1))

;; Text mode handling
(defun text-hook ()
  (setq tab-width 4
        indent-tabs-mode nil)
  (define-key text-mode-map "\C-m" 'newline-and-indent)
  (define-key text-mode-map "\es" 'save-buffer)
  )
(add-hook 'text-mode-hook 'text-hook)

;; Smooth scroll
(setq scroll-step 3)

;; When dired-dwim-target is t, dired uses the other buffer as the default target for copy/move
(setq dired-dwim-target t)

;; Go to line with feedback. Displays line numbers before entering a line number to go to
(defun goto-line-with-feedback ()
  "Show line numbers temporarily, while prompting for the line number input"
  (interactive)
  (unwind-protect
      (progn
        (linum-mode 1)
        (goto-line (read-number "Goto line: ")))
    (linum-mode -1)))

;; Don't use expand-region fast keys
(setq expand-region-fast-keys-enabled nil)

;; Show expand-region command used
(setq er--show-expansion-message t)

;; Emacs server
(require 'server)
(unless (server-running-p)
  (server-start))

;; Perfomance
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)

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

;; Misc
(dolist (cmd '(narrow-to-region
               upcase-region
               downcase-region
               dired-find-alternate-file
               LaTeX-narrow-to-environment
               TeX-narrow-to-group
               narrow-to-page
               set-goal-column
               scroll-left
               scroll-right))
  (put cmd 'disabled nil))
(put 'suspend-frame 'disabled t)

;; Post load stuff
(defun post-load-stuff ()
  (interactive)
  (menu-bar-mode -1)
  (maximize-frame)
)
(add-hook 'post-load-stuff t)
