(setq inhibit-startup-message t)
(setq make-backup-files nil)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(menu-bar-mode -1)
(set-fringe-mode 10)

; Font and Theme
(set-face-attribute 'default nil :font "Monospace" :height 280)

(when (eq system-type 'darwin) ; macOS
     (add-to-list 'default-frame-alist '(undecorated . t)))

; Package
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)

(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))


;; use-package
(require 'use-package)
(setq use-package-always-ensure t)

(use-package ivy
  :config
  (progn
    (ivy-mode)
    (setq ivy-use-virtual-buffers t)
    (setq enable-recursive-minibuffers t)))

(use-package color-theme-sanityinc-tomorrow
  :config
  (load-theme 'sanityinc-tomorrow-night))

(use-package company
  :ensure t
  :init
  (add-hook 'after-init-hook 'global-company-mode))

(use-package nix-mode
  :mode "\\.nix\\'")

(use-package clojure-mode)

(use-package lsp-mode
  :ensure t
  :hook ((clojure-mode . lsp)
         (clojurec-mode . lsp)
         (clojurescript-mode . lsp))
  :config
  (dolist (m '(clojure-mode
               clojurec-mode
               clojurescript-mode
               clojurex-mode))
    (add-to-list 'lsp-language-id-configuration
		 `(,m . "clojure"))))

;; Keybindings

(global-set-key (kbd "s-<left>")  'windmove-left)
(global-set-key (kbd "s-<right>") 'windmove-right)
(global-set-key (kbd "s-<down>")  'windmove-down)
(global-set-key (kbd "s-<up>")    'windmove-up)
(global-set-key (kbd "M-q")       'kill-buffer-and-window)
(global-set-key (kbd "C-s-f")     'toggle-frame-fullscreen)
