(require 'be-utils)
(require 'be-eval)


(be/util-eval-on-mode emacs-lisp-mode

  (be/create-eval-functions elisp 'eval-region)

  )

(fmakunbound 'be/elisp-eval-para)

(provide 'be-elisp)
