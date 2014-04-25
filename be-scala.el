(require 'be-utils)

(be/util-eval-on-load ("scala-mode2")
  ;; compilation-skip-threshold tells the compilation minor-mode
  ;; which type of compiler output can be skipped. 1 = skip info
  ;; 2 = skip info and warnings.
  (setq compilation-skip-threshold 1)

  (defun be/sbt-start ()
    (interactive)
    (sbt:run-sbt t nil)
    (pop-to-buffer (sbt:buffer-name)))

  (defun be/sbt-command (command)
    (unless command (error "Please specify a command"))

    (when (not (comint-check-proc (sbt:buffer-name)))
      (sbt:run-sbt))

    (when sbt:save-some-buffers
      (save-some-buffers nil (sbt:buffer-in-project-function (sbt:find-root))))

    (with-current-buffer (sbt:buffer-name)
      (display-buffer (current-buffer))
      (comint-send-string (current-buffer) (concat command "\n"))
      (setq sbt:previous-command command)))

  (defun be/sbt-run-tests ()
    (interactive)
    (be/sbt-command "test:compile"))

  (defun be/sbt-init
    (interactive)
    (be/sbt-start))

  (defun be/sbt-init-scala-repl ()
    (interactive)
    (be/sbt-command "console"))

  (defun be/sbt-stop-scala-repl ()
    (interactive)
    (be/sbt-command ":q"))

  (defun be/scala-repl-load-file ()
    (interactive)
    (let ((file-name (buffer-file-name)))
      (be/sbt-command (concat ":load " file-name)))))

(provide 'be-scala)
