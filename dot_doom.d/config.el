;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Rafa de Castro"
      user-mail-address "rafael@micubiculo.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-outrun-electric)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
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
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
;;

(setq select-enable-clipboard t
      select-enable-primary t
      mouse-yank-at-point t)

(when (fboundp 'set-clipboard-coding-system)
  (set-clipboard-coding-system 'utf-8))

(after! treemacs
  (setq treemacs-position 'right))

(after! lsp-mode
  (setq lsp-completion-enable t
        lsp-completion-show-detail t
        lsp-completion-show-kind t
        lsp-completion-enable-additional-text-edit t
        lsp-idle-delay 0.5              ; Slightly faster response
        lsp-signature-auto-activate t   ; Show function signatures
        lsp-signature-render-documentation t))

(after! python
  ;; Ensure LSP starts automatically in Python mode
  (add-hook! 'python-mode-hook #'lsp-deferred)
  ;; Enable completion at point
  (add-hook! 'python-mode-hook
    (setq-local completion-at-point-functions
                (list (cape-capf-super
                       #'lsp-completion-at-point
                       #'cape-dabbrev
                       #'cape-file)))))

;; Corfu completion settings (since we're using corfu, not company)
(after! corfu
  (setq corfu-auto t                    ; Enable auto completion
        corfu-auto-delay 0.2            ; Faster completion
        corfu-auto-prefix 2             ; Start after 2 characters
        corfu-preview-current t         ; Enable current candidate preview
        corfu-quit-no-match t))         ; Automatically quit if no match

;; Cape provides additional completion backends for corfu
(after! cape
  ;; Add useful cape completion functions
  (add-to-list 'completion-at-point-functions #'cape-file)
  (add-to-list 'completion-at-point-functions #'cape-dabbrev))


;; Claude Code Configuration
(use-package! claude-code
  :config
  ;; Use vterm as terminal backend
  (setq claude-code-terminal-backend 'vterm)

  ;; Optional: IDE integration with Monet
  (when (featurep! :tools monet)
    (add-hook 'claude-code-process-environment-functions #'monet-start-server-function)
    (monet-mode 1))

  ;; Start the server for emacsclient (needed for hooks)
  (server-start)

  ;; Enable claude-code-mode
  (claude-code-mode)

  ;; Optional customizations
  (setq claude-code-enable-notifications t
        claude-code-confirm-kill t
        claude-code-optimize-window-resize t
        claude-code-startup-delay 0.1)

  ;; Configure JuliaMono font for Claude buffers
  (add-hook 'claude-code-start-hook
            (lambda ()
              ;; Use JuliaMono font in Claude buffers
              (setq-local buffer-face-mode-face '(:family "JuliaMono"))
              (buffer-face-mode 1)
              ;; Reduce line spacing for better vertical bar display
              (setq-local line-spacing 0.1)
              ;; Increase vterm scrollback for long conversations
              (setq-local vterm-max-scrollback 100000))))

;; Configure Claude window to appear on the right and receive focus
(set-popup-rule! "^\\*claude"
  :side 'right
  :size 0.33  ; 33% of frame width
  :select t   ; Select the window when it opens (gives focus)
  :quit nil
  :ttl nil)

;; Define all keybindings under SPC c A
(map! :leader
      (:prefix ("c A" . "claude-code")
       :desc "Start Claude"                    "c" #'claude-code
       :desc "Start in directory"              "d" #'claude-code-start-in-directory
       :desc "Continue previous conversation"  "C" #'claude-code-continue
       :desc "Resume session"                  "R" #'claude-code-resume
       :desc "New instance"                    "i" #'claude-code-new-instance
       :desc "Kill Claude"                     "k" #'claude-code-kill
       :desc "Kill all instances"              "K" #'claude-code-kill-all

       (:prefix ("s" . "send")
        :desc "Send command"                   "s" #'claude-code-send-command
        :desc "Send with context"              "x" #'claude-code-send-command-with-context
        :desc "Send region"                    "r" #'claude-code-send-region
        :desc "Send file"                      "f" #'claude-code-send-file
        :desc "Send buffer file"               "b" #'claude-code-send-buffer-file
        :desc "Fix error at point"             "e" #'claude-code-fix-error-at-point)

       (:prefix ("r" . "response")
        :desc "Send return (yes)"              "y" #'claude-code-send-return
        :desc "Send escape (no)"               "n" #'claude-code-send-escape
        :desc "Send 1"                          "1" #'claude-code-send-1
        :desc "Send 2"                          "2" #'claude-code-send-2
        :desc "Send 3"                          "3" #'claude-code-send-3)

       (:prefix ("w" . "window")
        :desc "Toggle window"                  "t" #'claude-code-toggle
        :desc "Switch to buffer"               "b" #'claude-code-switch-to-buffer
        :desc "Select buffer (all instances)"  "B" #'claude-code-select-buffer
        :desc "Toggle read-only"               "z" #'claude-code-toggle-read-only-mode)

       :desc "Transient menu"                  "m" #'claude-code-transient
       :desc "Fork conversation"               "f" #'claude-code-fork
       :desc "Slash commands"                  "/" #'claude-code-slash-commands
       :desc "Cycle mode"                      "M" #'claude-code-cycle-mode))

;; Optional: Add a repeat map for mode cycling
(after! claude-code
  (defvar claude-code-mode-repeat-map
    (let ((map (make-sparse-keymap)))
      (define-key map "M" #'claude-code-cycle-mode)
      map)
    "Repeat map for cycling Claude modes.")
  (put 'claude-code-cycle-mode 'repeat-map 'claude-code-mode-repeat-map))
