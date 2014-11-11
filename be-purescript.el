(require 'be-util)

(be/util-eval-on-mode purescript-mode
  (turn-on-purescript-indentation))

(defun be/purescript-start ()
  (interactive)
  (save-window-excursion
    (psci))
  (pop-to-buffer "*psci*"))

(defun be/purescript-load ()
  (interactive)
  (save-window-excursion
    (psci/load-module!))
  (pop-to-buffer "*psci*"))

(defun be/purescript-reload ()
  (interactive)
  (save-window-excursion
    (psci/reset!)
    (psci/load-module!))
 (pop-to-buffer "*psci*"))


(provide 'be-purescript)
