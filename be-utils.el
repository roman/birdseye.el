(require 'dash)

(defun be/flash-region (beg end)
  (interactive "r")
  (let ((ovl (make-overlay beg end))
        (was-mark-active mark-active)
        (hl-line-mode-on hl-line-mode))
    (setq mark-active nil)
    (overlay-put ovl 'face 'highlight)
    (run-with-timer 0.5 nil
                    (lambda (ovl was-mark-active)
                      (delete-overlay ovl)
                      (setq mark-active was-mark-active))
                    ovl was-mark-active)))

(defun be/indent-region (beg end)
  "Shamelessly stolen from evil-mode, Indent text."
  (interactive "r")
  (if (and (= beg (line-beginning-position))
           (= end (line-beginning-position 2)))
      ;; since some Emacs modes can only indent one line at a time,
      ;; implement "==" as a call to `indent-according-to-mode'
      (indent-according-to-mode)
    (goto-char beg)
    (indent-region beg end))
  (back-to-indentation))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defmacro be/define-key (keymap &rest keybindings)
  `(progn
     ,@(-map (lambda (it)
               `(define-key ,keymap ,@it))
             (-partition 2 keybindings))))

(put 'be/define-key 'lisp-indent-function 'defun)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Dependency Management

(defun -be/util-eval-on-load (file-paths body)
  (if (car file-paths)
      `(eval-after-load ,(car file-paths)
         ',(-be/util-eval-on-load (cdr file-paths) body))
    `(progn
       ,@body)))

(defmacro be/util-eval-on-load (file-paths &rest body)
  (if (listp file-paths)
      (-be/util-eval-on-load file-paths body)
    (-be/util-eval-on-load (list file-paths) body)))

(defmacro be/util-eval-on-mode (mode-name &rest body)
  (let ((callback-name (intern (format "be/%s-%s-hook"
                                       mode-name
                                       (or (and
                                            load-file-name
                                            (file-name-nondirectory load-file-name))
                                           ""))))
        (mode-hook (intern (format "%s-hook" mode-name))))
    `(progn
       (defun ,callback-name ()
           (interactive)
           ,@body)
       (add-hook ',mode-hook
                 ',callback-name
                 t))))

(put 'be/util-eval-on-load 'lisp-indent-function 'defun)
(put 'be/util-eval-on-mode 'lisp-indent-function 'defun)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; File Navigation

(defun be/util-parent-dir (dir)
  "Returns the parent directory path of given directory path."
  (if (or (not dir)
          (string-equal dir "/"))
      nil
    (file-name-directory
     (directory-file-name dir))))

(be/util-eval-on-load "em-glob"
  (defun be/util-locate-dominating-file (glob &optional start-dir)
    "Similar to the original one, although this one accepts globs.
     If start directory is not specified, starts in `default-directory`."
    (let* ((dir (or start-dir default-directory))
           (file-found (directory-files dir
                                        nil
                                        (eshell-glob-regexp glob))))
      (cond
       (file-found (concat dir (car file-found)))
       ((not (string= dir "/"))
        (be/util-locate-dominating-file glob
                                        (be/util-parent-dir dir)))
       (t nil)))))


(provide 'be-utils)
