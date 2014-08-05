(require 'be-utils)

(be/define-key global-map
  (kbd "<f5>") 'undo
  (kbd "<f4>m") 'mark-sexp
  (kbd "<f4>e") 'iedit-mode
  (kbd "<f4>d") 'eval-defun)

(be/util-eval-on-load "be-elisp"
  (be/define-key emacs-lisp-mode-map
    (kbd "M-.") 'be/elisp-find-function-at-point)
  (be/util-eval-on-load ("evil")
    (evil-define-key 'normal emacs-lisp-mode-map
      (kbd "M-.") 'be/elisp-find-function-at-point)))

(be/util-eval-on-load ("navorski" "be-terminal")
  (be/define-key global-map
    (kbd "M-]") 'nav/term
    (kbd "M-g") 'be/terminal-toggle-mode))

(be/util-eval-on-load ("evil" "navorski" "be-terminal")
  (be/define-key term-mode-map
    (kbd "<f7>e") 'be/terminal-evil-char-mode
    (kbd "<f7>n") 'be/terminal-evil-line-mode)

  (setq term-bind-key-alist
        (append term-bind-key-alist
                '(("<f7>e" . be/terminal-evil-char-mode)
                  ("<f7>n" . be/terminal-evil-line-mode)
                  ("M-g" . be/terminal-toggle-mode)))))

(be/util-eval-on-load ("haskell-mode" "be-haskell")
  (be/define-key haskell-mode-map
    (kbd "M-.") 'be/haskell-goto-definition
    (kbd "C-M-t") 'be/haskell-add-type-signature
    (kbd "C-c =") 'be/haskell-align-equals
    (kbd "M-=") 'haskell-indent-align-guards-and-rhs))

(be/util-eval-on-load ("evil" "haskell-mode" "be-haskell" "em-glob")
 (evil-define-key 'normal haskell-mode-map
    (kbd "M-.")  'be/haskell-goto-definition
    (kbd ",gi") 'be/haskell-switch-to-ghci
    (kbd ",at") 'be/haskell-add-type-signature
    (kbd ",ap") 'be/haskell-add-lang-option
    (kbd ",fl") 'inferior-haskell-load-file
    (kbd ",fr") 'inferior-haskell-reload-file
    (kbd ",ef") 'inferior-haskell-send-decl
    (kbd ",.")  'inferior-haskell-find-definition
    (kbd ",ii") 'inferior-haskell-info
    (kbd ",it") 'inferior-haskell-type
    (kbd "<f4>j") 'be/haskell-jump-to-cabal-file))

(be/util-eval-on-load ("evil" "flycheck")
  (evil-define-key 'normal global-map
    (kbd ",cn") 'flycheck-next-error
    (kbd ",cf") 'flycheck-first-error
    (kbd ",cc") 'flycheck-compile
    (kbd ",cl") 'flycheck-list-errors))

(be/util-eval-on-load ("evil" "projectile")
  (evil-define-key 'normal global-map
    (kbd ",pf") 'projectile-find-file
    (kbd ",pg") 'projectile-grep
    (kbd ",pd") 'projectile-find-dir
    (kbd ",pr") 'projectile-replace
    (kbd ",po") 'projectile-multi-occur
    (kbd ",pk") 'projectile-kill-buffers
    (kbd ",pb") 'projectile-switch-to-buffer
    (kbd ",pv") 'projectile-recentf
    (kbd ",ps") 'projectile-switch-project))

(be/util-eval-on-load ("evil" "ace-jump-mode")
  (evil-define-key 'normal global-map
    (kbd "SPC") 'ace-jump-char-mode
    (kbd "C-SPC") 'ace-jump-line-mode
    (kbd ",z") 'ace-jump-word-mode))

(be/util-eval-on-load ("evil" "haskell-mode" "be-haskell" "helm")
  (evil-define-key 'normal haskell-mode-map
    (kbd ",ai") 'be/haskell-helm-hoogle))

(be/util-eval-on-load ("iedit" "be-edit")
  (be/define-key global-map
    (kbd "<f4>o") 'be/occur-at-point
    (kbd "<f4>e") 'be/iedit-toggle))

(be/util-eval-on-load ("evil" "iedit" "be-edit")
  (evil-define-key 'normal global-map
    (kbd ",,") 'be/iedit-toggle))

(be/util-eval-on-load ("evil")
  (evil-define-key 'visual global-map
    (kbd ",n") 'narrow-to-region)
  (evil-define-key 'normal global-map
    (kbd ",vs") 'magit-status
    (kbd ",w")  'widen)

  (be/define-key global-map
    (kbd "<f7>e") 'be/evil-emacs-state
    (kbd "<f7>n") 'be/evil-normal-state

    ;; aliases for Roman & Tavis
    (kbd "<f7>r") 'be/evil-normal-state
    (kbd "<f7>t") 'be/evil-emacs-state))

(be/util-eval-on-load ("org")
  (be/define-key global-map
    (kbd "<f8>-") 'org-clock-goto
    (kbd "<f8>l") 'org-clock-in-last))

(be/util-eval-on-load ("evil" "org")
  (evil-define-key 'normal org-mode-map
    (kbd "M-k") 'org-move-subtree-up
    (kbd "M-j") 'org-move-subtree-down))

(be/util-eval-on-load ("evil" "be-clojure" "clojure-mode" "nrepl")
  (evil-define-key 'normal clojure-mode-map
    (kbd ",gi") 'nrepl-jack-in
    (kbd ",gq") 'nrepl-quit
    (kbd ",fl") 'be/clojure-load-current-buffer))

(be/util-eval-on-load ("evil" "be-scala" "scala-mode2")
  (evil-define-key 'normal scala-mode-map
    (kbd ",gi") 'be/init-scala-repl
    (kbd ",rr") 'be/init-sbt-runner
    (kbd ",rt") 'be/init-sbt-tester
    (kbd ",fl") 'be/scala-repl-load-file
    (kbd ",fr") 'be/scala-repl-load-file
    (kbd "M-.") 'sbt-find-definitions))

(be/util-eval-on-load ("evil" "be-scala" "sbt-mode")
  (evil-define-key 'emacs sbt-mode-map
    (kbd "C-a") 'comint-bol
    (kbd "M-RET") 'comint-accumulate))

(be/util-eval-on-load ("cider")
  (evil-define-key 'normal clojure-mode-map
    (kbd ",gi") 'cider-jack-in
    (kbd "M-.") 'cider-jump))

(provide 'be-keybindings)
