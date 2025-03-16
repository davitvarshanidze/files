;; Navigation
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
  (interactive)
  (transpose-lines 1)
  (forward-line -2))

(defun move-line-down ()
  (interactive)
  (forward-line 1)
  (transpose-lines 1)
  (forward-line -1))

(global-set-key (kbd "M-<up>") 'move-line-up)
(global-set-key (kbd "M-<down>") 'move-line-down)

(setq backup-directory-alist `(("." . "~/.emacs-saves")))
(setq auto-save-file-name-transforms `((".*" "~/.emacs-saves/" t)))

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

;;;;

;; (global-display-line-numbers-mode 1)
;; (setq display-line-numbers-width 3)
;; (setq display-line-numbers-widen t)

;; (add-hook 'window-configuration-change-hook
;;           (lambda ()
;;             (setq display-line-numbers-width 3)))

;; (add-hook 'window-configuration-change-hook 'display-line-numbers-mode)

;;;;

;; (global-hl-line-mode t)
;; (set-face-attribute 'hl-line nil
;;                     :background "#073642")

;;;;

;;

;; (require 'whitespace)

;; (setq whitespace-style '(face spaces space-mark))
;; (setq whitespace-space-regexp "\\( +\\)") ; Match one or more spaces
;; (setq whitespace-display-mappings
;;       '((space-mark 32 [183] [46])))      ; 32 is the ASCII code for space, 183 is for '·', fallback is '.'

;; (set-face-attribute 'whitespace-space nil
;;                     :foreground "gray30"
;;                     :background nil)

;; (global-whitespace-mode 1)

;;;;

(setq dired-listing-switches "-alh")

;; $B%G%#%l%/%H%j$r:G=i$KI=<($9$k!#(B
(add-hook 'dired-load-hook
          '(lambda ()
             (load-library "ls-lisp")
             (setq ls-lisp-dirs-first t)))

;; emacs$B>e$G2hA|$rI=<($G$-$k$h$&$K$9$k!#(B
(auto-image-file-mode)

;; $BBP1~$9$k3g8L$r%O%$%i%$%H$9$k!#(B
(show-paren-mode 1)

;; $B%j!<%8%g%s$r%O%$%i%$%H$9$k!#(B
(transient-mark-mode 1)

;; $B2hLLJ,3d;~$K2hLL30J8;z$r@^$jJV$9!#(B
(setq truncate-partial-width-windows nil)

(setq frame-title-format `(" %b", " @ ",(system-name) " -- Emacs " ,emacs-version))

(setq inhibit-startup-message t)
;; (setq initial-scratch-message "Unfortunately, there's radio connected to my brain.")

(global-hl-line-mode t)
(set-face-attribute 'hl-line nil)

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
 ;; '(mouse-wheel-follow-mouse nil)
 ;; '(mouse-wheel-progressive-speed nil)
 ;; '(mouse-wheel-scroll-amount '(15))
  )

(custom-set-faces
 '(cursor ((t (:background "#A4C161"))))
 '(default ((t (:background "#1E2022" :foreground "#E5E0DB"))))
 '(font-lock-builtin-face ((t (:foreground "#9b859d"))))
 '(font-lock-comment-face ((t (:foreground "#BA9256"))))
 '(font-lock-constant-face ((t (:foreground "#d0d0ff"))))
 '(font-lock-doc-face ((t (:foreground "gray50"))))
 '(font-lock-function-name-face ((t (:foreground "#d0d0ff"))))
 '(font-lock-variable-name-face ((t (:foreground "#d0d0ff"))))
 '(font-lock-keyword-face ((t (:foreground "#c26230"))))
 '(font-lock-string-face ((t (:foreground "#A4C161"))))
 '(font-lock-type-face ((t (:foreground "#C26230"))))
 '(mode-line ((t (:background "#333333" :foreground "#E5E0DB" :box nil))))
 '(mode-line-inactive ((t (:background "#222222" :foreground "#888888" :box nil))))
 '(minibuffer-prompt ((t (:foreground "#c26230" :weight bold))))
 '(minibuffer ((t (:foreground "#E5E0DB"))))
 '(font-lock-number-face ((t (:foreground "#A4C161"))))
 '(hl-line ((t (:background "#333333")))))

;; handmade-hero theme
;; (custom-set-faces
;;  '(cursor ((t (:background "#40ff40"))))
;;  '(default ((t (:background "#161616" :foreground "burlywood3"))))
;;  '(font-lock-builtin-face ((t (:foreground "#dab99f"))))
;;  '(font-lock-comment-face ((t (:foreground "gray50"))))
;;  '(font-lock-constant-face ((t (:foreground "olive drab"))))
;;  '(font-lock-doc-face ((t (:foreground "gray50"))))
;;  '(font-lock-function-name-face ((t (:foreground "burlywood3"))))
;;  '(font-lock-keyword-face ((t (:foreground "DarkGoldenrod3"))))
;;  '(font-lock-string-face ((t (:foreground "olive drab"))))
;;  '(font-lock-type-face ((t (:foreground "burlywood3"))))
;;  '(font-lock-variable-name-face ((t (:foreground "burlywood3"))))
;;  '(handmade-important-face ((t (:foreground "Yellow":weight bold :underline t))))
;;  '(handmade-note-face ((t (:foreground "DarkGreen" :weight bold :underline t))))
;;  '(handmade-todo-face ((t (:foreground "Red" :weight bold :underline t))))
;;  '(hl-line ((t (:background "midnight blue")))))

;; jonathan blow theme-latest
;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(default ((t (:foreground "#d3b58d" :background "#041818"))))
;;  '(custom-group-tag-face ((t (:underline t foreground "lightblue"))) t)
;;  '(custom-variable-tag-face ((t (:underline t foreground "lightblue"))) t)
;;  '(font-lock-builtin-face ((t nil)))
;;  '(font-lock-comment-face ((t (:foreground "#3fdf1f"))))
;;  '(font-lock-function-name-face ((((class color) (background dark)) (:foreground "white"))))
;;  '(font-lock-keyword-face ((t (:foreground "white"))))
;;  '(font-lock-string-face ((t (:foreground "#0fdfaf"))))
;;  '(font-lock-variable-name-face ((((class color) (background dark)) (:foreground "#c8d4ec"))))
;;  '(font-lock-warning-face ((t (:bold t foreground "#504038"))))
;;  '(highlight ((t (:foreground "navyblue" :background "darkseagreen2"))))
;;  '(mode-line ((t (:inverse-video t))))
;;  '(region ((t (:background "blue"))))
;;  '(widget-field-face ((t (:foreground "white"))) t)
;;  '(widget-single-line-field-face ((t (:background "darkgray"))) t))

;; jonathan blow theme-older
;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(default ((t (:foreground "tan" :background "gray16"))))
;;  '(custom-group-tag-face ((t (:underline t foreground "lightblue"))) t)
;;  '(custom-variable-tag-face ((t (:underline t foreground "lightblue"))) t)
;;  '(font-lock-builtin-face ((t nil)))
;;  '(font-lock-comment-face ((t (:foreground "yellow"))))
;;  '(font-lock-function-name-face ((((class color) (background dark)) (:foreground "white"))))
;;  '(font-lock-keyword-face ((t (:foreground "white" background "gray16"))))
;;  '(font-lock-string-face ((t (:foreground "gray160" :background "gray16"))))
;;  '(font-lock-variable-name-face ((((class color) (background dark)) (:foreground "white"))))
;;  '(font-lock-warning-face ((t (:bold t foreground "red"))))
;;  '(highlight ((t (:foreground "navy blue" :background "darkseagreen2"))))
;;  '(mode-line ((t (:inverse-video t))))
;;  '(region ((t (:background "blue"))))
;;  '(widget-field-face ((t (:foreground "white" :background "darkgray"))) t)
;;  '(widget-single-line-field-face ((t (:background "darkgray"))) t))

;; (global-font-lock-mode 1)
;; (set-cursor-color "lightgreen")
;; (set-background-color "#072626")
(set-face-attribute 'default nil :height 160)
;; (set-face-attribute 'default nil :font "FiraMono Nerd Font Medium" :height 160)
;;(set-face-attribute 'default nil :font "Inconsolata Nerd Font Medium" :height 180)

;(set-face-foreground 'font-lock-builtin-face "lightgreen")

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

(defgroup auto-complete nil
  "Auto completion with popup menu"
  :group 'convenience
  :prefix "auto-complete-")

(defcustom ac-candidate-menu-width 25
  "Max width of candidate menu."
  :type 'number
  :group 'auto-complete)

(defcustom ac-candidate-menu-height 10
  "Max height of candidate menu."
  :type 'number
  :group 'auto-complete)

(defcustom ac-candidate-max 10
  "Max of number of candidates."
  :type 'number
  :group 'auto-complete)

(defcustom ac-modes
  '(emacs-lisp-mode lisp-interaction-mode
                    c-mode cc-mode c++-mode java-mode
                    perl-mode cperl-mode python-mode ruby-mode
                    ecmascript-mode javascript-mode php-mode css-mode
                    makefile-mode sh-mode fortran-mode f90-mode ada-mode
                    xml-mode sgml-mode)
  "Major modes `auto-complete-mode' can run on."
  :type '(list symbol)
  :group 'auto-complete)

(defcustom ac-auto-start t
  "Non-nil means completion will be started automatically.
Positive integer means if a length of a word you entered is larger than the value,
completion will be started automatically.
If you specify `nil', never be started automatically."
  :group 'auto-complete)

(defcustom ac-dwim t
  "Non-nil means `auto-complete' works based on Do What I Mean."
  :type 'boolean
  :group 'auto-complete)

(defface ac-selection-face
  '((t (:background "blue" :foreground "white")))
  "Face for the selected candidate."
  :group 'auto-complete)

(defface ac-menu-face
  '((t (:background "lightgray" :foreground "black")))
  "Face for candidate menu."
  :group 'auto-complete)

(defvar auto-complete-mode-hook nil
  "Hook for `auto-complete-mode'.")

(defvar ac-menu nil
  "Menu instance.")

(defvar ac-menu-direction 1
  "Positive integer means `ac-menu' grows forward.
Or, `ac-menu' grows backward.")

(defvar ac-menu-offset 0
  "Offset to contents.")

(defvar ac-completing nil
  "Non-nil means `auto-complete-mode' is now working on completion.")

(defvar ac-saved-window-start nil
  "Saved window start value for restore.")

(defvar ac-saved-window-hscroll nil
  "Saved window hscroll value for restore.")

(defvar ac-point nil
  "Start point of target.")

(defvar ac-target nil
  "Target string.")

(defvar ac-limit 0
  "Limit of number of candidates.")

(defvar ac-candidates nil
  "Current candidates.")

(defvar ac-selection nil
  "Current candidate index.")

(defvar ac-dwim-enable nil
  "Non-nil means DWIM completion will be allowed.")

(defvar ac-find-function 'ac-default-find
  "When `auto-complete-mode' finds it can start completion
or update candidates, it will call this function to find a
start point of the completion target.

If this function returns an integer, `auto-complete-mode'
will set the substring between the point and current point to `ac-target'.
And also it will start completion or update candidates by using
the `ac-target'.

If this function returns `nil', `auto-complete-mode'
ignore starting completion or stop completing.")

(defvar ac-init-function 'ac-sources-init
  "This function will be called when candidate menu is setupped.")

(defvar ac-candidate-function 'ac-sources-candidate
  "This function can return candidates as list by
using the `TARGET' that is given as a first argument.")

(defvar ac-complete-mode-map
  (let ((map (make-sparse-keymap)))
    (define-key map "\t" 'ac-expand)
    (define-key map "\r" 'ac-complete)
    
    (define-key map [down] 'ac-next)
    (define-key map [up] 'ac-previous)

    map)
  "Keymap for completion.")

(or (assq 'ac-completing minor-mode-map-alist)
    (push (cons 'ac-completing ac-complete-mode-map) minor-mode-map-alist))

(defvar ac-saved-local-map nil
  "Old keymap before `auto-complete' activated.")

;;;; Auto completion

(defun ac-setup (point)
  "Setup popup menu."
  (save-excursion
    (goto-char point)
    (let ((column (current-column))
          (line (line-number-at-pos)))
      (setq ac-saved-window-start (window-start))
      (setq ac-saved-window-hscroll (window-hscroll))
      (setq ac-menu-direction
            (if (and (> line ac-candidate-max)
                     (> ac-candidate-max
                        (-
                         (max 1 (- (window-height)
                                   (if mode-line-format 1 0)
                                   (if header-line-format 1 0)))
                         (1+ (count-lines (window-start) (point))))))
                -1
              1))
      (let ((window-width (window-width))
            (right (- (+ column ac-candidate-menu-width)
                      (window-hscroll))))
        (if (and (> right window-width)
                 (>= right ac-candidate-menu-width))
            (setq column (- column ac-candidate-menu-width))))
      (if (> ac-menu-direction 0)
          (progn
            (forward-line)
            (if (eq line (line-number-at-pos))
                (newline)
              (forward-line -1))
            (setq ac-menu (ac-menu-create (1+ line) column ac-candidate-menu-width ac-candidate-menu-height))
            (setq ac-point point))
        (setq ac-menu (ac-menu-create (- line ac-candidate-max) column ac-candidate-menu-width ac-candidate-menu-height))
        (setq ac-point point)))))

(defun ac-cleanup ()
  "Destroy popup menu."
  (ac-deactivate-mode-map)
  (when ac-menu
    (ac-menu-delete ac-menu)
    (set-window-start (selected-window) ac-saved-window-start)
    (set-window-hscroll (selected-window) ac-saved-window-hscroll))
  (setq ac-menu nil)
  (setq ac-completing nil)
  (setq ac-point nil)
  (setq ac-candidates nil)
  (setq ac-selection 0))

(defun ac-activate-mode-map ()
  "Activate `ac-complete-mode-map'."
  (setq ac-saved-local-map overriding-terminal-local-map)
  (if (eq ac-saved-local-map ac-complete-mode-map)
      ;; maybe never reach here
      (setq ac-saved-local-map nil))
  (setq overriding-terminal-local-map ac-complete-mode-map))

(defun ac-deactivate-mode-map ()
  "Deactivate `ac-complete-mode-map'."
  (when (eq overriding-terminal-local-map ac-complete-mode-map)
    (setq overriding-terminal-local-map ac-saved-local-map)
    (setq ac-saved-local-map nil)))

(defun ac-next ()
  "Select next candidate."
  (interactive)
  (if (interactive-p)
      (setq ac-dwim-enable t))
  (if ac-candidates
      (ac-select-candidate
       (let ((selection (1+ ac-selection)))
         (if (= selection (+ ac-menu-offset (min ac-candidate-menu-height (length ac-candidates))))
             ac-menu-offset
           selection)))))

(defun ac-previous ()
  "Select previous candidate."
  (interactive)
  (if (interactive-p)
      (setq ac-dwim-enable t))
  (if ac-candidates
      (ac-select-candidate
       (let ((selection (1- ac-selection)))
         (if (< selection ac-menu-offset)
             (1- (+ ac-menu-offset (min ac-candidate-menu-height (length ac-candidates))))
           selection)))))

(defun ac-expand-1 ()
  "Try expansion."
  (let ((string (overlay-get (ac-menu-line-overlay ac-menu ac-selection) 'real-string)))
    (delete-region ac-point (point))
    (insert string)
    (setq ac-target string)))

(defun ac-expand ()
  "Try expansion but select next if expanded twice."
  (interactive)
  (if (and ac-dwim ac-dwim-enable)
      (ac-complete)
    (let ((target ac-target)
          (string (ac-expand-1)))
      (when (equal target string)
        (ac-next)
        (ac-expand-1)))))

(defun ac-expand-common ()
  "Try expansion common part."
  (interactive)
  (let ((common (try-completion ac-target ac-candidates)))
    (when (stringp common)
      (delete-region ac-point (point))
      (insert common)
      (setq ac-target common))))

(defun ac-complete ()
  "Try completion."
  (interactive)
  (let* ((string (overlay-get (ac-menu-line-overlay ac-menu ac-selection) 'real-string))
         (source (get-text-property 0 'source string))
         (complete-function (and source (cdr-safe (assq 'action source)))))
    (ac-expand-1)
    (if complete-function
        (funcall complete-function))
    (ac-abort)))

(defun ac-abort ()
  "Abort completion."
  (ac-cleanup))

(defun ac-update-candidates (candidates)
  "Update candidates of popup menu."
  (setq ac-menu-offset (if (> ac-menu-direction 0)
                           0
                         (- ac-candidate-menu-height
                            (min ac-candidate-menu-height
                                 (length candidates)))))
  (setq ac-selection ac-menu-offset)
  (setq ac-candidates candidates)
  (setq ac-dwim-enable (= (length candidates) 1))
  (if candidates
      (progn
        (setq ac-completing t)
        (ac-activate-mode-map))
    (setq ac-completing nil)
    (ac-deactivate-mode-map))
  (let ((i ac-menu-offset))
    ;; show line and set string to the line
    (mapcar
     (lambda (candidate)
       (when (< i ac-candidate-menu-height)
         (ac-menu-show-line ac-menu i)
         (ac-menu-set-line-string ac-menu i candidate (if (= i ac-selection) 'ac-selection-face))
         (setq i (1+ i))))
     candidates)
    ;; ensure lines visible
    (if (and (> ac-menu-direction 0)
             (> i (-
                   (max 1 (- (window-height)
                             (if mode-line-format 1 0)
                             (if header-line-format 1 0)))
                   (1+ (count-lines (window-start) (point))))))
        (recenter (- (1+ i))))
    (if (> i ac-menu-offset)
        (let ((window-width (window-width))
              (right (- (+ (ac-menu-column ac-menu) ac-candidate-menu-width)
                        (window-hscroll))))
          (if (> right window-width)
              (scroll-left (- right window-width)))))
    ;; hide remaining lines
    (if (> ac-menu-direction 0)
        (while (< i ac-candidate-menu-height)
          (ac-menu-hide-line ac-menu i)
          (setq i (1+ i)))
      (dotimes (i ac-menu-offset)
        (ac-menu-hide-line ac-menu i)))))

(defun ac-select-candidate (selection)
  "Select candidate pointed by `SELECTION'."
  (when ac-candidates
    (ac-menu-set-line-string ac-menu ac-selection (nth (- ac-selection ac-menu-offset) ac-candidates))
    (ac-menu-set-line-string ac-menu selection (nth (- selection ac-menu-offset) ac-candidates) 'ac-selection-face)
    (setq ac-selection selection)))

(defun ac-default-find ()
  "Default implemention for `ac-find-function'."
  (require 'thingatpt)
  (car-safe (bounds-of-thing-at-point 'symbol)))

(defun ac-start ()
  "Start completion."
  (interactive)
  (let ((point (funcall ac-find-function)))
    (if (or (null point)
            (and ac-menu
                 (/= point ac-point)))
        (ac-abort)
      (when (null ac-menu)
        (ac-setup point)
        (funcall ac-init-function))
      (setq ac-target (buffer-substring-no-properties point (point)))
      (setq ac-limit ac-candidate-max)
      (ac-update-candidates
       (if (or ac-completing
               (not (integerp ac-auto-start))
               (>= (length ac-target) ac-auto-start))
           (funcall ac-candidate-function))))))

(defun ac-trigger-command-p ()
  "Return non-nil if `this-command' is a trigger command."
  (or (eq this-command 'self-insert-command)
      (and ac-completing
           (memq this-command
                 '(delete-backward-char
                   backward-delete-char
                   backward-delete-char-untabify)))))

(defun ac-on-pre-command ()
  (if (and (not (ac-trigger-command-p))
           (or (not (symbolp this-command))
               (not (string-match "^ac-" (symbol-name this-command)))))
      (ac-abort)))

(defun ac-on-post-command ()
  (if (and ac-auto-start
           (not isearch-mode)
           (ac-trigger-command-p))
      (ac-start)))

(defun auto-complete-mode-maybe ()
  "What buffer `auto-complete-mode' prefers."
  (if (and (not (minibufferp (current-buffer)))
           (memq major-mode ac-modes))
      (auto-complete-mode 1)))

(require 'easy-mmode)

(define-minor-mode auto-complete-mode
  "AutoComplete mode"
  :lighter " AC"
  :group 'auto-complete
  (if auto-complete-mode
      (progn
        (add-hook 'post-command-hook 'ac-on-post-command nil t)
        (add-hook 'pre-command-hook 'ac-on-pre-command nil t)
        (run-hooks 'auto-complete-mode-hook))
    (remove-hook 'post-command-hook 'ac-on-post-command t)
    (remove-hook 'pre-command-hook 'ac-on-pre-command t)
    (ac-abort)))

(if (fboundp 'define-global-minor-mode)
    (define-global-minor-mode global-auto-complete-mode
      auto-complete-mode auto-complete-mode-maybe
      :group 'auto-complete))

;;;; Sources implementation

(defvar ac-sources '(ac-source-words-in-buffer)
  "Sources.")

(defun ac-sources-init ()
  "Implementation for `ac-init-function' by sources."
  (dolist (source ac-sources)
    (if (symbolp source)
        (setq source (symbol-value source)))
    (let ((init-function (cdr-safe (assq 'init source))))
      (if init-function
          (funcall init-function)))))

(defun ac-sources-candidate ()
  "Implementation for `ac-cadidates-function' by sources."
  (when (> (length ac-target) 0)
    (let (candidates)
      (dolist (source ac-sources)
        (if (symbolp source)
            (setq source (symbol-value source)))
        (let* ((ac-limit (or (cdr-safe (assq 'limit source)) ac-limit))
               (requires (cdr-safe (assq 'requires source)))
               cand)
          (if (or (null requires)
                  (>= (length ac-target) requires))
              (setq cand
                    (delq nil
                          (mapcar (lambda (candidate)
                                    (propertize candidate 'source source))
                                  (funcall (cdr (assq 'candidates source)))))))
          (if (and (> ac-limit 1)
                   (> (length cand) ac-limit))
              (setcdr (nthcdr (1- ac-limit) cand) nil))
          (setq candidates (append candidates cand))))
      (delete-dups candidates))))

(defun ac-candidate-words-in-buffer ()
  "Default implemention for `ac-candidate-function'."
  (if (> (length ac-target) 0)
      (let ((i 0)
            candidate
            candidates
            (regexp (concat "\\b" (regexp-quote ac-target) "\\(\\s_\\|\\sw\\)*\\b")))
        (save-excursion
          ;; search backward
          (goto-char ac-point)
          (while (and (< i ac-limit)
                      (re-search-backward regexp nil t))
            (setq candidate (match-string-no-properties 0))
            (unless (member candidate candidates)
              (push candidate candidates)
              (setq i (1+ i))))
          ;; search backward
          (goto-char (+ ac-point (length ac-target)))
          (while (and (< i ac-limit)
                      (re-search-forward regexp nil t))
            (setq candidate (match-string-no-properties 0))
            (unless (member candidate candidates)
              (push candidate candidates)
              (setq i (1+ i))))
          (nreverse candidates)))))

(defvar ac-source-words-in-buffer
  '((candidates . ac-candidate-words-in-buffer))
  "Simple source like dabbrev.")

(defvar ac-source-symbols
  '((candidates
     . (lambda ()
         (all-completions ac-target obarray))))
  "Source for Emacs lisp symbols.")

(defvar ac-source-abbrev
  `((candidates
     . (lambda ()
         (all-completions ac-target local-abbrev-table)))
    (action
     . expand-abbrev))
  "Source for abbrev.")

(defvar ac-source-files-in-current-dir
  '((candidates
     . (lambda () (all-completions ac-target (directory-files default-directory)))))
  "Source for listing files in current directory.")

(defvar ac-imenu-index nil
  "Imenu index.")

(defun ac-imenu-candidate ()
  (require 'imenu)
  (let ((i 0)
        (stack ac-imenu-index)
        candidates
        node)
    (while (and stack
                (< i ac-limit))
      (setq node (pop stack))
      (when (consp node)
        (let ((car (car node))
              (cdr (cdr node)))
          (if (consp cdr)
              (mapcar (lambda (child)
                        (push child stack))
                      cdr)
            (when (and (stringp car)
                       (string-match (concat "^" (regexp-quote ac-target)) car))
              (push car candidates)
              (setq i (1+ i)))))))
    (nreverse candidates)))

(defvar ac-source-imenu
  '((init
     . (lambda ()
         (require 'imenu)
         (setq ac-imenu-index
               (condition-case nil
                   (imenu--make-index-alist)
                 (error nil)))))
    (candidates . ac-imenu-candidate))
  "Source for imenu.")

(defun ac-yasnippet-candidate-1 (table)
  (let ((hashtab (yas/snippet-table-hash table))
        (parent (yas/snippet-table-parent table))
        candidates)
    (maphash (lambda (key value)
               (push key candidates))
             hashtab)
    (setq candidates (all-completions ac-target (nreverse candidates)))
    (if parent
        (setq candidates
              (append candidates (ac-yasnippet-candidate-1 parent))))
    candidates))

(defun ac-yasnippet-candidate ()
  (require 'yasnippet)
  (let ((table (yas/snippet-table major-mode)))
    (if table
        (ac-yasnippet-candidate-1 table))))

(defvar ac-source-yasnippet
  '((candidates . ac-yasnippet-candidate)
    (action . yas/expand)
    (limit . 3))
  "Source for Yasnippet.")

;;;; Popup menu

(defun ac-menu-line (menu)
  "Line number of `MENU'."
  (nth 0 menu))

(defun ac-menu-column (menu)
  "Column of `MENU'."
  (nth 1 menu))

(defun ac-menu-width (menu)
  "Popup menu width of `MENU'."
  (nth 2 menu))

(defun ac-menu-height (menu)
  "Popup menu height of `MENU'."
  (nth 3 menu))

(defun ac-menu-overlays (menu)
  "Overlays that `MENU' contains."
  (nth 4 menu))

(defun ac-menu-line-overlay (menu line)
  "Return a overlay of `MENU' at `LINE'."
  (aref (ac-menu-overlays menu) line))

(defun ac-menu-hide-line (menu line)
  "Hide `LINE' in `MENU'."
  (let ((overlay (ac-menu-line-overlay menu line)))
    (overlay-put overlay 'invisible nil)
    (overlay-put overlay 'after-string nil)))

(defun ac-menu-show-line (menu line)
  "Show `LINE' in `MENU'."
  (let ((overlay (ac-menu-line-overlay menu line)))
    (overlay-put overlay 'invisible t)))

(defun ac-menu-set-line-string (menu line string &optional face)
  "Set contents of `LINE' in `MENU'."
  (let ((overlay (ac-menu-line-overlay menu line)))
    (overlay-put overlay 'real-string string)
    (funcall (overlay-get overlay 'set-string-function) overlay string face)))

(defun ac-menu-create-line-string (menu string)
  "Adjust `STRING' into `MENU'."
  (let ((length 0)
        (width 0)
        (menu-width (ac-menu-width menu))
        (chars (append string nil)))
    (while (and
            chars
            (<= (setq width (+ width (char-width (car chars)))) menu-width))
      (setq length (1+ length))
      (setq chars (cdr chars)))
    (if (< length (length string))
        (setq string (substring string 0 length)))
    (let ((string-width (string-width string)))
      (if (< string-width menu-width)
          (setq string (concat string
                               (make-string (- menu-width string-width) ? )))))
    string))

(defun ac-menu-hide (menu)
  "Hide `MENU'."
  (dotimes (i (ac-menu-height menu))
    (ac-menu-hide-line menu i)))

(defun ac-menu-last-line-of-buffer ()
  (save-excursion
    (not (eq (forward-line) 0))))

(defun ac-menu-create (line column width height)
  "Create popup menu."
  (save-excursion
    (let ((overlays (make-vector height nil))
          (window (selected-window)))
      (goto-line line)
      (dotimes (i height)
        (move-to-column column)
        (let (overlay begin w current-column (prefix "") (postfix ""))
          (setq current-column (current-column))
          (cond
           ((> current-column column)
            (backward-char)
            (setq current-column (current-column))
            (if (< current-column column)
                (setq prefix (make-string (- column current-column) ? ))))
           ((< current-column column)
            (setq prefix (make-string (- column current-column) ? ))))

          (setq begin (point))
          (setq w (+ width (length prefix)))
          (while (and (not (eolp))
                      (> w 0))
            (setq w (- w (char-width (char-after))))
            (forward-char))
          (if (< w 0)
              (setq postfix (make-string (- w) ? )))
          (if (ac-menu-last-line-of-buffer)
              (setq postfix (concat postfix "\n")))

          (setq overlay (make-overlay begin (point)))
          (overlay-put overlay 'window window)
          (overlay-put overlay 'prefix prefix)
          (overlay-put overlay 'postfix postfix)
          (overlay-put overlay 'width width)
          (overlay-put overlay 'set-string-function
                       (lambda (overlay string &optional face)
                         (overlay-put overlay
                                      'after-string
                                      (concat (overlay-get overlay 'prefix)
                                              (propertize (ac-menu-create-line-string menu string) 'face (or face 'ac-menu-face))
                                              (overlay-get overlay 'postfix)))))
          (aset overlays i overlay))
        (forward-line))
      (let ((i 100))
        (mapcar (lambda (overlay)
                  (overlay-put overlay 'priority i)
                  (setq i (1+ i)))
                (nreverse (append overlays nil))))
      (list line column width height overlays))))

(defun ac-menu-delete (menu)
  "Delete `MENU'."
  (mapcar 'delete-overlay (ac-menu-overlays menu)))

(provide 'auto-complete)

;; OS
(defvar run-unix
  (or (equal system-type 'gnu/linux)
      (equal system-type 'usg-unix-v)))

(defvar run-w32
  (and (null run-unix)
       (or (equal system-type 'windows-nt)
           (equal system-type 'ms-dos))))

;; (defvar run-darwin
;;   (equal system-type 'darwin))

;; Emacs version
(defvar run-emacs20
  (and (equal emacs-major-version 20)
       (null (featurep 'xemacs))))

(defvar run-emacs21
  (and (equal emacs-major-version 21)
       (null (featurep 'xemacs))))

(defvar run-emacs22
  (and (equal emacs-major-version 22)
       (null (featurep 'xemacs))))

(defvar run-emacs23
  (and (equal emacs-major-version 23)
       (null (featurep 'xemacs))))

(defvar run-emacs24
  (and (equal emacs-major-version 24)
       (null (featurep 'xemacs))))

(defvar run-emacs25
  (and (equal emacs-major-version 25)
       (null (featurep 'xemacs))))

(defvar run-meadow (featurep 'meadow))

(defvar run-meadow1 (and run-meadow run-emacs20))

(defvar run-meadow2 (and run-meadow run-emacs21))

(defvar run-meadow2 (and run-meadow run-emacs22))

(defvar run-xemacs (featurep 'xemacs))

(defvar run-xemacs-no-mule
  (and run-xemacs (not (featurep 'mule))))

(global-font-lock-mode t)
(setq font-lock-maximum-decoration t)

(setq scroll-conservatively 1)

(setq next-line-add-newlines nil)

(setq visible-bell t)

(fset 'yes-or-no-p 'y-or-n-p)

(cd "~")

;; @date
(defvar my-save-buffer-hook nil)
(defun save-buffer-wrapper ()
  (interactive)
  (let ((tostr (concat "@date   " (format-time-string "%Y/%m/%d %k:%M:%S") "\n")))
    (save-excursion
        (goto-char (point-min))
        (while (re-search-forward
                "\\@date\\([0-9/: ]*\\)?\n" nil t)
          (replace-match tostr nil t)))
    (run-hooks 'my-save-buffer-hook)
    (save-buffer)))
(global-set-key "\C-x\C-s" 'save-buffer-wrapper)

;; (*~)
(setq auto-save-list-file-prefix "~/.emacs_autosave/")

;; (#filename#)
(setq auto-save-default nil)
(setq auto-save-list-file-name nil)
(setq auto-save-list-file-prefix nil)

;; (filename~)
(setq make-backup-files nil)
