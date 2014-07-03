(require 'be-utils)

;; Default folder for ephemeral content
(defvar be-ephemeral-dir "~/.emacs.ephemeral/")

;; Keep all backup files in ephemeral
(defvar user-temporary-file-directory (concat be-ephemeral-dir "tmp/"))
(make-directory user-temporary-file-directory t)
(setq backup-by-copying t)
(setq backup-directory-alist `(("." . ,user-temporary-file-directory)))

;; When having windows with repeated filenames, uniquify them
;; by the folder they are in rather those annoying <2>,<3>,.. etc
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)
; don't screw special buffers
(setq uniquify-ignore-buffers-re "^\\*")

;; Use ido-mode in all instances
(setq ido-everywhere t)

;; Better IDO Support
(be/util-eval-on-load "flx-ido"
  (ido-mode 1)
  (ido-everywhere 1)
  (flx-ido-mode 1)
  (setq gc-cons-threshold 20000000))

(provide 'be-basics)
