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
  (setq-local flycheck-phpcs-standard "PSR2")

  ;; AC-PHP
  (require 'ac-php)
  (setq ac-sources '(ac-source-php))
  (ac-php-core-eldoc-setup)
  (define-key php-mode-map (kbd "C-c f") 'ac-php-find-symbol-at-point)
  (define-key php-mode-map (kbd "C-c b") 'ac-php-location-stack-back)

  ;; Modes
  (auto-complete-mode t)
  (global-flycheck-mode t)
  (yas-global-mode t)
  (eldoc-mode t))


(use-package php-mode
  :ensure t
  :mode "\\.php\\'"
  :config
  (add-hook 'php-mode-hook 'my-php-mode-hook))

(use-package ac-php :ensure t :defer 1)
(use-package geben :ensure t :defer 1)
(use-package flycheck :ensure t :defer 1)
(use-package yasnippet :ensure t :defer 1)

(provide 'init-php)
;;; init-php.el ends here
