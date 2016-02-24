;;; ELPA repos
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
			 ("marmalade" . "http://marmalade-repo.org/packages/")
			 ("melpa" . "http://melpa.milkbox.net/packages/")))
(add-to-list 'package-archives
	     '("melpa-stable" . "http://stable.melpa.org/packages/") t)
;;; smooth scrolling
(setq scroll-step 1)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ; one line at a time
(setq mouse-wheel-progressive-speed 1) ; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't)

;;; set backup file location
(setq backup-directory-alist '(("." . "~/.emacs_backups")))

;;; line #s
(global-linum-mode t)

;; theme
(when (featurep 'aquamacs)
  (color-theme-initialize)
  (color-theme-clarity)
  (aquamacs-autoface-mode 0)
  (tool-bar-mode 0)
  ;;; Enable Elpy
  (package-initialize)
  (elpy-enable))

;;; Powerline theme
;;; cd ~/.emacs.d/vendor
;;; git clone git://github.com/jonathanchu/emacs-powerline.git
(add-to-list 'load-path "~/.emacs.d/vendor/emacs-powerline")
(require 'powerline)
(setq powerline-arrow-shape 'arrow)
(custom-set-faces
 '(mode-line ((t (:foreground "#030303" :background "#bdbdbd" :box nil))))
 '(mode-line-inactive ((t (:foreground "#f9f9f9" :background "#666666" :box nil)))))
(setq powerline-color1 "grey22")
(setq powerline-color2 "grey40")

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
