;; init-php.el -- Emacs PHP development configuration

;;; Commentary:
;; PHP package configuration including
;; - `php-mode' for PHP major mode
;; - `ac-php' for auto-completion
;; - `geben' for xdebug support
;; - `flycheck' for static code analysis

;;; Code:

(defun my-php-mode-hook ()
  "PHP mode setup."

  (defvar flycheck-phpcs-standard)
  (defvar ac-sources)
  (defvar php-mode-map)

  (c-set-style "php")
  ;; (setq-local flycheck-phpcs-standard "Magento2")
  ;; (setq-local flycheck-phpcs-standard "PSR2")

  (require 'dap-php)
  ;; M-x treemacs-toggle-fixed-width

  (define-key php-mode-map (kbd "<f5>") 'dap-continue)
  (define-key php-mode-map (kbd "<f9>") 'dap-breakpoint-toggle)
  (define-key php-mode-map (kbd "<f10>") 'dap-next)
  (define-key php-mode-map (kbd "<f11>") 'dap-step-in)
  (define-key php-mode-map (kbd "<f12>") 'dap-step-out)

  ;; AC-PHP
  (require 'ac-php)
  (setq ac-sources '(ac-source-php))
  (ac-php-core-eldoc-setup)
  (define-key php-mode-map (kbd "C-c f") 'ac-php-find-symbol-at-point)
  (define-key php-mode-map (kbd "C-c b") 'ac-php-location-stack-back)

  ;; Modes
  (auto-complete-mode t)
  ;; (global-flycheck-mode t)
  (yas-global-mode t)
  (eldoc-mode t))

(use-package dap-mode :ensure t :defer 1)

(use-package php-mode
  :ensure t
  :mode "\\.php\\'"
  :config
  (add-hook 'php-mode-hook 'my-php-mode-hook))

(use-package ac-php :ensure t :defer 1)
;; (use-package geben :ensure t :defer 1)
(use-package flycheck :ensure t :defer 1)
(use-package yasnippet :ensure t :defer 1)

(provide 'init-php)
;;; init-php.el ends here


;; ;; .dir-locals.el
;; ((php-mode . (
;;        (eval . (set (make-local-variable 'my-project-path) (locate-dominating-file default-directory ".dir-locals.el")))
;;               (flycheck-phpcs-standard-dir . my-project-path)
;;               (eval . (setq flycheck-phpcs-standard (concat my-project-path "/ruleset.xml")))
;;               )))
