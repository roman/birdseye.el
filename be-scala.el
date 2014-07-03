(require 'be-utils)

(be/util-eval-on-load ("scala-mode2")
  ;; compilation-skip-threshold tells the compilation minor-mode
  ;; which type of compiler output can be skipped. 1 = skip info
  ;; 2 = skip info and warnings.
  (setq compilation-skip-threshold 1)

  (defun be/sbt-root-directory (path)
    (be/util-parent-dir
       (be/util-locate-dominating-file "*.sbt" path)))

  (nav/defterminal scala-sbt-runner
    :buffer-name "sbt-runner"
    :program-path "/usr/local/bin/sbt"
    :program-args "~ run"
    :modify-default-directory be/sbt-root-directory)

  (nav/defterminal scala-sbt-tester
    :buffer-name "sbt-tester"
    :program-path "/usr/local/bin/sbt"
    :program-args "~ test"
    :modify-default-directory be/sbt-root-directory)

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

  (defun be/init-scala-repl ()
    (interactive)
    (be/sbt-command "console"))

  (defun be/init-sbt-runner ()
    (interactive)
    (nav/pop-to-buffer scala-sbt-runner))

  (defun be/init-sbt-tester ()
    (interactive)
    (nav/pop-to-buffer scala-sbt-tester))

  (defun be/scala-repl-load-file ()
    (interactive)
    (let ((file-contents
           (s-join "\n"
                   (--filter (not (s-matches? "^package" it))
                             (s-lines (buffer-string))))))
      (be/sbt-command
       (concat ":paste\n" file-contents "\n" (kbd "C-D"))))))

(provide 'be-scala)
