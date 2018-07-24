;;color
(add-to-list 'default-frame-alist '(foreground-color . "#E0DFDB"))
(add-to-list 'default-frame-alist '(background-color . "black"))
;;highlight bracket
(defadvice show-paren-function
	(after show-matching-paren-offscreen activate)
  "If the matching paren is offscreen, show the matching line in the
        echo area. Has no effect if the character before point is not of
        the syntax class ')'."
  (interactive)
  (let* ((cb (char-before (point)))
		 (matching-text (and cb
							 (char-equal (char-syntax cb) ?\) )
							 (blink-matching-open))))
	(when matching-text (message matching-text))))
(show-paren-mode 1)
;;clock
(display-time-mode 1)
(setq display-time-day-and-date 1)
(setq display-time-24hr-format 1)
;;ido
(ido-mode 1)
;;(setq ido-separator "\n")
(setq ido-default-buffer-method 'selected-window)
;; For Max
(setq mac-function-modifier 'control)
(setq mac-command-modifier 'meta)
(setq ns-alternate-modifier 'super)
;; For Windows

;; Forces the messages to 0, and kills the *Messages* buffer - thus disabling it on startup.
(setq-default message-log-max nil)
(kill-buffer "*Messages*")
;; package manager.
;;(require 'package)
;;(add-to-list 'package-archives
;;           '("elpy" . "http://jorgenschaefer.github.io/packages/"))
(require 'package)
(dolist (source '(("marmalade" . "http://marmalade-repo.org/packages/")
		  ("elpa" . "http://tromey.com/elpa/")
		  ("melpa" . "http://melpa.org/packages/")
		  ))
(add-to-list 'package-archives source t))
(package-initialize)

;;(require 'exec-path-from-shell) ;; if not using the ELPA package
;;(exec-path-from-shell-initialize)
;; color variables
;;https://github.com/ankurdave/color-identifiers-mode
;;(add-hook 'after-init-hook 'global-color-identifiers-mode)
;;web-mode
;;(require 'web-mode)
;;(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
;;(add-to-list 'auto-mode-alist '("\\.js$" . js-mode))
;;(require 'jquery-doc)
;;(add-hook 'js-mode-hook 'jquery-doc-setup)
;; cc-mode
;;for yasnippet and auto-complete
;;(require 'cc-mode)
;;(setq-default c-basic-offset 4 c-default-style "linux")
;;(setq-default tab-width 4 indent-tabs-mode t)
;;(define-key c-mode-base-map (kbd "RET") 'newline-and-indent)
;;Autopair
;;(require 'autopair)
;;(autopair-global-mode 1)
;;(setq autopair-autowrap t)
;;; yasnippet
;;; should be loaded before auto complete so that they can work together
;;(require 'yasnippet)
;;(yas-global-mode 1)
;;
;;(require 'auto-complete)
;;(require 'auto-complete-config)
;;(add-to-list 'ac-dictionary-directories "~/.emacs.d//ac-dict")
;;(ac-config-default)
;;; set the trigger key so that it can work together with yasnippet on tab key
;;; if the word exists in yasnippet, pressing tab will cause yasnippet to
;;; activate, otherwise, auto-complete will
;;(ac-set-trigger-key "TAB")
;;(ac-set-trigger-key "<tab>")
;;(define-key ac-completing-map (kbd "C-s") 'ac-next)
;;(define-key ac-completing-map (kbd "C-w") 'ac-previous)
;;(defun my:ac-c-header-init ()
  ;;(require 'auto-complete-c-headers)
  ;;(add-to-list 'ac-sources 'ac-source-c-headers)
  ;;(add-to-list 'achead:include-directories '"/usr/include/")
  ;;)
;;Let cuda file use c++-mode
;;(add-to-list 'auto-mode-alist '("\\.cu\\'" . c++-mode))
; now let's call this function from c/c++ hooks
;;(add-hook 'c++-mode-hook 'my:ac-c-header-init)
;;(add-hook 'c-mode-hook 'my:ac-c-header-init)
;;fic-mode
;;(require 'fic-mode)
;;(add-hook 'c++-mode-hook 'fic-mode)
;;
;;(require 'auto-complete-c-headers)
;;(add-to-list 'ac-sources 'ac-source-c-headers)
;;solve yasnippet 0.8.0 bug problem
;;(defalias 'yas/get-snippet-tables 'yas--get-snippet-tables)
;;(defalias 'yas/table-hash 'yas--table-hash)
;;font
(set-face-attribute 'default nil
                    :family "Monaco" :height 170 :weight 'normal)
;; comment block
(defun insert-doc-comment () (interactive)
	   (insert "/**")
	   (c-indent-new-comment-line)
	   (newline-and-indent)
	   (insert "**/")
	   (previous-line)
	   (end-of-line)
	   (insert " ")
	   )

;; hide-comnt package
;;(require 'hide-comnt)
;;spell check
;;bind markdown file(.md) to text mode, so fly spell can enable in .md files.
(setq auto-mode-alist (append '(("\\.md$" . text-mode))
      auto-mode-alist))
;;(flyspell-all-modes)
;;(add-hook 'text-mode-hook 'flyspell-mode)
;;(add-hook 'prog-mode-hook 'flyspell-prog-mode)
;;flyspell will block C-c, set it to nil
;;(eval-after-load "flyspell"
  ;;'(define-key flyspell-mode-map (kbd "C-c") nil))

;;line
(global-linum-mode t)
;;keybinding
(defvar my-keys-minor-mode-map (make-keymap) "my-keys-minor-mode keymap.")
(define-key my-keys-minor-mode-map (kbd "C-x w") 'bing-dict-brief)
(define-key my-keys-minor-mode-map (kbd "C-d") 'forward-char)
(define-key my-keys-minor-mode-map (kbd "C-a") 'backward-char)
(define-key my-keys-minor-mode-map (kbd "C-w") 'previous-line)
(define-key my-keys-minor-mode-map (kbd "C-s") 'next-line)
(define-key my-keys-minor-mode-map (kbd "C-f") 'isearch-forward)
(define-key my-keys-minor-mode-map (kbd "C-q") 'beginning-of-line)
(define-key my-keys-minor-mode-map (kbd "M-d") 'forward-word)
(define-key my-keys-minor-mode-map (kbd "M-a") 'backward-word)
(define-key my-keys-minor-mode-map (kbd "M-q") 'delete-backward-char)
(define-key my-keys-minor-mode-map (kbd "M-e") 'delete-forward-char)
(define-key my-keys-minor-mode-map (kbd "M-9") 'beginning-of-buffer)
(define-key my-keys-minor-mode-map (kbd "M-0") 'end-of-buffer)
(define-key my-keys-minor-mode-map (kbd "C-M-s") 'next-buffer)
(define-key my-keys-minor-mode-map (kbd "C-M-w") 'previous-buffer)
(define-key my-keys-minor-mode-map (kbd "C-M-d") 'other-window)
(define-key my-keys-minor-mode-map (kbd "C-x SPC") 'set-mark-command)
(define-key my-keys-minor-mode-map (kbd "M-s") 'scroll-up-command)
(define-key my-keys-minor-mode-map (kbd "M-w") 'scroll-down-command)
(define-key my-keys-minor-mode-map (kbd "C-j") 'newline-and-indent)
(define-key my-keys-minor-mode-map (kbd "M-j") 'c-indent-new-comment-line)
(define-key my-keys-minor-mode-map (kbd "M-m") 'insert-doc-comment)
(define-key my-keys-minor-mode-map (kbd "C-x g") 'magit-status)
(define-key my-keys-minor-mode-map (kbd "C-x m") 'hide/show-comments-toggle)
(define-key my-keys-minor-mode-map (kbd "C-x n") 'minimap-mode)
(define-key my-keys-minor-mode-map (kbd "C-c") 'kill-ring-save)
(define-key my-keys-minor-mode-map (kbd "C-v") 'yank)
(global-set-key (kbd "C-x C-s") (kbd "C-u C-x s"))
(global-set-key (kbd "s-s") (kbd "C-u 1 M-s"))
(global-set-key (kbd "s-w") (kbd "C-u 1 M-w"))

(define-minor-mode my-keys-minor-mode
  "A minor mode so that my key settings override annoying major modes."
  t " my-keys" 'my-keys-minor-mode-map)

(my-keys-minor-mode 1)
;;minibuffer also apply key bind
(defun my-minibuffer-setup-hook ()
  (my-keys-minor-mode 0))

(add-hook 'minibuffer-setup-hook 'my-minibuffer-setup-hook)
