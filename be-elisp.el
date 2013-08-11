(require 'be-utils)
(require 'be-eval)


(be/util-eval-on-mode emacs-lisp-mode

  (defun be/elisp-find-function-at-point ()
    "Find directly the function at point in the current window."
    (interactive)
    (let ((symb (function-called-at-point)))
      (when symb
        (find-function symb))))

  (defun be/elisp-delete-elc-file ()
    "Deletes elc file of current el file"
    (interactive)
    (let* ((el-filepath buffer-file-name)
           (elc-filepath (format "%s.elc"
                            (file-name-sans-extension el-filepath))))
      (when (file-exists-p elc-filepath)
        (delete-file elc-filepath)
        (byte-compile-file el-filepath))))

  (add-hook 'after-save-hook 'be/elisp-delete-elc-file t))

(provide 'be-elisp)
