;; naysayer
(deftheme naysayer
  "custom naysayer theme")

(custom-theme-set-faces
 'naysayer
 '(default ((t (:foreground "#d3b58d" :background "#032b2a"))))
 '(custom-group-tag-face ((t (:underline t :foreground "lightblue"))) t)
 '(custom-variable-tag-face ((t (:underline t :foreground "lightblue"))) t)
 '(font-lock-builtin-face ((t nil)))
 '(font-lock-comment-face ((t (:foreground "#00ff00"))))
 '(font-lock-function-name-face ((((class color) (background dark)) (:foreground "white"))))
 '(font-lock-keyword-face ((t (:foreground "white" ))))
 '(font-lock-string-face ((t (:foreground "#0fdfaf"))))
 '(font-lock-variable-name-face ((((class color) (background dark)) (:foreground "#c8d4ec"))))  
 '(font-lock-warning-face ((t (:foreground "#504038"))))
 '(highlight ((t (:foreground "navyblue" :background "darkseagreen2"))))
 '(mode-line ((t (:inverse-video t))))
 '(region ((t (:background "blue"))))
 '(widget-field-face ((t (:foreground "white"))) t)
 '(widget-single-line-field-face ((t (:background "darkgray"))) t)
 '(fringe ((t (:background "#032b2a"))))
 '(line-number ((t (:background "#032b2a" :foreground "#d3b58d"))))
 '(cursor ((t (:background "lightgreen")))))

(provide-theme 'naysayer)

;; custom
(deftheme custom
  "Custom theme")

(custom-theme-set-faces
 'custom
 '(default ((t (:foreground "#d3b58d" :background "#1c1c1c"))))
 '(custom-group-tag-face ((t (:underline t :foreground "lightblue"))) t)
 '(custom-variable-tag-face ((t (:underline t :foreground "lightblue"))) t)
 '(font-lock-builtin-face ((t nil)))
 '(font-lock-comment-face ((t (:foreground "yellow"))))
 '(font-lock-function-name-face ((((class color) (background dark)) (:foreground "white"))))
 '(font-lock-keyword-face ((t (:foreground "white" ))))
 '(font-lock-string-face ((t (:foreground "#0fdfaf"))))
 '(font-lock-variable-name-face ((((class color) (background dark)) (:foreground "#c8d4ec"))))  
 '(font-lock-warning-face ((t (:foreground "#504038"))))
 '(highlight ((t (:foreground "navyblue" :background "darkseagreen2"))))
 '(mode-line ((t (:inverse-video t))))
 '(region ((t (:background "blue"))))
 '(cursor ((t (:background "lightgreen")))))

(provide-theme 'custom)

;; general
(menu-bar-mode 0)
(tool-bar-mode 0)
(setq inhibit-startup-screen t)
(setq ring-bell-function 'ignore)
(enable-theme 'custom)
(set-face-attribute 'default nil :height 140)

(setq backup-directory-alist `(("." . "~/.emacs-saves")))
(setq auto-save-file-name-transforms `((".*" "~/.emacs-saves/" t)))

;; keybind
(defun compile-raylib ()
  "Compile the Raylib C++ project."
  (interactive)
  (let ((compile-command "g++ -std=c++11 -o raylib_window main.cpp -I/opt/homebrew/Cellar/raylib/5.0/include -L/opt/homebrew/Cellar/raylib/5.0/lib -lraylib -framework CoreVideo -framework IOKit -framework Cocoa -framework OpenGL"))
    (compile compile-command)))
(global-set-key (kbd "<f5>") 'compile-raylib)
