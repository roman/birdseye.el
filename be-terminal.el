(require 'be-utils)

(be/util-eval-on-load ("navorski")

  (defun be/terminal-toggle-mode ()
    (interactive)
    (cond
     ((term-in-char-mode)
      (progn
        (term-line-mode)
        (linum-mode 1)))
     ((term-in-line-mode)
      (progn
        (term-char-mode)
        (evil-emacs-state)
        (linum-mode 0)))

     (t nil)))
  )

(be/util-eval-on-load ("evil" "navorski")

  (defun be/terminal-evil-line-mode ()
    (interactive)
    (when (term-in-char-mode)
      (term-line-mode)
      (linum-mode 1))
    (when (evil-emacs-state-p)
      (evil-normal-state)))

  (defun be/terminal-evil-char-mode ()
    (interactive)
    (when (evil-normal-state-p)
      (evil-emacs-state))
    (when (term-in-line-mode)
      (term-char-mode)
      (linum-mode 0))))

(provide 'be-terminal)
