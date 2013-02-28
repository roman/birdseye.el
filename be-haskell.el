(progn ;; ignore-errors
  (require 'be-utils)
  (require 'haskell-mode)

  (defun be/haskell-switch-to-ghci ()
    "Pops the ghci buffer, in case it is already there asks to reload it."
    (interactive)
    (let ((buffer (get-buffer "*haskell*")))
      (when (and buffer
                 (y-or-n-p "Do you want to reload ghci? "))
        (process-kill-without-query (get-buffer-process buffer))
        (kill-buffer buffer)))
    (switch-to-haskell))

  (defun be/haskell-cabal-dir ()
    "Returns the directory path where the *.cabal file is."
    (be/util-locate-dominating-file "*.cabal"))

  (defun be/haskell-cabal-dev-dir ()
    "Returns the directory path where the cabal-dev folder is."
    (be/util-locate-dominating-file "cabal-dev"))

  (defun be/haskell-cabal-dev-configure ()
    (interactive)
    (let ((cabal-dev-path (be/haskell-cabal-dev-dir)))
      (if (and cabal-dev-path
               (executable-find "cabal-dev"))
          (call-process-shell-command "cabal-dev configure" nil 0)
        (message "cabal-dev bin or directory wasn't found"))))

  (defun be/haskell-add-type-signature ()
    (interactive)
    (save-excursion
      (condition-case nil
          (progn
            (beginning-of-line)
            (let ((type (inferior-haskell-get-result
                         (concat ":type " (haskell-ident-at-point)))))
              (insert type)
              (insert "\n")))
        (error (message "couldn't insert type from ghci")))))

  )

;; Evil keybindings ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(ignore-errors
  (require 'evil)
  (require 'haskell-mode)
  (evil-define-key 'normal haskell-mode-map
    (kbd ",gi") 'be/haskell-switch-to-ghci
    (kbd ",rc") 'be/haskell-cabal-dev-configure
    (kbd ",at") 'be/haskell-add-type-signature
    (kbd ",fl") 'inferior-haskell-load-file
    (kbd ",fr") 'inferior-haskell-reload-file
    (kbd ",ef") 'inferior-haskell-send-decl
    (kbd ",.")  'inferior-haskell-find-definition
    (kbd ",ii") 'inferior-haskell-info
    (kbd ",it") 'inferior-haskell-type)
  )

(provide 'be-haskell)
