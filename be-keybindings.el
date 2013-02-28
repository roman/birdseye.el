(require 'be-utils)

(be/util-eval-on-load "navorski"
  (define-key global-map
    (kbd "M-]") 'nav/term))

;; TODO: Tavis, how to do this?
(be/util-eval-on-load ("evil" "navorski" "be-terminal")
  (evil-define-key 'normal term-mode-map
    (kbd "<f7>e") 'be/term-evil-char-mode)
  (evil-define-key 'emacs term-mode-map
    (kbd "<f7>n") 'be/term-evil-line-mode))

(be/util-eval-on-load ("evil" "haskell-mode" "be-haskell")
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

(provide 'be-keybindings)
