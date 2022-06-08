;; init-c.el -- Emacs C development configuration

;;; Commentary:
;; C package configuration including
;; - `emacs-gdb'

;;; Code:

;; (use-package gdb-mi :quelpa (gdb-mi :fetcher git
;;                                     :url "https://github.com/weirdNox/emacs-gdb.git"
;;                                     :files ("*.el" "*.c" "*.h" "Makefile"))
;;   :init
;;   (fmakunbound 'gdb)
;;   (fmakunbound 'gdb-enable-debug))

(defun my-c-mode-hook ()
  "C mode setup."

  (define-key c-mode-map [backtab] 'dabbrev-expand)
  (define-key c++-mode-map [backtab] 'dabbrev-expand)
  ;; (define-key c-mode-map "\t" 'dabbrev-expand)
  ;; (define-key c-mode-map [backtab] 'indent-for-tab-command)

  (setq dabbrev-case-replace t)
  (setq dabbrev-case-fold-search t)
  (setq dabbrev-upcase-means-case-search t)
  (setq c-default-style "linux" c-basic-offset 4))

(add-hook 'c-mode-common-hook 'my-c-mode-hook)
(add-hook 'c++-mode-common-hook 'my-c-mode-hook)

(require 'ansi-color)
(defun endless/colorize-compilation ()
  "Colorize from `compilation-filter-start' to `point'."
  (let ((inhibit-read-only t))
    (ansi-color-apply-on-region
     compilation-filter-start (point))))

(add-hook 'compilation-filter-hook
          #'endless/colorize-compilation)

(provide 'init-c)
;;; init-c.el ends here
