;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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

(put 'be/util-eval-on-load 'lisp-indent-function 'defun)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun be/util-parent-dir (dir)
  "Returns the parent directory path of given directory path."
  (file-name-directory
   (directory-file-name dir)))

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
