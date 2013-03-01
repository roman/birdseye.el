(require 'be-utils)

(defun be/eval-para (eval-fn)
  "Select current paragraph and eval the region."
  (save-excursion
    (mark-paragraph)
    (let ((beg (region-beginning))
          (end (region-end)))
      (funcall eval-fn beg end)
      (deactivate-mark)
      (be/indent-region beg end)
      (be/flash-region beg end))))


(defmacro be/create-eval-functions (name eval-fn-symbol)
  `(progn
     (defun ,(intern (format "be/%s-eval-para" name)) ()
       (interactive)
       (be/eval-para ,eval-fn-symbol)))
  )

(provide 'be-eval)
