(require 'be-utils)

(be/util-eval-on-load "projectile"
  (setq projectile-indexing-method 'find)
  (setq projectile-enable-caching t)
  (setq projectile-completion-system 'ido)
  (icomplete-mode 1))

(ignore-errors
  (projectile-global-mode))

(provide 'be-projectile)
