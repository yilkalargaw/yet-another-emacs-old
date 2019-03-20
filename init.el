;;; package --- Summary
;;; Commentary:
;;; Code:
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;;(package-initialize)

(require 'package)

;; If you want  to use the latest version
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
;; If you want to use the last tagged version
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/"))

;;(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/"))

(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;increase garbage collection threshold for startup only
(setq gc-cons-threshold 64000000)
(add-hook 'after-init-hook #'(lambda ()
                               ;; restore after startup
                               (setq gc-cons-threshold 800000)))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#1B2229" "#ff6c6b" "#98be65" "#ECBE7B" "#51afef" "#c678dd" "#46D9FF" "#DFDFDF"])
 '(custom-enabled-themes (quote (doom-one)))
 '(custom-safe-themes
   (quote
    ("d1b4990bd599f5e2186c3f75769a2c5334063e9e541e37514942c27975700370" "ecba61c2239fbef776a72b65295b88e5534e458dfe3e6d7d9f9cb353448a569e" "75d3dde259ce79660bac8e9e237b55674b910b470f313cdf4b019230d01a982a" "93a0885d5f46d2aeac12bf6be1754faa7d5e28b27926b8aa812840fe7d0b7983" "6b289bab28a7e511f9c54496be647dc60f5bd8f9917c9495978762b99d8c96a0" "1c082c9b84449e54af757bcae23617d11f563fc9f33a832a8a2813c4d7dfb652" "53c3a03393b58dff6d94b25adcbc1e6b3e77e390fdd1e718e421fe32e27a4ef8" "eb02853c4a789d2cd00cc0c6e8e37532690fe70b5fddfc24e259f291048c5ad1" "e41b31a265b928d240420b2d9afaf6b8cf849f1e4713008e9283801198254656" "7e78a1030293619094ea6ae80a7579a562068087080e01c2b8b503b27900165c" "a3fa4abaf08cc169b61dea8f6df1bbe4123ec1d2afeb01c17e11fdc31fc66379" "d2e9c7e31e574bf38f4b0fb927aaff20c1e5f92f72001102758005e53d77b8c9" "f0dc4ddca147f3c7b1c7397141b888562a48d9888f1595d69572db73be99a024" "fe666e5ac37c2dfcf80074e88b9252c71a22b6f5d2f566df9a7aa4f9bea55ef8" "6d589ac0e52375d311afaa745205abb6ccb3b21f6ba037104d71111e7e76a3fc" "4697a2d4afca3f5ed4fdf5f715e36a6cac5c6154e105f3596b44a4874ae52c45" "b54826e5d9978d59f9e0a169bbd4739dd927eead3ef65f56786621b53c031a7c" "cd736a63aa586be066d5a1f0e51179239fe70e16a9f18991f6f5d99732cabb32" "6b2636879127bf6124ce541b1b2824800afc49c6ccd65439d6eb987dbf200c36" default)))
 '(ecb-options-version "2.50")
 '(package-selected-packages
   (quote
    (pelican-html esup all-the-icons-dired yasnippet-snippets yaml-mode which-key web-mode use-package undo-tree toml-mode telephone-line symbol-overlay smartparens skewer-mode robe restclient realgud racer projectile ox-pandoc ox-gfm org-tree-slide org-bullets org-beautify-theme nlinum multiple-cursors monky markdown-toc markdown-preview-mode markdown-mode+ json-mode ivy-hydra irony-eldoc htmlize go-dlv flycheck-rust flycheck-irony flx expand-region epresent emmet-mode ecb doom-themes csv-mode counsel company-web company-tern company-php company-lua company-jedi company-irony company-go company-c-headers company-auctex cargo beacon ag ace-window))))

(provide 'init)

(add-to-list 'load-path "~/.emacs.d/lisp")
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(org-babel-load-file (expand-file-name "~/.emacs.d/myinit.org"))

;;; init.el ends here
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(aw-leading-char-face ((t (:inherit ace-jump-face-foreground :height 3.0))))
 '(region ((t (:background "#2db5c5" :foreground "black"))))
 '(symbol-overlay-default-face ((t (:background "#3f444a" :foreground "#9ca0a4"))))
 '(telephone-line-accent-active ((t (:inherit mode-line :background "purple" :foreground "white")))))
