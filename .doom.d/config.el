;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq-default
 fill-column 127
 tab-width 2
 TeX-master "main"
 )
(require 'org-re-reveal)
;; (when (memq window-system '(mac ns x)) ;; what is this used for - emacs everywhere???
;;   (exec-path-from-shell-initialize)
;; )
(add-hook 'vue-mode-hook #'lsp!)
(setq
  display-line-numbers-type t
  doom-theme 'doom-nova
  ;; doom-theme 'doom-one
  ;; doom-theme 'doom-outrun-electric
  ;; doom-theme 'doom-solarized-dark
  ;; doom-theme 'doom-solarized-light
  ;; doom-theme 'nord-light
  load-prefer-newer t
  lsp-metals-install-version "0.11.8"
  lsp-ui-sideline-diagnostic-max-lines 9
  org-agenda-files '("${HOME}/Dropbox/org/forgetmenot")
  org-agenda-prefix-format
    '((agenda . " %i %-12:c%?-12t% s")
      (todo   . " ")
      (tags   . " %i %-12:c")
      (search . " %i %-12:c"))
  org-archive-location "${HOME}/Dropbox/org/archive/%s_archive::"
  org-cite-global-bibliography '("${HOME}/Dropbox/org/forgetmenot/bibliography.bib")
  org-directory "${HOME}/Dropbox/org/"
  org-ellipsis " ▼ "
  org-fancy-priorities-list '("#A" "#B" "#C")
  org-id-link-to-org-use-id t
  org-log-done 'time
  org-log-into-drawer t
  org-log-state-notes-insert-after-drawers nil
  org-log-state-notes-into-drawer t
  org-plantuml-jar-path "/opt/homebrew/Cellar/plantuml/*/libexec/plantuml.jar"
  org-roam-capture-templates
    '(("d" "default" plain
       "%?"
       :if-new (file+head "%<%Y-%m-%d_%H%M>-${slug}.org" "#+title: ${title}\n#+filetags: ${filetags}\n")
       :unnarrowed t))
  org-roam-dailies-capture-templates
    '(("d" "default" entry
       "* %<%H:%M>: %?"
       :if-new (file+head "%<%Y-%m-%d>.org" "#+title: Journal %<%Y-%m-%d>\n#+filetags: journal")
       :unnarrowed t))
  org-roam-dailies-directory "journal/"
  org-roam-directory (file-truename "${HOME}/Dropbox/org/roam/")
  org-roam-ui-follow t
  org-roam-ui-open-on-start t
  org-roam-ui-sync-theme t
  org-roam-ui-update-on-save t
  require-final-newline nil
  tab-width 2
  TeX-engine 'xetex
  user-full-name "Martin Heuschober"
  user-mail-address "epsilonhalbe@gmail.com"
)

(use-package! websocket :after org-roam)
(use-package! org-roam-ui :after org-roam)
