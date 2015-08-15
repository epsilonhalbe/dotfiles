(require 'package)
(push '("marmalade" . "http://marmalade-repo.org/packages/")
 package-archives )
(push '("melpa" . "http://melpa.milkbox.net/packages/")
 package-archives)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
     (quote
      ("d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "a041a61c0387c57bb65150f002862ebcfe41135a3e3425268de24200b82d6ec9" default)))
 '(inhibit-startup-screen t)
 '(org-agenda-files
     (quote ("~/org/birthday.org"
             "~/org/tasks.org"
             "~/org/t-systems.org"
             "~/org/capture.org")))
 '(org-mobile-files
     (quote ("~/org/birthday.org"
             "~/org/tasks.org"
             "~/org/org-mode-reference-in.org"
             "~/org/t-systems.org"
             "~/org/capture.org"
             "~/org/weight.org")))
 '(package-selected-packages
     (quote (org-context
             evil-anzu
             evil-commentary
             evil-easymotion
             evil-leader
             org-ac
             org-agenda-property
             org-autolist
             org-beautify-theme
             org-bullets
             org-cliplink
             org-download
             org-mobile-sync
             org-outlook
             org-screenshot
             org-table-comment
             org-toc
             timesheet
             anzu
             evil-org
             solarized-theme
             monokai-theme
             evil))))
(package-initialize)
     (setq org-todo-keyword-faces
           '(("PART" . "orange")
             ("DEAD" . (:foreground "blue" :weight bold))))
    (custom-set-faces
     ;; custom-set-faces was added by Custom.
     ;; If you edit it by hand, you could mess it up, so be careful.
     ;; Your init file should contain only one such instance.
     ;; If there is more than one, they won't work right.
     '(org-clock-overlay ((t (:background "gray16"))))
     '(org-default ((t nil)))
     '(org-level-1 ((t (:inherit nil :foreground "#FD971F" :height 1.0))))
     '(org-level-2 ((t (:inherit nil :foreground "#A6E22E" :height 1.0))))
     '(org-level-3 ((t (:inherit nil :foreground "#66D9EF" :height 1.0))))
     '(org-level-4 ((t (:inherit nil :foreground "#E6DB74" :height 1.0))))
     '(org-level-5 ((t (:inherit nil :foreground "#A1EFE4"))))
     '(org-level-6 ((t (:inherit nil :foreground "#A6E22E"))))
     '(org-level-7 ((t (:inherit nil :foreground "#F92672"))))
     '(org-level-8 ((t (:inherit nil :foreground "#66D9EF")))))
    (setq org-mobile-directory "/pi@webPi:/home/pi/org/")
    (setq org-directory "~/org/")
    (setq org-mobile-inbox-for-pull (concat org-directory "/index.org"))
    (load-theme 'monokai t)
    (require 'evil)
(evil-mode 1)
    (define-key global-map "\C-ca" 'org-agenda)
(setq org-src-fontify-natively t)
