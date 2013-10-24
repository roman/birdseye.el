(defun be/buster-set-selector (selector)
  (interactive (list
                (read-string (format "selector (%s): "
                                     (thing-at-point 'word))
                             nil 'buster-selector (thing-at-point 'word))))
  (let ((file  "~/.buster_selector"))
    (with-temp-buffer
      (insert selector)
      (when (file-writable-p file))
      (write-region (point-min)
                    (point-max)
                    file))))

(provide 'be-buster)
