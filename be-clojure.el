(add-to-list 'auto-mode-alist '("[.]cljs$" . clojure-mode))

(be/util-eval-on-load ("clojure-mode" "nrepl")

  (defun be/clojure-load-current-buffer ()
    (interactive)
    (nrepl-load-current-buffer)
    (nrepl-switch-to-repl-buffer t))
  )

(provide 'be-clojure)
