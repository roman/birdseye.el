(require 'be-utils)

(be/util-eval-on-load ("robe" "inf-ruby" "rvm")
  (defadvice inf-ruby-console-auto (before activate-rvm-for-robe activate)
    (rvm-activate-corresponding-ruby)))

(be/util-eval-on-mode "ruby-mode"
  (linum-mode 1))

(be/util-eval-on-mode "enh-ruby-mode"
  (linum-mode 1))

(be/util-eval-on-load "ruby-mode" "robe"
  (robe-mode 1))

(be/util-eval-on-mode "enh-ruby-mode" "robe"
  (robe-mode 1))


(provide 'be-ruby)
