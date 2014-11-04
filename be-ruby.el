(require 'be-utils)

(be/util-eval-on-load ("robe" "inf-ruby" "rvm")
  (defadvice inf-ruby-console-auto (before activate-rvm-for-robe activate)
    (rvm-activate-corresponding-ruby)))

(defun be/ruby-mode-init-hook ()
  (setq ruby-insert-encoding-magic-comment nil)
  (linum-mode 1)
  (be/util-eval-on-load ("evil")
    ;; When using '*' or '#' search for symbols and
    ;; not words
    (setq evil-symbol-word-search t))
  (be/util-eval-on-load ("robe")
    (robe-mode 1))
  (be/util-eval-on-load ("hideshow-org")
    (hs-org/minor-mode 1)))

(be/util-eval-on-mode ruby-mode
  (be/ruby-mode-init-hook))

(be/util-eval-on-mode enh-ruby-mode
  (be/ruby-mode-init-hook))


(provide 'be-ruby)
