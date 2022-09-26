;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Martin Heuschober"
      user-mail-address "martin_heuschober@trimble.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;; (setq doom-theme 'doom-one)
;; (setq doom-theme 'nord-light)
;; (setq doom-theme 'doom-outrun-electric)
(setq doom-theme 'doom-nova)
;; (setq doom-theme 'doom-solarized-dark)
;; (setq doom-theme 'doom-solarized-light)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Dropbox/org/")
(require 'org-re-reveal)
(setq org-id-link-to-org-use-id t)
(setq org-log-into-drawer t)
(setq org-log-state-notes-into-drawer t)

;;(make-directory "~/Dropbox/org/roam/")
(setq org-roam-directory (file-truename "~/Dropbox/org/roam/"))

;;(make-directory "~/Dropbox/org/roam/journal/")
(setq org-roam-dailies-directory "journal/")
(setq org-cite-global-bibliography '("~/Dropbox/org/forgetmenot/bibliography.bib"))
(setq org-archive-location "~/Dropbox/org/archive/%s_archive::")
(setq org-agenda-files (list "~/Dropbox/org/forgetmenot"))

(setq org-roam-capture-templates
  '(("d" "default" plain "%?"
     :target (file+head "%<%Y-%m-%d_%H%M>-${slug}.org" "#+title: ${title}\n#+filetags: ${filetags}\n")
     :unnarrowed t))
)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)
(setq require-final-newline nil)
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))
(setq org-plantuml-jar-path "/usr/local/Cellar/plantuml/*/libexec/plantuml.jar")
(setq load-prefer-newer t)
(setq lsp-metals-install-version "0.11.8")


(setq lsp-ui-sideline-diagnostic-max-lines 9)

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
