(require 'be-utils)

(be/util-eval-on-load "iedit"

  (defvar *be-iedit-auto-complete-was-on* nil)
  (make-variable-buffer-local '*be-iedit-auto-complete-was-on*)

  (defun be/iedit-toggle ()
    (interactive)
    (iedit-mode))

  (define-key global-map
    (kbd "<f4>e") 'be/iedit-toggle))

(be/util-eval-on-load ("iedit" "auto-complete")

  (defadvice be/iedit-toggle (around iedit-autocomplete activate)
    "Handles auto-complete-mode when going to iedit-mode"
    (progn
      (if (and iedit-mode
               (fboundp 'auto-comlete-mode))
          (when *be-iedit-auto-complete-was-on*
            (setq *be-iedit-auto-complete-was-on* nil)
            (auto-complete-mode t))
        (when auto-complete-mode
          (progn
            (setq *be-iedit-auto-complete-was-on* t)
            (auto-complete-mode nil))))
      ad-do-it)))

;; occur-mode is always there on emacs > 24
(when (fboundp 'occur)
  (defun be/occur-at-point ()
    (interactive)
    (occur (thing-at-point 'symbol))))

(be/util-eval-on-load ("evil")
  (evil-define-key 'normal global-map
    (kbd "<f4>o") 'be/occur-at-point))

(be/util-eval-on-load ("evil" "iedit")
  (evil-define-key 'normal global-map
    (kbd ",ma") 'be/iedit-toggle))


(provide 'be-edit)
