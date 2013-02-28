(progn ;;ignore-errors
  (require 'evil)

  (defun be/evil-toggle-to-normal-state-p (buffer)
    (interactive "b")
    (with-current-buffer buffer
      (and (evil-emacs-state-p)
           (not (equal (evil-initial-state-for-buffer)
                       evil-state)))))

  (defun be/evil-normal-state ()
    (interactive)

    (setq evil-default-state 'normal)
    (evil-set-initial-state 'term-mode 'emacs)
    (evil-set-initial-state 'magit-mode 'motion)
    (evil-set-initial-state 'dvc-status-mode 'motion)
    (evil-set-initial-state 'dvc-diff-mode 'motion)
    (evil-set-initial-state 'diff-mode 'motion)
    (evil-set-initial-state 'org-mode 'normal)

    (dolist (buffer (buffer-list))
      (when (not (let ((case-fold-search nil))
                   (string-match "Minibuf" (buffer-name buffer))))
        (with-current-buffer buffer
          (cond
           ((be/evil-toggle-to-normal-state-p buffer)
            (evil-normal-state)))))))

  (defun be/evil-emacs-state ()
    (interactive)

    (setq evil-default-state 'emacs)
    (evil-set-initial-state 'term-mode 'emacs)
    (evil-set-initial-state 'org-mode 'emacs)

    (dolist (buffer (buffer-list))
      (with-current-buffer buffer
        (cond
         ((not (evil-emacs-state-p)) (evil-emacs-state))))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  (define-key global-map
    (kbd "<f7>e") 'be/evil-emacs-state)
  (define-key global-map
    (kbd "<f7>n") 'be/evil-normal-state)

  ;; aliases for Roman & Tavis
  (define-key global-map
    (kbd "<f7>r") 'be/evil-normal-state)
  (define-key global-map
    (kbd "<f7>t") 'be/evil-emacs-state)
  )

(provide 'be-evil)
