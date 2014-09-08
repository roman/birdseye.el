(require 'be-utils)

(be/util-eval-on-mode "org-mode"
  (flyspell-mode 1))

(provide 'be-org)
