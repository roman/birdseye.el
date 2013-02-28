(ignore-errors
  (require 'navorski)

  (defun be/term-evil-line-mode ()
    (interactive)
    (when (term-in-char-mode)
      (term-line-mode)
      (evil-normal-state)))

  (defun be/term-evil-char-mode ()
    (interactive)
    (when (term-in-line-mode)
      (term-char-mode)
      (evil-emacs-state)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  (define-key global-map
    (kbd "M-]") 'nav/term)

  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(progn ;ignore-errors
  (require 'evil)

  (evil-define-key 'normal term-mode-map
    (kbd "<f7>e") 'be/term-evil-char-mode)
  (evil-define-key 'emacs term-mode-map
    (kbd "<f7>n") 'be/term-evil-line-mode)
  )


(provide 'be-terminal)
