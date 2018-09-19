;;; package --- Summary
;;; modified-dracula-theme.el ---Modified Dracula Theme

;; Copyright 2015-present, All rights reserved
;;
;; Code licensed under the MIT license
;;; Commentary:

;; A dark color theme available for a number of editors.

;;; Code:

(deftheme myorg)

(setq base-font-color (face-foreground 'default  nil 'default))
(setq background-color (face-background 'default nil 'default))
(setq primary-color (face-foreground 'mode-line nil))
(setq secondary-color (face-background 'secondary-selection nil 'region))
(setq org-highlights `(:foreground ,base-font-color :background ,secondary-color))
(setq headline `(:inherit default :foreground ,base-font-color))
(setq org-highlights `(:foreground ,base-font-color :background ,secondary-color))


  (custom-theme-set-faces 'myorg
;                          `(org-agenda-structure ((t (:inherit default ,@sans-font :height 2.0 :underline nil))))
                         ;;  `(org-level-8 ((t ,headline)))
                         ;;  `(org-level-7 ((t ,headline)))
                         ;;  `(org-level-6 ((t ,headline)))
                         ;;  `(org-level-5 ((t ,headline)))
                         ;;  `(org-level-4 ((t ,headline)))
                         ;;  `(org-level-3 ((t (,@headline  :box ,padding))))
                         ;; `(org-level-2 ((t (,@headline ,@sans-font :height 1.25 :box ,padding))))
                         ;; `(org-level-1 ((t (,@headline ,@sans-font :height 1.5  :box ,padding ))))
                         ;;  `(org-document-title ((t (:inherit org-level-1 :height 2.0 :underline nil :box ,padding))))

                          `(org-block ((t (:foreground ,base-font-color :background ,background-color :box nil))))
                          `(org-block-begin-line ((t ,org-highlights)))
                          `(org-block-end-line ((t ,org-highlights)))

                          `(org-checkbox ((t (:foreground "#000000", :background "#93a1a1" :box (:line-width -3 :color "#93a1a1" :style "released-button")))))

                          `(org-headline-done ((t (:strike-through t))))
                          `(org-done ((t (:strike-through t)))))

;;autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))
