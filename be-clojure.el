(add-to-list 'auto-mode-alist '("[.]cljs$" . clojure-mode))
(require 'be-utils)

(be/util-eval-on-load "rainbow-delimiters"
  (set-face-background 'rainbow-delimiters-unmatched-face "red")
  (set-face-foreground 'rainbow-delimiters-depth-1-face "#E52020")
  (set-face-foreground 'rainbow-delimiters-depth-2-face "#68A8FF")
  (set-face-foreground 'rainbow-delimiters-depth-3-face "#FA2473")
  (set-face-foreground 'rainbow-delimiters-depth-4-face "#A6E12B")
  (set-face-foreground 'rainbow-delimiters-depth-5-face "#FB951D")
  (set-face-foreground 'rainbow-delimiters-depth-6-face "#FF3040")
  (set-face-foreground 'rainbow-delimiters-depth-7-face "#0040FF")
  (set-face-foreground 'rainbow-delimiters-depth-8-face "#A000FF")
  (set-face-foreground 'rainbow-delimiters-depth-9-face "#00FF80"))

(be/util-eval-on-mode "clojure-mode"
  (setq lineker-column-limit 90)
  (setq clojure-test-ns-segment-position 1)
  (lineker-mode 1)
  (linum-mode 1)
  (paredit-mode 1)
  (evil-paredit-mode 1)
  (rainbow-delimiters-mode 1))

(be/util-eval-on-load ("clojure-mode" "cider")

  (cider-turn-on-eldoc-mode)
  (cider-repl-toggle-pretty-printing)

  (setq prefer-local-resources t)

  (setq nrepl-buffer-name-show-port t)
  (setq nrepl-hide-special-buffers t)

  (setq cider-show-error-buffer 'only-in-repl)
  (setq cider-stacktrace-default-filters '(tooling dup))
  (setq cider-stacktrace-fill-column 80)
  (setq cider-repl-print-length 100)
  (setq cider-repl-use-clojure-font-lock t)
  (setq cider-repl-history-size 5000)
  (setq cider-repl-history-file (concat be-ephemeral-dir "cider-history"))
  )

(be/util-eval-on-mode "cider-repl-mode"
  (paredit-mode 1)
  (evil-paredit-mode 1)
  (rainbow-delimiters-mode 1))

(provide 'be-clojure)
