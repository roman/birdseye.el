(require 'be-utils)


(be/util-eval-on-mode emacs-lisp-mode

  (defun be/elisp-eval-para (&optional eval-fn)
    "Select current paragraph and eval the region."
    (interactive)
    (save-excursion
      (mark-paragraph)
      (let ((beg (region-beginning))
            (end (region-end))
            (eval-fn (or eval-fn 'eval-region)))
        (funcall eval-fn beg end)
        (deactivate-mark)
        (be/indent-region beg end)
        (be/flash-region beg end))))

  )


(provide 'be-elisp)
