;;; ~/.emacs -- Emacs Configuration

;;; Commentary:
;; My preferences and package configs mainly focused on PHP and C development

;;; Code:


;; Package repository setup
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Helm
(use-package helm
  :ensure t
  :diminish helm-mode
  :commands helm-mode
  :config
  (helm-mode t)
  (setq helm-buffers-fuzzy-matching t)
  (setq helm-autoresize-mode t)
  (setq helm-buffer-max-length 40))

;; Neotree
(use-package neotree
  :ensure t
  :config
  (setq neo-window-width 40)
  (neotree-show))

;; Global preferences
(setq-default indent-tabs-mode nil)
(put 'narrow-to-region' disabled nil)
(column-number-mode)

;; Put manual customizations in another file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file 'noerror)
