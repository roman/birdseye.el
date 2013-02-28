(require 'be-utils)

(be/util-eval-on-load ("evil" "navorski")

  (defun be/term-evil-line-mode ()
    (interactive)
    (when (term-in-char-mode)
      (term-line-mode)
      (evil-normal-state)))

  (defun be/term-evil-char-mode ()
    (interactive)
    (when (term-in-line-mode)
      (term-char-mode)
      (evil-emacs-state))))

(provide 'be-terminal)
