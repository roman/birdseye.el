(require 'be-utils)

(be/util-eval-on-load ("robe" "inf-ruby" "rvm")
  (defadvice inf-ruby-console-auto (before activate-rvm-for-robe activate)
    (rvm-activate-corresponding-ruby)))

(be/util-eval-on-mode ruby-mode
  (setq ruby-insert-encoding-magic-comment nil)
  (linum-mode 1)
  (be/util-eval-on-load ("robe")
    (robe-mode 1))
  (be/util-eval-on-load ("hideshow-org")
    (hs-org/minor-mode 1)))

(be/util-eval-on-mode enh-ruby-mode
  (setq ruby-insert-encoding-magic-comment nil)
  (linum-mode 1)
  (be/util-eval-on-load ("robe")
    (robe-mode 1))
  (be/util-eval-on-load ("hideshow-org")
    (hs-org/minor-mode 1)))


(provide 'be-ruby)
