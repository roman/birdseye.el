(add-to-list 'auto-mode-alist '("[.]cljs$" . clojure-mode))
(require 'be-utils)

(be/util-eval-on-mode "clojure-mode"
  (setq lineker-column-limit 90)
  (lineker-mode 1)
  (linum-mode 1))
;; (be/util-eval-on-load ("clojure-mode" "nrepl")

;;   (defun be/clojure-load-current-buffer ()
;;     (interactive)
;;     (nrepl-load-current-buffer)
;;     (nrepl-switch-to-repl-buffer t))
;;   )

(provide 'be-clojure)
