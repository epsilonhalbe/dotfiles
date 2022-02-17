;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq
 user-full-name "Martin Heuschober"
 user-mail-address "epsilonhalbe@gmail.com"
 doom-theme 'doom-one
 tab-width 2
)

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

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq
 org-directory "~/Dropbox/org/"
 org-ellipsis " ▼ "
 org-id-link-to-org-use-id t
 org-log-done 'time
 org-log-into-drawer t
 org-log-state-notes-insert-after-drawers nil)

(setq
 org-roam-dailies-directory "journal/"
 org-roam-directory "~/Dropbox/org/roam/"
 org-roam-capture-templates
 '(("d" "default" plain
    "%?"
    :if-new (file+head "%<%Y-%m-%d_%H%M>-${slug}.org" "#+title: ${title}\n#+filetags: ${filetags}")
    :unnarrowed t))
 org-roam-dailies-capture-templates
 '(("d" "default" entry
    "* %<%H:%M>: %?"
    :if-new (file+head "%<%Y-%m-%d>.org" "#+title: Journal %<%Y-%m-%d>\n#+filetags: journal")
    :unnarrowed t))
 org-roam-ui-sync-theme t
 org-roam-ui-follow t
 org-roam-ui-update-on-save t
 org-roam-ui-open-on-start t
)

(setq org-agenda-prefix-format
      '((agenda . " %i %-12:c%?-12t% s")
        (todo   . " ")
        (tags   . " %i %-12:c")
        (search . " %i %-12:c")))
 ;; This determines the style of line numbers in effect. If set to `nil', line
 ;; numbers are disabled. For relative line numbers, set this to `relative'.
 (setq display-line-numbers-type t)
 (setq TeX-engine 'xetex)

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
