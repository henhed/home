;;; ~/.emacs -- Emacs Configuration

;;; Commentary:
;; My preferences and package configs mainly focused on PHP and C development

;;; Code:


;; Package repository setup
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(unless (package-installed-p 'quelpa)
  (package-refresh-contents)
  (package-install 'quelpa))
(unless (package-installed-p 'quelpa-use-package)
  (package-refresh-contents)
  (package-install 'quelpa-use-package))
(require 'quelpa-use-package)

;; Put manual customizations in another file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file 'noerror)


;; Projectile
(use-package projectile
  :ensure t
  :defer 1
  :config
  (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (global-set-key (kbd "<f5>") 'projectile-compile-project)
  (global-set-key (kbd "<f6>") 'projectile-run-project)
  (projectile-mode))

;; ;; Helm
;; (use-package helm
;;   :ensure t
;;   :diminish helm-mode
;;   :commands helm-mode
;;   :config
;;   (helm-mode t)
;;   (setq helm-buffers-fuzzy-matching t)
;;   (setq helm-autoresize-mode t)
;;   (setq helm-buffer-max-length 40))

;; (use-package helm-projectile
;;   :ensure t
;;   :commands (helm-projectile helm-projectile-switch-project))

;; (use-package helm-make
;;   :ensure t
;;   :config
;;   (global-set-key (kbd "C-c m") 'helm-make-projectile))


;; Neotree
(use-package neotree
  :ensure t
  :config
  (setq neo-window-width 40))


;; Pull in some more elaborate package configs
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(require 'init-php)
(require 'init-c)

;; Global preferences
(setq-default indent-tabs-mode nil)
(put 'narrow-to-region' disabled nil)
(column-number-mode)
(tool-bar-mode 0)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(setq backup-directory-alist '((".*" . "~/.emacs.d/backups/")))
