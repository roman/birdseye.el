(require 'be-utils)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; flash-region

(defun be/flash-region (beg end)
  (interactive "r")
  (let ((ovl (make-overlay beg end))
        (was-mark-active mark-active)
        (hl-line-mode-on hl-line-mode))
    (setq mark-active nil)
    (overlay-put ovl 'face 'highlight)
    (run-with-timer 0.5 nil
                    (lambda (ovl was-mark-active)
                      (delete-overlay ovl)
                      (setq mark-active was-mark-active))
                    ovl was-mark-active)))

;; shamelessly stolen from evil-mode code
(defun be/indent-region (beg end)
  (interactive "r")
  (if (and (= beg (line-beginning-position))
           (= end (line-beginning-position 2)))
      ;; since some Emacs modes can only indent one line at a time,
      ;; implement "==" as a call to `indent-according-to-mode'
      (indent-according-to-mode)
    (goto-char beg)
    (indent-region beg end))
  (back-to-indentation))

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
