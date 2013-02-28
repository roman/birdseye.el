(require 'be-utils)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; iedit

(be/util-eval-on-load "iedit"

  (defun be/iedit-toggle ()
    (interactive)
    (iedit-mode)))

(be/util-eval-on-load ("iedit" "auto-complete")

  (defvar *be-iedit-auto-complete-was-on* nil)
  (make-variable-buffer-local '*be-iedit-auto-complete-was-on*)

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


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; occur

(defun be/occur-at-point ()
  (interactive)
  (occur (thing-at-point 'symbol)))


(provide 'be-edit)
