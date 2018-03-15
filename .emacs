;;; TODO: Clean this up

;;; ELPA repos
;;; (require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
			 ("marmalade" . "http://marmalade-repo.org/packages/")
			 ("melpa" . "http://melpa.milkbox.net/packages/")))
(add-to-list 'package-archives
	     '("melpa-stable" . "http://stable.melpa.org/packages/") t)

(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
    (setq exec-path (append exec-path '("/usr/local/bin")))

;;; smooth scrolling
(setq scroll-step 1)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ; one line at a time
(setq mouse-wheel-progressive-speed 1) ; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't)

;;; set backup file location
;;;(setq backup-directory-alist '(("." . "~/.emacs_backups")))
;;; Actually, let's not.
(setq make-backup-files nil)

;;; line #s
;;; (global-linum-mode t)

;;; theme when using vanilla emacs
;;; download https://raw.githubusercontent.com/emacs-jp/replace-colorthemes/master/clarity-theme.el to ~/.emacs.d/config/
;;;(add-to-list 'custom-theme-load-path "~/.emacs.d/config")
;;;(load-theme 'clarity-theme t)

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'dracula t)

(add-to-list 'load-path "~/.emacs.d/config")

(require 'neotree)
(global-set-key [f8] 'neotree-toggle)

;; theme
;; (when (featurep 'aquamacs)
;;   (color-theme-initialize)
;;   (color-theme-clarity)
;;   (aquamacs-autoface-mode 0)
;;   (tool-bar-mode 0)
;;; Enable Elpy
;; (package-initialize)
;;(elpy-enable)

(setq ispell-program-name "/usr/local/bin/aspell")

;;; Powerline theme
;;; cd ~/.emacs.d/vendor
;;; git clone git://github.com/jonathanchu/emacs-powerline.git
(add-to-list 'load-path "~/.emacs.d/vendor/emacs-powerline")
(require 'powerline)
(setq powerline-arrow-shape 'arrow)
;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(mode-line ((t (:foreground "#030303" :background "#00ff00" :box nil))))
;;  '(mode-line-inactive ((t (:foreground "#006600" :background "#666666" :box nil)))))
;; (setq powerline-color1 "green22")
;; (setq powerline-color2 "green40")

;; (set-face-attribute 'mode-line nil
;;		    :foreground "Black"
;;		    :background "Green"
;;		    :box nil)

(add-hook 'before-save-hook 'whitespace-cleanup)

;;; I like jedi. Use that instead of rope.
(setq elpy-rpc-backend "jedi")

;;;Meta-arrows to move around code?!?!? GET OUT.
(eval-after-load "elpy"
  '(cl-dolist (key '("M-<up>" "M-<down>" "M-<left>" "M-<right>"))
	  (define-key elpy-mode-map (kbd key) nil)))

;; ;;; SLIME
;; (add-to-list 'load-path "/opt/local/share/emacs/site-lisp/slime")
;; (require 'slime-autoloads)
;; (setq slime-lisp-implementations
;;      `((sbcl ("/opt/local/bin/sbcl"))
;;        (abcl ("/opt/local/bin/abcl"))
;;        (clisp ("/opt/local/bin/clisp"))))
;; (slime-setup  '(slime-repl slime-asdf slime-fancy slime-banner))

;; Keybinding to add breakpoint:
(defun python-add-breakpoint ()
  (interactive)
  (insert "import ipdb; ipdb.set_trace()"))

(global-set-key (kbd "C-h C-k") 'python-add-breakpoint)
(global-set-key (kbd "C-x C-;") 'comment-region)
(global-set-key (kbd "C-x C-:") 'uncomment-region)

(require 'web-beautify) ;; Not necessary if using ELPA package
(eval-after-load 'js2-mode
  '(define-key js2-mode-map (kbd "C-c b") 'web-beautify-js))
;; Or if you're using 'js-mode' (a.k.a 'javascript-mode')
(eval-after-load 'js
  '(define-key js-mode-map (kbd "C-c b") 'web-beautify-js))

(eval-after-load 'json-mode
  '(define-key json-mode-map (kbd "C-c b") 'web-beautify-js))

(eval-after-load 'sgml-mode
  '(define-key html-mode-map (kbd "C-c b") 'web-beautify-html))

(eval-after-load 'web-mode
  '(define-key web-mode-map (kbd "C-c b") 'web-beautify-html))

(eval-after-load 'css-mode
  '(define-key css-mode-map (kbd "C-c b") 'web-beautify-css))

;; ;; Or if you're using 'js-mode' (a.k.a 'javascript-mode')
;; (eval-after-load 'js
;;   '(add-hook 'js-mode-hook
;;	     (lambda ()
;;	       (add-hook 'before-save-hook 'web-beautify-js-buffer t t))))

;; (eval-after-load 'json-mode
;;   '(add-hook 'json-mode-hook
;;	     (lambda ()
;;	       (add-hook 'before-save-hook 'web-beautify-js-buffer t t))))

;; (eval-after-load 'sgml-mode
;;   '(add-hook 'html-mode-hook
;;	     (lambda ()
;;	       (add-hook 'before-save-hook 'web-beautify-html-buffer t t))))

;; (eval-after-load 'web-mode
;;   '(add-hook 'web-mode-hook
;;	     (lambda ()
;;	       (add-hook 'before-save-hook 'web-beautify-html-buffer t t))))

;; (eval-after-load 'css-mode
;;   '(add-hook 'css-mode-hook
;;	     (lambda ()
;;	       (add-hook 'before-save-hook 'web-beautify-css-buffer t t))))
