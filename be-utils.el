(progn ;;ignore-errors
  (require 'em-glob)

  (defun be.utils/parent-dir (dir)
    "Returns the parent directory path of given directory path."
    (file-name-directory
     (directory-file-name dir)))

  (defun be.utils/locate-dominating-file (glob &optional start-dir)
    "Similar to the original one, although this one accepts globs.
     If start directory is not specified, starts in `default-directory`."
    (let* ((dir (or start-dir default-directory))
           (file-found (directory-files dir
                                        nil
                                        (eshell-glob-regexp glob))))
      (cond
       (file-found (concat dir (car file-found)))
       ((not (string= dir "/"))
        (be/locate-dominating-file glob
                                   (be.utils/parent-dir dir)))
       (t nil))))

  )

(provide 'be-utils)
