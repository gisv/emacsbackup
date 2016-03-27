(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("705f3f6154b4e8fac069849507fd8b660ece013b64a0a31846624ca18d6cf5e1" "51277c9add74612c7624a276e1ee3c7d89b2f38b1609eed6759965f9d4254369" "fbcdb6b7890d0ec1708fa21ab08eb0cc16a8b7611bb6517b722eba3891dfc9dd" default)))
 '(frame-background-mode (quote dark))
 '(global-highlight-parentheses-mode t)
 '(hl-paren-colors (quote ("gold")))
 '(menu-bar-mode nil)
 '(powerline-default-separator (quote arrow-fade))
 '(scroll-preserve-screen-position t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Ubuntu Mono derivative Powerline" :foundry "nil" :slant normal :weight normal :height 130 :width normal))))
 '(anzu-mode-line ((t (:foreground "deep sky blue" :weight bold))))
 '(cursor ((t (:background "white"))))
 '(highlight-indentation-current-column-face ((t (:background "#e3e3d3"))))
 '(hl-paren-face ((t (:underline t))) t)
 '(idle-highlight ((t (:background "color-235" :underline (:color foreground-color :style line)))))
 '(mode-line ((t (:background "grey20" :box nil :weight normal))))
 '(powerline-active2 ((t (:inherit mode-line :background "grey24"))))
 '(region ((t (:background "#483d8b")))))


;; (require 'package)
;; (push '("melpa" . "http://melpa.milkbox.net/packages/")
;;       package-archives)
;; (package-initialize)

;;prevent emacs from creating backup file~
(setq make-backup-files nil)

;;prevent emacs from autosaving #file#
(setq auto-save-default nil)

;;disable cmd+h Mac OSX
(setq mac-pass-command-to-system nil)

;;set frame size initially
(when window-system (set-frame-size (selected-frame) 104 54))

(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/"))
(push '("melpa" . "http://melpa.milkbox.net/packages/")
      package-archives)
(package-initialize)


;;display Visited File's Path in the Frame Title
(setq frame-title-format
      '((:eval (if (buffer-file-name)
		   (abbreviate-file-name (buffer-file-name))
		 "%b"))))

;;disable tool-bar/scroll-bar/menu-bar
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

;;ido-mode configurations
(ido-mode 1)

;;smex configurations                         ;;
(require 'smex) ; Not needed if you use package.el            ;;
(smex-initialize) ; Can be omitted. This might cause a (minimal) delay ;;
					; when Smex is auto-initialized on its first run.   ;;
(global-set-key (kbd "M-x") 'smex)                    ;;
(global-set-key (kbd "M-X") 'smex-major-mode-commands)        ;;
;; This is your old M-x.                          ;;
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)    ;;

;;move-text configurations
(require 'move-text)
(global-set-key (kbd "<A-up>") 'move-text-up)
(global-set-key (kbd "<A-down>") 'move-text-down)

;; no startup msg
(setq inhibit-startup-message t)

;;Turn off alarms completely
(setq ring-bell-function 'ignore)

;anzu configurations
(global-anzu-mode +1)

;;highlight-parentheses configurations
(require 'highlight-parentheses)
(global-highlight-parentheses-mode t)

;;window switching settings
(define-key global-map (kbd "M-±") 'previous-multiframe-window)
(define-key global-map (kbd "M-§") 'other-window)

;;expand-region configurations
(require 'expand-region)
(global-set-key (kbd "ESC <up>") 'er/expand-region)
(global-set-key (kbd "ESC <down>") 'er/contract-region)
(global-set-key (kbd "<s-up>") 'er/expand-region)
(global-set-key (kbd "<s-down>") 'er/contract-region)
(global-set-key (kbd "<M-up>") 'er/expand-region)
(global-set-key (kbd "<M-down>") 'er/contract-region)
(global-set-key (kbd "<M-RET>") 'er/expand-region)
(global-set-key (kbd "M-=") 'er/expand-region)
(global-set-key (kbd "M--") 'er/contract-region)

;;switch buffer
(global-set-key (kbd "<A-right>") 'next-buffer)
(global-set-key (kbd "<A-left>") 'previous-buffer)

;;Indent Region or Buffer
(defun indent-buffer ()
  "Indent the currently visited buffer."
  (interactive)
  (indent-region (point-min) (point-max)))

(defun indent-region-or-buffer ()
  "Indent a region if selected, otherwise the whole buffer."
  (interactive)
  (save-excursion
    (if (region-active-p)
	(progn
	  (indent-region (region-beginning) (region-end))
	  (message "Indented selected region."))
      (progn
	(indent-buffer)
	(message "Indented buffer.")))))
(global-set-key (kbd "C-M-\\") 'indent-region-or-buffer)

;;whole line or region
(whole-line-or-region-mode t)

;;DeleteSelectionMode
(delete-selection-mode 1)

;;Tabs settings
(setq-default indent-tabs-mode nil)
(define-key global-map (kbd "RET") 'newline-and-indent)
(setq-default tab-width 4)

;;dtrt-mode configurations
(require 'dtrt-indent)
(dtrt-indent-mode 1)

;;syntax-table settings
(add-hook 'c-mode-common-hook #'(lambda () (modify-syntax-entry ?_ "w")))
(add-hook 'js2-mode-hook #'(lambda () (modify-syntax-entry ?_ "w")))
(add-hook 'clojure-mode-hook #'(lambda () (modify-syntax-entry ?- "w")))

;;yesornop settings
(defalias 'yes-or-no-p 'y-or-n-p)

;;electric-pair-mode settings
(electric-pair-mode 1)

;;projectile
;;(projectile-global-mode)
;;(setq projectile-completion-system 'helm)

;;helm-projectile settings
;;(helm-projectile-on)

;;hungry delete mode
(require 'hungry-delete)
(global-hungry-delete-mode)

;;set eshell to zsh
(setenv "ESHELL" (expand-file-name "/bin/zsh"))

;;idle highlight mode settings
(defun my/idle-highlight-hook ()
  (idle-highlight-mode 1))
(add-hook 'clojure-mode-hook 'my/idle-highlight-hook)

;;Use Emacs terminfo, not system terminfo
(setq system-uses-terminfo nil)

(load-theme 'atom-one-dark t)
;;(load-theme 'airline-solarized-alternate-gui)

;;powerline theme
(powerline-default-theme)

;; Move to beginning of word before yanking word in isearch-mode.
;; Make C-s C-w and C-r C-w act like Vim's g* and g#, keeping Emacs'
;; C-s C-w [C-w] [C-w]... behaviour.
(require 'thingatpt)
(defun my-isearch-yank-word-or-char-from-beginning ()
  "Move to beginning of word before yanking word in isearch-mode."
  (interactive)
  ;; Making this work after a search string is entered by user
  ;; is too hard to do, so work only when search string is empty.
  (if (= 0 (length isearch-string))
      (beginning-of-thing 'word))
  (isearch-yank-word-or-char)
  ;; Revert to 'isearch-yank-word-or-char for subsequent calls
  (substitute-key-definition 'my-isearch-yank-word-or-char-from-beginning
                             'isearch-yank-word-or-char
                             isearch-mode-map))

(add-hook 'isearch-mode-hook
(lambda ()
"Activate my customized Isearch word yank command."
(substitute-key-definition 'isearch-yank-word-or-char
                           'my-isearch-yank-word-or-char-from-beginning
                           isearch-mode-map)))
