;; Turn off mouse interface early in startup to avoid momentary display
;; (if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
;; (if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
;; (if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
;; although things could be done here the above settings are taken to init.el
;; to avoid the early show
;interface settings
(if (display-graphic-p)
    (progn
      (setq initial-frame-alist
            '(
              (tool-bar-lines . 0)
              (width . 94) ; chars
              (height . 52) ; lines
;              (background-color . "honeydew")
              ;;
              ))

      (setq default-frame-alist
            '(
              (tool-bar-lines . 0)
              (width . 94)
              (height . 52)
;              (background-color . "honeydew")
              ;;
              ))
   
(set-frame-position (selected-frame) 0 15)
;(set-face-attribute 'default nil :height 93 )

))


(add-hook 'after-make-frame-functions
	  (lambda (frame)
	      (select-frame frame)
	      (if (display-graphic-p)
		  (progn
		    (set-frame-size frame 94 52)
		    (set-frame-position frame 0 15)
		    (set-frame-font "Liberation Mono-9.5" nil t)
		    (set-face-attribute 'default nil :height 93 )
		    )))
	    )

(add-to-list 'default-frame-alist '(font . "Liberation Mono-9.5") )

(setq inhibit-startup-message t)
(show-paren-mode t)
(global-set-key (kbd "C-c m b") 'menu-bar-mode)
(column-number-mode 1)
(toggle-indicate-empty-lines t)

(add-to-list 'default-frame-alist '(font . "Liberation Mono-9.5") )

;dracula-theme
(use-package dracula-theme
  :ensure t
  :defer t
  )

(use-package solarized-theme
  :ensure t
  :defer t
  )

(use-package silkworm-theme
  :ensure t
  :defer t
  )

(use-package pastels-on-dark-theme
  :ensure t
  :defer t
  )
(use-package iodine-theme
  :ensure t
  :defer t
  )

(use-package klere-theme
  :ensure t
  :defer t
  )

(use-package gotham-theme
  :ensure t
  :defer t
  )

(use-package color-theme-sanityinc-tomorrow
  :ensure t
  :defer t
  )

(use-package sublime-themes
  :ensure t
  :defer t
  )

(use-package melancholy-theme
  :ensure t
  :defer t
  )

(use-package planet-theme
  :ensure t
  :defer t
  )

(use-package flatui-dark-theme
  :ensure t
  :defer t
)

(load-theme 'modified-dracula t)
;(load-theme 'dorsey t)

(setq default-directory "~/")

(use-package telephone-line
  :ensure t
  :defer t

  :config (progn (setq telephone-line-lhs
  		     '((accent . (telephone-line-vc-segment
  				  telephone-line-erc-modified-channels-segment
  				  telephone-line-process-segment))
  		       (evil    . (telephone-line-buffer-segment
  				 ; telephone-line-minor-mode-segment
				  ))))
  	       ;; (setq telephone-line-rhs
  	       ;; 	     '((nil    . (telephone-line-misc-info-segment))
  	       ;; 	       (accent . (telephone-line-major-mode-segment))
  	       ;; 	        ))
))

(add-hook 'after-make-frame-functions
	  (lambda (frame)
	    (select-frame frame)
	    (if (not (display-graphic-p))
		(progn
		  (setq telephone-line-primary-right-separator 'telephone-line-abs-left
			telephone-line-secondary-right-separator 'telephone-line-abs-hollow-left
			telephone-line-primary-left-separator 'telephone-line-abs-left
			telephone-line-secondary-left-separator 'telephone-line-abs-hollow-left)
		  (setq telephone-line-subseparator '())
		  (telephone-line-mode 1))
		(progn
	          (setq telephone-line-primary-left-separator 'telephone-line-cubed-left
			telephone-line-secondary-left-separator 'telephone-line-cubed-hollow-left
			telephone-line-primary-right-separator 'telephone-line-cubed-left
			telephone-line-secondary-right-separator 'telephone-line-cubed-hollow-left)
		  (setq telephone-line-subseparator-faces '())
		  (setq telephone-line-height 25)
                  (telephone-line-mode 1)
                  )
		  )
;(telephone-line-mode)
));)
;
;(add-hook 'after-init-hook
;(add-hook 'telephone-line-mode-hook
;	  (lambda ()
	    (if (not (display-graphic-p))
		(progn
		  (setq telephone-line-primary-right-separator 'telephone-line-abs-left
			telephone-line-secondary-right-separator 'telephone-line-abs-hollow-left
			telephone-line-primary-left-separator 'telephone-line-abs-left
			telephone-line-secondary-left-separator 'telephone-line-abs-hollow-left)
		  (setq telephone-line-subseparator '())
		  
		  (telephone-line-mode 1))
		(progn
		  (setq telephone-line-primary-left-separator 'telephone-line-cubed-left
			telephone-line-secondary-left-separator 'telephone-line-cubed-hollow-left
			telephone-line-primary-right-separator 'telephone-line-cubed-left
			telephone-line-secondary-right-separator 'telephone-line-cubed-hollow-left)
		  (setq telephone-line-subseparator-faces '())
		  (setq telephone-line-height 25)
		  (telephone-line-mode 1)
                  )
;                  (telephone-line-mode)
)
;;))
;
;;(telephone-line-mode)

;hydra
(use-package hydra
  :ensure t
;  :defer t
  )

(defhydra hydra-zoom (global-map "<f10>")
  "zoom"
  ("g" text-scale-increase "in")
  ("l" text-scale-decrease "out"))

(defhydra hydra-hs (:idle 1.0)
   "
Hide^^            ^Show^            ^Toggle^    ^Navigation^
----------------------------------------------------------------
_h_ hide all      _s_ show all      _t_oggle    _n_ext line
_d_ hide block    _a_ show block              _p_revious line
_l_ hide level

_SPC_ cancel
"
   ("s" hs-show-all)
   ("h" hs-hide-all)
   ("a" hs-show-block)
   ("d" hs-hide-block)
   ("t" hs-toggle-hiding)
   ("l" hs-hide-level)
   ("n" forward-line)
   ("p" (forward-line -1))
   ("SPC" nil)
)

(global-set-key (kbd "C-c @") 'hydra-hs/body) ;;example-binding

(defhydra hydra-apropos (:color blue)
  "Apropos"
  ("a" apropos "apropos")
  ("c" apropos-command "cmd")
  ("d" apropos-documentation "doc")
  ("e" apropos-value "val")
  ("l" apropos-library "lib")
  ("o" apropos-user-option "option")
  ("u" apropos-user-option "option")
  ("v" apropos-variable "var")
  ("i" info-apropos "info")
  ("t" tags-apropos "tags")
  ("z" hydra-customize-apropos/body "customize"))

(defhydra hydra-customize-apropos (:color blue)
  "Apropos (customize)"
  ("a" customize-apropos "apropos")
  ("f" customize-apropos-faces "faces")
  ("g" customize-apropos-groups "groups")
  ("o" customize-apropos-options "options"))

(use-package ivy :demand
  :ensure t
  :init (ivy-mode 1)
        (use-package flx
	  :ensure t
	  )
    
	(setq ivy-re-builders-alist
	      '((swiper . ivy--regex-plus)
		(counsel-grep  . ivy--regex-plus)
		(counsel-git-grep . ivy--regex-plus)
		(t . ivy--regex-fuzzy)))
  
	(setq ivy-initial-inputs-alist nil)
	(setq ivy-format-function 'ivy-format-function-line)

	:config (setq ivy-use-virtual-buffers t
		      ivy-count-format "%d/%d ")

	:bind ("C-x b" . ivy-switch-buffer)
              ("C-x C-b" . ivy-switch-buffer)
	      ("C-c C-r" . ivy-resume)
  )

(use-package counsel
  :ensure t
  :defer t
  :bind(
	("C-x C-f" . counsel-find-file)
	("M-x" . counsel-M-x)
	("H-f" . counsel-ag)
	("C-c M-?" . counsel-ag))
  )
(use-package swiper
  :ensure t
  :defer t
  :bind (("M-s s" . swiper))
  )

;;(use-package hydra
;;  :ensure t
;;  :after ivy
;;)

(use-package ivy-hydra
  :ensure t
  :after (ivy hydra))

;backups
(setq backup-directory-alist '((".*" . "~/.emacs.d/backups")))
(setq auto-save-file-name-transforms
      `((".*" ,"~/.emacs.d/backups" t)))
(setq backup-by-copying t)

(setq select-enable-clipboard t)

(fset 'yes-or-no-p 'y-or-n-p)

;undo-tree
(use-package undo-tree
  :diminish undo-tree-mode
  :defer 2
 ;:bind ("H-/" . undo-tree-visualize)
  :config (global-undo-tree-mode))

(global-hl-line-mode)

(if (version< emacs-version "26.0")
    (linum-relative-global-mode)
    (progn  (setq display-line-numbers-type (quote relative))
	    (global-display-line-numbers-mode))
    )

(use-package iy-go-to-char
  :ensure t
  :defer t
  )

;nlinum mode
(use-package nlinum
  :ensure t
  :config  (setq nlinum-highlight-current-line t)
           (setq nlinum-use-right-margin t)

  :defer t
    )
(add-hook 'after-init-hook 'global-nlinum-mode t)

;which mode
(use-package which-key
  :ensure t
  :defer 2
  :config (which-key-mode)
    )

;neotree
(use-package neotree
  :ensure t
  :defer t
  :bind ("H-." . 'neotree-toggle)
        ("C-c n t" . 'neotree-toggle)
  :config
         (use-package all-the-icons
                 :ensure t
                 )
         (setq neo-theme (if (display-graphic-p) 'icons 'arrows))
					;          (setq neo-theme 'icons)
	 (setq neo-window-fixed-size nil)
)

(add-hook 'neotree-mode-hook 'my-neotree-hook)
(defun my-neotree-hook ()
  (nlinum-mode 0))

;magit
(use-package magit
  :ensure t
  :defer t
  )

(global-set-key (kbd "C-C g m") 'magit-status)
(global-set-key (kbd "H-g") 'magit-status)

;yasnippet
(use-package yasnippet
  :ensure t
  :defer 1
  :diminish yas-minor-mode
  :config
  (yas-global-mode 1))

(add-hook 'prog-mode-hook 'yas-minor-mode)

;flycheck
(use-package flycheck
  :ensure t
;      :config
  :defer t)

(add-hook 'prog-mode-hook 'flycheck-mode)

;expand-region
(use-package expand-region
  :ensure t
  :defer 3
  :bind ("C-=" . er/expand-region)
;     :config  (local-set-key (kbd "C-;") 'iedit-mode)
  )

;avy
(use-package avy
  :ensure t
  :defer t
  :bind ("C-c v c" . avy-goto-char)
  ("C-c v 2" . avy-goto-char-2)
  ("C-c v w" . avy-goto-word-1)
  ("C-c v l" . avy-goto-line)
;  :config  (local-set-key (kbd "C-;") 'iedit-mode)
  )

;ace-window
(use-package ace-window
  :ensure t
;  :defer 3
  :bind ("H-o" . ace-window)
  ("C-c w n" . ace-window)
  )

;ag
(use-package ag
  :ensure t
  :defer t
  )

;rust
    (use-package rust-mode
      :ensure t
      :defer t)

;go
    (use-package go-mode
      :ensure t
      :defer t)

;csv
    (use-package csv-mode
      :ensure t
      :defer t)

;yaml,toml and json
    (use-package yaml-mode
      :ensure t
      :defer t)
    (use-package toml-mode
      :ensure t
      :defer t)
    (use-package json-mode
      :ensure t
      :defer t)

;multiple-cursors
(use-package multiple-cursors
  :ensure t
  :defer t
  :config (define-key mc/keymap (kbd "<return>") nil)
  :bind ("H-=" . mc/unmark-previous-like-this)
        ("H-]" . mc/mark-next-like-this)
        ("H-[" . mc/mark-previous-like-this)
		("H-\'" . mc/unmark-next-like-this)
		("H-\\" . mc/mark-all-like-this)
		("C-S-<mouse-1>" . mc/add-cursor-on-click)
)

(defhydra hydra-multiple-cursors (:hint nil)
  "
     ^Up^            ^Down^        ^Other^
----------------------------------------------
[_p_]   Next    [_n_]   Next    [_l_] Edit lines
[_P_]   Skip    [_N_]   Skip    [_a_] Mark all
[_M-p_] Unmark  [_M-n_] Unmark  [_r_] Mark by regexp
^ ^             ^ ^             [_q_] Quit
"
  ("l" mc/edit-lines :exit t)
  ("a" mc/mark-all-like-this :exit t)
  ("n" mc/mark-next-like-this)
  ("N" mc/skip-to-next-like-this)
  ("M-n" mc/unmark-next-like-this)
  ("p" mc/mark-previous-like-this)
  ("P" mc/skip-to-previous-like-this)
  ("M-p" mc/unmark-previous-like-this)
  ("r" mc/mark-all-in-region-regexp :exit t)
  ("q" nil))

(use-package projectile
  :ensure t
  :config
  (projectile-global-mode)
(setq projectile-completion-system 'ivy))

;; (use-package counsel-projectile
;;   :ensure t)
;; ;  :config
;  (counsel-projectile-on))


(add-hook 'prog-mode-hook 'projectile-mode)
;(add-hook 'projectile-mode-hook 'counsel-projectile-mode)

(defhydra hydra-projectile-other-window (:color teal)
  "projectile-other-window"
  ("f"  projectile-find-file-other-window        "file")
  ("g"  projectile-find-file-dwim-other-window   "file dwim")
  ("d"  projectile-find-dir-other-window         "dir")
  ("b"  projectile-switch-to-buffer-other-window "buffer")
  ("q"  nil                                      "cancel" :color blue))

(defhydra hydra-projectile (:color teal
                            :hint nil)
  "
     PROJECTILE: %(projectile-project-root)

     Find File            Search/Tags          Buffers                Cache
------------------------------------------------------------------------------------------
  _F_: file            _a_: ag                _i_: Ibuffer           _c_: cache clear
 _ff_: file dwim       _g_: update gtags      _b_: switch to buffer  _x_: remove known project
 _fd_: file curr dir   _o_: multi-occur     _s-k_: Kill all buffers  _X_: cleanup non-existing
  _r_: recent file                                               ^^^^_z_: cache current
  _d_: dir

"
  ("a"   projectile-ag)
  ("b"   projectile-switch-to-buffer)
  ("c"   projectile-invalidate-cache)
  ("d"   projectile-find-dir)
  ("F" projectile-find-file)
  ("ff"  projectile-find-file-dwim)
  ("fd"  projectile-find-file-in-directory)
  ("g"   ggtags-update-tags)
  ("s-g" ggtags-update-tags)
  ("i"   projectile-ibuffer)
  ("K"   projectile-kill-buffers)
  ("s-k" projectile-kill-buffers)
  ("m"   projectile-multi-occur)
  ("o"   projectile-multi-occur)
  ("s-p" projectile-switch-project "switch project")
  ("p"   projectile-switch-project)
  ("s"   projectile-switch-project)
  ("r"   projectile-recentf)
  ("x"   projectile-remove-known-project)
  ("X"   projectile-cleanup-known-projects)
  ("z"   projectile-cache-current-file)
  ("`"   hydra-projectile-other-window/body "other window")
  ("q"   nil "cancel" :color blue))

;esup
;(use-package esup
;  :ensure t
;  :defer t)

(use-package dired
;  :defer t
;   :init (setq dired-dwim-target t)
   )

(use-package peep-dired
  :ensure t
  :defer t
  :bind (("C-." . peep-dired)
	 (:map peep-dired-mode-map
               ("SPC" . nil)
               ("<backspace>" . nil))))
;(if (display-graphic-p)(add-hook 'dired-mode-hook (lambda () (define-key dired-mode-map (kbd "C-.") 'peep-dired))))

(use-package quick-preview
  :ensure t
  :defer t
  :bind ((:map dired-mode-map 
	       ("C-Q" . quick-preview-at-point)))
  )
;(if (display-graphic-p)(add-hook 'dired-mode-hook (lambda () (define-key dired-mode-map (kbd "Q") 'quick-preview-at-point))))

(use-package dired-narrow
  :ensure t
  :bind (:map dired-mode-map
              ("/" . dired-narrow)))

(add-hook 'dired-load-hook
          (function (lambda () (load "dired-x"))))
(add-hook 'dired-load-hook
	  (function (lambda () (load "dired-aux"))))

(eval-after-load 'dired '(progn (require 'joseph-single-dired)))
(define-key dired-mode-map (kbd "C-c C-w") 'wdired-change-to-wdired-mode)
(define-key dired-mode-map (kbd "C-c C-d") 'wdired-change-to-dired-mode)

;company
  (use-package company
    :ensure t
        :defer t
        :config (require 'company)

        (use-package company-c-headers
          :ensure t)

  (add-hook 'after-init-hook 'global-company-mode)
  (global-set-key (kbd "<backtab>") 'company-complete-common)
  (global-set-key (kbd "C-`") 'company-yasnippet)
  (define-key company-active-map (kbd "C-n") 'company-select-next)
  (define-key company-active-map (kbd "C-p") 'company-select-previous)
  (add-to-list 'company-backends 'company-c-headers))

;latex/auctex
  (use-package  company-auctex
  :ensure t
  :config  (company-auctex-init)
  :defer 5
  )

  (add-hook 'LaTeX-mode-hook 'visual-line-mode)
  (add-hook 'LaTeX-mode-hook 'flyspell-mode)
  (add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)

;lua
(use-package lua-mode
  :ensure t
  :defer t)

(use-package company-lua
  :ensure t
  :config;(require 'company-lua)
      ;(add-to-list 'company-backends 'company-lua)
  (eval-after-load 'company
    '(push 'company-lua company-backends)))

(use-package robe
  :ensure t
  :bind ("C-c r s" . robe-start)
  :hook (ruby-mode . robe-mode)
)
;  (add-hook 'ruby-mode-hook 'robe-mode))

(eval-after-load 'company
  '(push 'company-robe company-backends))

;web-mode

 (use-package web-mode
   :ensure t
   :mode ("\\.html\\'" 
          "\\.css?\\'" 
          "\\.phtml\\'" 
          "\\.erb\\'" 
          "\\.html?\\'" 
          )
  
   :config
   (setq web-mode-markup-indent-offset 2)
 ;  (setq web-mode-engines-alist
 ;        '(("django" . "focus/.*\\.html\\'")
 ;          ("ctemplate" . "realtimecrm/.*\\.html\\'")))
 )

 (use-package company-web
   :config
   (add-hook 'web-mode-hook
             (lambda ()
               (add-to-list 'company-backends 'company-web-html)))
   (add-hook 'html-mode-hook
             (lambda ()
               (add-to-list 'company-backends 'company-web-html))))

(use-package emmet-mode
  :ensure t
  :hook (sgml-mode css-mode web-mode))

;(defadvice company-tern (before web-mode-set-up-ac-sources activate)
;  "Set `tern-mode' based on current language before running company-tern."
;  (if (equal major-mode 'web-mode)
;      (let ((web-mode-cur-language
;             (web-mode-language-at-pos)))
;        (if (string= web-mode-cur-language "javascript")
;            (unless tern-mode (tern-mode))
;          (if tern-mode (tern-mode ))))))

(use-package js2-mode
   :ensure t
 ;        :defer t
   :mode "\\.js\\'"
   :interpreter "node"
   )

 (use-package company-tern
   :ensure t
   :config
   (eval-after-load 'company
     '(push 'company-tern company-backends)))


 (use-package tern
       :ensure t
       :hook ((js-mode . tern-mode)
              (js2-mode . tern-mode))
       :config (progn (defun kill-tern-process ()
                  "Kill the tern process if any. The process will be restarted.  This is useful if tern becomes unreachable."
                  (interactive)
                  (delete-process "Tern")))
   )



;      (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

(use-package skewer-mode
  :ensure t
  :defer t
  :init
  (skewer-setup))

;(use-package skewer-repl
;  :ensure t
;  :defer t
;  :config (define-key skewer-repl-mode-map (kbd "C-c C-z") #'quit-window))

(use-package php-mode
  :ensure t
  :mode "\\.php\\'"
  :config (require 'php-extras)
 )
(use-package company-php
  :ensure t
  :defer t)
(use-package php-extras
  :ensure t
  :defer t)

(add-hook 'php-mode-hook
          '(lambda ()
             (require 'company-php)
             (company-mode t)
             (ac-php-core-eldoc-setup) ;; enable eldoc
             (make-local-variable 'company-backends)
             (add-to-list 'company-backends 'company-ac-php-backend)))
;(eval-after-load 'php-mode
;  (require 'php-extras))

(use-package restclient
  :ensure t
  :defer t)

;smooth-scrolling
;; (use-package smooth-scrolling
;;   :ensure t
;;   :config (setq smooth-scroll-margin 2)
;;   )
;; scroll one line at a time (less "jumpy" than defaults)
    
(setq mouse-wheel-scroll-amount '(10 ((shift) . 10))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 1) ;; keyboard scroll one line at a time

;ecb
  (use-package ecb
  :ensure t
  :defer t
  :init (setq ecb-tip-of-the-day nil)
  :bind (( "C-c e b" . ecb-minor-mode)
        :map ecb-mode-map
		("H-1" . 'ecb-goto-window-edit1)
		("H-2" . 'ecb-goto-window-directories)
		("H-3" . 'ecb-goto-window-sources)
		("H-4" . 'ecb-goto-window-methods)
		("H-5" . 'ecb-goto-window-history)) 
)

;org fontify
(setq org-src-fontify-natively t
    org-src-tab-acts-natively t
    org-confirm-babel-evaluate nil
    org-edit-src-content-indentation 0)

;org-md
 (eval-after-load "org"
  '(require 'ox-md nil t))

;org-beamer
 (eval-after-load "org"
  '(require 'ox-beamer nil t))

;org-odt
 (eval-after-load "org"
  '(require 'ox-odt nil t))

;org-babel
(if (version< emacs-version "26.0")
(org-babel-do-load-languages
 'org-babel-load-languages
 '((sh . true) (python . true) (ruby .true)
   (emacs-lisp .true)))
(org-babel-do-load-languages
 'org-babel-load-languages
 '((shell . true) (python . true) (ruby .true)
   (emacs-lisp .true))))

;org-gfm
(use-package ox-gfm :ensure t :defer t)
(eval-after-load "org"
  '(require 'ox-gfm nil t))

;org-latex
;pygment minted
;(require 'org-latex)
(require 'ox-latex)
(add-to-list 'org-latex-packages-alist '("" "minted"))
(setq org-latex-listings 'minted)

(setq org-latex-pdf-process
      '("pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"))

;;(use-package org :ensure t)
(use-package htmlize :ensure t)
(setq org-html-html5-fancy t
org-html-doctype "html5")

(setq org-html-html5-fancy t
      org-html-doctype "html5")
;;; Loading custom backend
;(add-to-list 'load-path "lisp/")
;(load-file "~/.emacs.d/lisp/pelican-html.el")
(require 'pelican-html)

(setq org-latex-to-pdf-process 
  '("xelatex -interaction nonstopmode %f"
     "xelatex -interaction nonstopmode %f")) ;; for multiple passes

;org-bullets
(use-package org-bullets 
  :ensure t
  :hook (org-mode . (lambda () (org-bullets-mode 1))))

;org-beautify-theme
(use-package org-beautify-theme 
  :ensure t
  :defer t)
(add-hook 'org-mode-hook (if (display-graphic-p)(lambda () (load-theme 'org-beautify))))

;org-tree-slide
(use-package org-tree-slide
  :ensure t
  :defer t)
(define-key org-mode-map (kbd "<f8>") 'org-tree-slide-mode)
(define-key org-mode-map (kbd "S-<f8>") 'org-tree-slide-skip-done-toggle)

(with-eval-after-load "org-tree-slide"
  (define-key org-tree-slide-mode-map (kbd "<f9>") 'org-tree-slide-move-previous-tree)
  (define-key org-tree-slide-mode-map (kbd "<f10>") 'org-tree-slide-move-next-tree)
  )

;epresent
(use-package epresent
  :ensure t
  :defer t)

;markdown
  (use-package markdown-mode
  :ensure t
  :defer t
  :config 
  (use-package markdown-mode+
  :ensure t)
  (use-package markdown-preview-mode
  :ensure t)
  (use-package markdown-toc
  :ensure t)
  )
(autoload 'markdown-mode "markdown-mode" "Major mode for Markdown files" t)
(add-to-list 'auto-mode-alist '("README\\.md\\'" . gfm-mode))
(setq markdown-command "pandoc -c ~/.emacs.d/github-pandoc.css --from markdown_github -t html5 --mathjax --highlight-style pygments --standalone")

(use-package key-chord
  :ensure t
  :init 
  ;; Max time delay between two key presses to be considered a key chord
  (setq key-chord-two-keys-delay 0.1) ; default 0.1    
  ;; Max time delay between two presses of the same key to be considered a key chord.
  ;; Should normally be a little longer than `key-chord-two-keys-delay'.
  (setq key-chord-one-key-delay 0.2) ; default 0.2
  )

;(use-package key-seq
;  :ensure t
;)

;;      (key-chord-define-global "cv"     'reindent-then-newline-and-indent)
;;      (key-chord-define-global "4r"     "$")
;;      (key-chord-define c++-mode-map ";;"  "\C-e;")

(key-chord-mode 1)

(global-set-key (kbd "C-<f9>") 'key-chord-mode)
(global-set-key (kbd "C-x ^") 'enlarge-window)
(global-set-key (kbd "C-x C-^") 'shrink-window)
(key-chord-define-global "QQ" 'iy-go-to-char)
(key-chord-define-global "ZZ" 'iy-go-to-char-backward)

(use-package typing
  :ensure t
  :defer t
)

;;(add-hook 'projectile-mode-hook 'counsel-projectile-mode)

(use-package smartparens-config
    :ensure smartparens
    :config
    (progn
      (show-smartparens-global-mode t)))

(add-hook 'prog-mode-hook #'smartparens-mode)
(add-hook 'markdown-mode-hook #'smartparens-mode)
