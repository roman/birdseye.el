(require 'be-utils)

(be/util-eval-on-load ("navorski" "be-terminal")
  (be/define-key global-map
    (kbd "M-]") 'nav/term
    (kbd "M-g") 'be/terminal-toggle-mode))

;; Not working T_T
(be/util-eval-on-load ("evil" "navorski" "be-terminal")
  (evil-define-key term-mode-map
    (kbd "<f7>e") be/terminal-evil-char-mode
    (kbd "<f7>n") be/terminal-evil-line-mode)

  (setq term-bind-key-alist
        (append term-bind-key-alist
                '(("<f7>e" . be/terminal-evil-char-mode)
                  ("<f7>n" . be/terminal-evil-line-mode)
                  ("M-g" . be/terminal-toggle-mode)))))

(be/util-eval-on-load ("evil" "be-haskell")
 (evil-define-key 'normal haskell-mode-map
    (kbd ",gi") 'be/haskell-switch-to-ghci
    (kbd ",rc") 'be/haskell-cabal-dev-configure
    (kbd ",at") 'be/haskell-add-type-signature
    (kbd ",fl") 'inferior-haskell-load-file
    (kbd ",fr") 'inferior-haskell-reload-file
    (kbd ",ef") 'inferior-haskell-send-decl
    (kbd ",.")  'inferior-haskell-find-definition
    (kbd ",ii") 'inferior-haskell-info
    (kbd ",it") 'inferior-haskell-type))

(be/util-eval-on-load ("iedit" "be-edit")
  (be/define-key global-map
    (kbd "<f4>o") 'be/occur-at-point
    (kbd "<f4>e") 'be/iedit-toggle))

(be/util-eval-on-load ("evil" "iedit" "be-edit")
  (evil-define-key 'normal global-map
    (kbd ",ma") 'be/iedit-toggle))

(be/util-eval-on-load "evil"
  (be/util-eval-on-mode emacs-lisp-mode
    (evil-define-key 'normal emacs-lisp-mode-map
      (kbd ",ep") 'be/elisp-eval-para)))

(be/util-eval-on-load ("evil")
  (be/define-key global-map
    (kbd "<f7>e") 'be/evil-emacs-state
    (kbd "<f7>n") 'be/evil-normal-state

    ;; aliases for Roman & Tavis
    (kbd "<f7>r") 'be/evil-normal-state
    (kbd "<f7>t") 'be/evil-emacs-state))



(provide 'be-keybindings)
