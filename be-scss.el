(require 'be-utils)

(be/util-eval-on-load ("scss-mode")
  (setq scss-compile-at-save nil))

(provide 'be-scss)
