;(tool-bar-mode -1)
;(menu-bar-mode -1)
(require 'linum)
(require 'org-install)
(require 'org-mobile)
(line-number-mode 1)
(add-to-list 'auto-mode-alist'("\\.org\\'" . org-mode))
(setq org-todo-keywords '((sequence "IDEA" "TODO" "PENDING" "CANCEL" "DELEGATED" "|" "FAIL" "DONE")))
(setq org-tag-alist '(("@work" . ?w) ("@home" . ?h) ("thesis" . ?t)))
(setq org-directory "~/org")
(setq org-mobile-directory "~/Dropbox/mobile-org")
(setq org-agenda-files (quote ("~/org/lq.org" "`~/org/termine.org`")))
(setq org-mobile-files (quote(;"~/org/from-mobile.org"
                              "~/org/bienvenue_a_marseille.org"
                              "~/org/capture.org"
                              "~/org/lq.org"
                              "~/org/shopping.org"
                              "~/org/termine.org"
                              "~/org/weektask.org"
                              )))
(setq org-mobile-inbox-for-pull "~/org/from-mobile.org")
(server-start)
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(org-agenda-files (quote ("~/org/termine.org" "~/org/lq.org"))))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(el-get 'sync)
