;;; package --- Summary
;;; Commentary:
;;; Code:
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(package-initialize)

(require 'package)

;; If you want  to use the latest version
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
;; If you want to use the last tagged version
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/"))

(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/"))

(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;increase garbage collection threshold for startup only
(setq gc-cons-threshold 64000000)
(add-hook 'after-init-hook #'(lambda ()
                               ;; restore after startup
                               (setq gc-cons-threshold 800000)))
(provide 'init)

;;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("53c3a03393b58dff6d94b25adcbc1e6b3e77e390fdd1e718e421fe32e27a4ef8" "96998f6f11ef9f551b427b8853d947a7857ea5a578c75aa9c4e7c73fe04d10b4" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "e0d42a58c84161a0744ceab595370cbe290949968ab62273aed6212df0ea94b4" "c48551a5fb7b9fc019bf3f61ebf14cf7c9cdca79bcb2a4219195371c02268f11" "eb02853c4a789d2cd00cc0c6e8e37532690fe70b5fddfc24e259f291048c5ad1" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" "82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "3cd28471e80be3bd2657ca3f03fbb2884ab669662271794360866ab60b6cb6e6" "565aa482e486e2bdb9c3cf5bfb14d1a07c4a42cfc0dc9d6a14069e53b6435b56" "3cc2385c39257fed66238921602d8104d8fd6266ad88a006d0a4325336f5ee02" "b0eb9e6e6dcb29c6ec4bcd72605188f482d52ee019cb0ccc73b5404be4f3a6e7" "e9776d12e4ccb722a2a732c6e80423331bcb93f02e089ba2a4b02e85de1cf00e" "72a81c54c97b9e5efcc3ea214382615649ebb539cb4f2fe3a46cd12af72c7607" "58c6711a3b568437bab07a30385d34aacf64156cc5137ea20e799984f4227265" "725a0ac226fc6a7372074c8924c18394448bb011916c05a87518ad4563738668" "5057614f7e14de98bbc02200e2fe827ad897696bfd222d1bcab42ad8ff313e20" "8b4d8679804cdca97f35d1b6ba48627e4d733531c64f7324f764036071af6534" "aaffceb9b0f539b6ad6becb8e96a04f2140c8faa1de8039a343a4f1e009174fb" "b3775ba758e7d31f3bb849e7c9e48ff60929a792961a2d536edec8f68c671ca5" "9b59e147dbbde5e638ea1cde5ec0a358d5f269d27bd2b893a0947c4a867e14c1" "3d5ef3d7ed58c9ad321f05360ad8a6b24585b9c49abcee67bdcbb0fe583a6950" "e1943fd6568d49ec819ee3711c266a8a120e452ba08569045dd8f50cc5ec5dd3" "4639288d273cbd3dc880992e6032f9c817f17c4a91f00f3872009a099f5b3f84" "e297f54d0dc0575a9271bb0b64dad2c05cff50b510a518f5144925f627bb5832" default)))
 '(ecb-options-version "2.50")
 '(indicate-empty-lines nil)
 '(package-selected-packages
   (quote
    (counsel-projectile fold-dwim tabbar dired-narrow epresent tern-mode esup org markdown-preview-eww markdown-toc minted ecb smooth-scrolling company-lua lua-mode auctex company company-auctex company-c-headers peep-dired dired+ dired-details dracula-theme multiple-cursors json-mode toml-mode yaml-mode csv-mode go-mode rust-mode ag avy expand-region flycheck yasnippet undo-tree counsel ivy flx use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


(require 'use-package)

(add-to-list 'load-path "~/.emacs.d/lisp")
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(org-babel-load-file (expand-file-name "~/.emacs.d/myinit.org"))

;;; init.el ends here
