(require 'be-utils)
(require 'be-eval)


(be/util-eval-on-mode emacs-lisp-mode

  (defun be/elisp-find-function-at-point ()
    "Find directly the function at point in the current window."
    (interactive)
    (let ((symb (function-called-at-point)))
      (when symb
        (find-function symb))))

  )

(provide 'be-elisp)
