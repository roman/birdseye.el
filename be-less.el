(require 'be-utils)

(be/util-eval-on-mode "be-less" "less-css-mode"
  (message "EVAL ON MODE LESS")

  (be/util-eval-on-load "pulse"
    (message "LOADING LESS PULSE")
    (pulse/less-css-mode-hook))

  (be/util-eval-on-load "flymake-easy"
    (message "LOADING LESS FLYMAKE")
    (require 'flymake-less)
    (flymake-less-load))

)

(provide 'be-less)
