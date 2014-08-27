(require 'be-utils)

(be/util-eval-on-load ("hideshow-org" "ruby-mode")
  (add-to-list 'hs-special-modes-alist
               `(ruby-mode
                 ,(rx (or "def" "if" (and (*? anything) "do") "{" "[")) ;; Block start
                 ,(rx (or "}" "]" "end"))                  ;; Block end
                 ,(rx (or "#" "=begin"))                   ;; Comment start
                 ruby-forward-sexp nil)))


(be/util-eval-on-load ("hideshow-org" "enh-ruby-mode")
  (add-to-list 'hs-special-modes-alist
               `(enh-ruby-mode
                 ,(rx (or "def" "if" (and (*? anything) "do") "{" "[")) ;; Block start
                 ,(rx (or "}" "]" "end"))           ;; Block end
                 ,(rx (or "#" "=begin"))            ;; Comment start
                 enh-ruby-forward-sexp nil)))


(provide 'be-folding)
