(require 'be-utils)

(add-to-list 'load-path (expand-file-name "~/.cabal/share/ghc-mod-latest/"))

(be/util-eval-on-load ("auto-complete" "haskell-mode")

  (defconst be/haskell-reserved-keywords
    (sort
     (list "case" "class" "data" "default" "deriving" "do" "else" "if" "import" "in" "infix"
           "infixl" "infixr" "instance" "let" "module" "newtype" "of" "then" "type" "where" "as"
           "qualified" "hiding")
     #'(lambda (a b) (> (length a) (length b))))
    "Reserved keywords in Haskell.")

  (defconst be/haskell-defined-types
    (sort
     (list "Bool" "False" "True" "Char" "String" "IO" "IOError" "Maybe" "Just" "Nothing"
           "Either" "Right" "Left" "Ordering" "LT" "EQ" "GT" "Integer" "Int" "Ratio" "Float"
           "Double" "Complex")
     #'(lambda (a b) (> (length a) (length b))))
    "Defined types in Haskell.")

  (defconst be/haskell-defined-classes
    (sort
     (list "Eq" "==" "/=" "Ord" "compare" "max" "min" "<=" ">=" "ReadS" "ShowS" "Read"
           "read" "readsPrec" "readList" "showsPrec" "show" "showList" "Enum" "succ" "toEnum"
           "fromEnum" "enumFrom" "enumFromThen" "enumFromTo" "enumFromThenTo" "Functor" "fmap"
           "Monad" ">>=" ">>" "return" "fail" "Bounded" "minBound" "maxBound" "Num" "negate" "abs"
           "signum" "fromInteger" "Real" "toRational" "Integral" "quot" "rem" "div" "mod"
           "quotRem" "divMod" "toInteger" "Fractional" "recip" "fromRational" "Floating" "pi"
           "exp" "log" "sqrt" "**" "logBase" "sin" "cos" "tan" "asin" "acos" "atan" "sinh" "cosh"
           "tanh" "asinh" "acosh" "atanh" "RealFrac" "properFraction" "truncate" "ceiling" "floor"
           "RealFloat" "floatRadix" "floatDigits" "floatRange" "decodeFloat" "encodeFloat"
           "exponent" "significand" "scaleFloat" "isNan" "isInfinite" "isDenormalized"
           "isNegativeZero" "isIEEE" "atan2" "gcd" "lcm" "^^" "fromIntegral" "realtoFrac")
     #'(lambda (a b) (> (length a) (length b))))
    "Defined classes in Haskell.")

  (defconst be/haskell-prelude-functions
    (sort
     (list
      "not" "otherwise" "maybe" "either" "fst" "snd" "curry" "uncurry" "pred"
      "round" "subtract" "odd" "mapM" "mapM_" "sequence" "sequence_" "=<<" "id" "const"
      "flip" "until" "asTypeOf" "error" "undefined" "$!" "seq" "map" "++" "filter"
      "head" "last" "tail" "init" "null" "length" "!!" "reverse" "fold" "fold1" "foldr"
      "foldr1" "and" "or" "any" "all" "sum" "product" "concat" "concatMap" "maximum"
      "minimum" "scanl" "scanl1" "scanr" "scanr1" "iterate" "repeat" "replicate"
      "cycle" "take" "drop" "splitAt" "takeWhile" "dropWhile" "span" "break" "elem"
      "notElem" "lookup" "zip" "zip3" "zipWith" "zipWith3" "unzip" "unzip3" "lines"
      "words" "unlines" "unwords" "shows" "showChar" "showString" "showParen" "reads"
      "readParen" "lex" "putChar" "putStr" "putStrLn" "print" "getChar" "getLine"
      "getContents" "intract" "FilePath" "readFile" "writeFile" "appendFile" "readIO"
      "readLn" "IOException" "ioError" "userError" "catch")
     #'(lambda (a b) (> (length a) (length b))))
    "Defined classes in Haskell.")

  (defconst be/haskell-prelude-functions
    (sort
     (list ; "&&" "||"
      "not" "otherwise" "maybe" "either" "fst" "snd" "curry" "uncurry" "pred"
      "round" "subtract" "odd" "mapM" "mapM_" "sequence" "sequence_" "=<<" "id" "const"
      "flip" "until" "asTypeOf" "error" "undefined" "$!" "seq" "map" "++" "filter"
      "head" "last" "tail" "init" "null" "length" "!!" "reverse" "fold" "fold1" "foldr"
      "foldr1" "and" "or" "any" "all" "sum" "product" "concat" "concatMap" "maximum"
      "minimum" "scanl" "scanl1" "scanr" "scanr1" "iterate" "repeat" "replicate"
      "cycle" "take" "drop" "splitAt" "takeWhile" "dropWhile" "span" "break" "elem"
      "notElem" "lookup" "zip" "zip3" "zipWith" "zipWith3" "unzip" "unzip3" "lines"
      "words" "unlines" "unwords" "shows" "showChar" "showString" "showParen" "reads"
      "readParen" "lex" "putChar" "putStr" "putStrLn" "print" "getChar" "getLine"
      "getContents" "intract" "FilePath" "readFile" "writeFile" "appendFile" "readIO"
      "readLn" "IOException" "ioError" "userError" "catch")
     #'(lambda (a b) (> (length a) (length b))))
    "Defined functions in GHC Prelude.")

  (defconst be/haskell-ghc-pragmas
    (sort
     (list "LANGUAGE" "OPTIONS_GHC" "INCLUDE" "WARNING" "DEPRECATED" "INLINE" "NOINLINE"
           "LINE" "RULES" "SPECIALIZE" "UNPACK" "SOURCE")
     #'(lambda (a b) (> (length a) (length b))))
    "GHC pragmas.")

  (defconst be/haskell-ghc-options
    (list "OverlappingInstances" "IncoherentInstances" "UndecidableInstances" "Arrows"
          "ForeignFunctionInterface" "Generics" "ImplicitParams" "ImplicitPrelude"
          "MonomorphismRestriction" "MonoPatBinds" "RelaxedPolyRec" "ExtendedDefaultRules"
          "OverloadedStrings" "GADTs" "TypeFamilies" "ScopedTypeVariables" "TemplateHaskell"
          "QuasiQuotes" "BangPatterns" "CPP" "PatternGuards" "ViewPatterns" "UnicodeSyntax"
          "MagicHash" "NewQualifiedOperators" "PolymorphicComponents" "Rank2Types"
          "RankNTypes" "ImpredicativeTypes" "ExistentialQuantification" "KindSignatures"
          "EmptyDataDecls" "ParallelListComp" "TransformListComp" "UnliftedFFITypes"
          "LiberalTypeSynonyms" "TypeOperators" "RecursiveDo" "PArr" "RecordWildCards"
          "NamedFieldPuns" "DisambiguateRecordFields" "UnboxedTuples" "StandaloneDeriving"
          "DeriveDataTypeable" "GeneralizedNewtypeDeriving" "TypeSynonymInstances"
          "FlexibleContexts" "FlexibleInstances" "ConstrainedClassMethods"
          "MultiParamTypeClasses" "FunctionnalDependencies" "PackageImports")
    "GHC Options.")

  (defconst be/haskell-ghc-no-options
    (mapcar #'(lambda (n) (concat "No" n)) be/haskell-ghc-options)
    "GHC Options.")

  (defconst be/haskell-ghc-language-options
    (sort (append nil be/haskell-ghc-options be/haskell-ghc-no-options)
          #'(lambda (a b) (> (length a) (length b))))
    "GHC Language options.")

  (defconst be/ac-source-haskell
    '((candidates
       . (lambda ()
           (all-completions ac-target
                            (append nil
                                    be/haskell-defined-types
                                    be/haskell-defined-classes
                                    be/haskell-reserved-keywords
                                    be/haskell-prelude-functions
                                    be/haskell-ghc-modules
                                    be/haskell-ghc-pragmas
                                    be/haskell-ghc-language-options
                                    '("-fglasgow-exts")
                                    )))))
    "Sources for Haskell keywords.")

  (defun be/haskell-init-ac ()
    (interactive)
    (setq ac-sources
          '(ac-source-etags
            ac-source-ghc-mod
            ac-source-haskell
            ac-source-words-in-same-mode-buffers
            be/ac-source-haskell))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



(be/util-eval-on-load ("haskell-mode")

  (defun be/haskell-hspec-set-selector (selector)
    (interactive (list
                  (read-string (format "selector (%s): "
                                       (thing-at-point 'word))
                               nil 'buster-selector (thing-at-point 'word))))
    (let ((file  "~/.hspec_selector"))
      (with-temp-buffer
        (insert selector)
        (when (file-writable-p file))
        (write-region (point-min)
                      (point-max)
                      file))))

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  (defun be/haskell-align-equals ()
    (interactive)
    (align-regexp
     (region-beginning) (region-end)
     "\\(\\s-*\\) = " 1 0 nil))

  (defun be/haskell-ghci-load-and-test ()
    (interactive)
    (let ((command ":main"))
      (if t
          (progn
            (inferior-haskell-reload-file)
            (inferior-haskell-send-command (inferior-haskell-process) command))
        (save-window-excursion
          (inferior-haskell-load-and-run command)))))


  ;; Add Lang Pragmas/Options ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  (defun be/haskell-add-lang-option (option)
    (interactive (list
                  (ido-completing-read
                   "Which? "
                   be/haskell-ghc-language-options)))
    (save-excursion
      (beginning-of-buffer)
      (when (not (search-forward option nil t))
        (insert (format "{-# LANGUAGE %s #-}\n" option)))))


  ;; Add Import Statements ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  (defun be/haskell-ghc-insert-module ()
    (interactive)
    (if (not (executable-find ghc-hoogle-command))
        (message "\"%s\" not found" ghc-hoogle-command)
      (let* ((expr0 (ghc-things-at-point))
             (expr (ghc-read-expression expr0)))
        (let ((mods (ghc-function-to-modules expr)))
          (if (null mods)
              (message "No module guessed")
            (let* ((first (car mods))
                   (mod (if (= (length mods) 1)
                            first
                          (completing-read "Module name: " mods nil t first))))
              (be/haskell-add-import mod expr)))))))

  (defun be/haskell-find-module-import (mod)
    (interactive "sModule: ")
    (goto-char (point-min))
    (re-search-forward (format "^import +\\(qualified\\)? +%s +" mod) nil t))

  (defun be/haskell-add-import (mod expr)
    (interactive)
    (when (not (and (ignore-errors (inferior-haskell-get-module expr))
                    (progn
                      (beginning-of-buffer)
                      ;;TODO: fix this for multi-line imports
                      (re-search-forward (format "^import .*%s +*%s" mod expr) nil t))))
      (let ((existing-import (save-excursion
                               (be/haskell-find-module-import mod))))
        (if existing-import
            (progn
              (goto-char (match-beginning 0))
              (end-of-line)
              (backward-char 1)
              (up-list)
              (backward-char 1)
              (insert ", " expr))
          (progn
            (ghc-goto-module-position)
            (insert (format "import %s (%s)\n" mod expr)))))))

  (be/util-eval-on-load "em-glob"

    (defun be/haskell-find-cabal-dir ()
      "Returns the directory path where the *.cabal file is."
      (be/util-parent-dir (be/util-locate-dominating-file "*.cabal")))

    (defun be/haskell-find-cabal-sandbox-dir ()
      "Returns the directory path where the .cabal-sandbox folder is."
      (be/util-locate-dominating-file ".cabal-sandbox"))

    (defun be/haskell-find-cabal-dev-dir ()
      "Returns the directory path where the cabal-dev folder is."
      (let ((cabal-dir (be/haskell-find-cabal-dir))
            (cabal-dev-dir (be/util-locate-dominating-file "cabal-dev")))
        (while (and cabal-dir cabal-dev-dir
                    (or (not (string-equal cabal-dir cabal-dev-dir))
                        (not cabal-dev-dir)))
          (setq cabal-dev-dir (be/util-parent-dir cabal-dev-dir)))
        cabal-dev-dir))

    (defun be/haskell-find-cabal-sandbox-package-db ()
      (interactive)
      (let* ((cabal-sandbox-dirname (be/haskell-find-cabal-sandbox-dir))
             (package-db (and cabal-sandbox-dirname
                              (car
                               (directory-files
                                cabal-sandbox-dirname t (eshell-glob-regexp "*-packages.conf.d"))))))
        package-db))

    (defun be/haskell-switch-to-ghci (&optional no-reload)
      "Pops the ghci buffer, in case it is already there asks to reload it."
      (interactive)

      ;; restart ghci?
      (when (not no-reload)
        (let ((buffer (get-buffer "*haskell*")))
          (when (and buffer
                     (y-or-n-p "Do you want to reload ghci? "))
            (set-process-query-on-exit-flag (get-buffer-process buffer) nil)
            (kill-buffer buffer))))

      ;; setup "cabal-dev ghci" in case we are using cabal-dev
      ;; setup special ghci in case we are using cabal sandbox
      (let* ((cabal-dev-dir (be/haskell-find-cabal-dev-dir))
             (cabal-sandbox-dir (be/haskell-find-cabal-sandbox-dir))
             (default-directory (or cabal-sandbox-dir
                                    cabal-dev-dir
                                    default-directory))
             (haskell-program-name (or (and cabal-sandbox-dir
                                            (format "ghci \"-package-db\" \"%s\""
                                                    (be/haskell-find-cabal-sandbox-package-db)))
                                       (and cabal-dev-dir
                                            "cabal-dev \"ghci\"")
                                       haskell-program-name)))
        (switch-to-haskell)))

    (defun be/haskell-jump-to-cabal-file ()
      (interactive)
      (let* ((cabal-dir (be/haskell-find-cabal-dir))
             (cabal-file (car
                          (directory-files
                           cabal-dir nil
                           (eshell-glob-regexp "*.cabal")))))
        (find-file (concat cabal-dir cabal-file))))

    (defun be/haskell-cabal-dev-configure ()
      (interactive)
      (let ((cabal-dev-path (be/haskell-find-cabal-dev-dir)))
        (if (and cabal-dev-path
                 (executable-find "cabal-dev"))
            (let ((default-directory cabal-dev-path))
              (call-process-shell-command "cabal-dev configure --enable-tests" nil 0)
              (message "cabal-dev configure done"))
          (message "cabal-dev bin or directory wasn't found"))))

    (defun be/haskell-cabal-dev-reload-dependencies ()
      (interactive)
      (let ((cabal-dev-path (be/haskell-find-cabal-dev-dir)))
        (if (and cabal-dev-path
                 (executable-find "cabal-dev"))
            (let ((default-directory cabal-dev-path))
              (call-process-shell-command (concat "cabal-dev clean && "
                                                  "cabal-dev configure && "
                                                  "cabal-dev install -fdevelopment")
                                          nil
                                          0)
              (message "cabal-dev dependencies reloaded."))
          (message "cabal-dev bin or directory wasn't found"))))

    (defun be/haskell-cabal-dev-build ()
      (interactive)
      (let* ((cabal-dev-path (be/haskell-find-cabal-dev-dir))
             (default-directory (or cabal-dev-path default-directory)))
        (when (and cabal-dev-path
                   (executable-find "cabal-dev"))
          (compile "cabal-dev build"))))

    (defun be/haskell-goto-definition ()
      (interactive)
      (condition-case nil
          (inferior-haskell-find-definition (haskell-ident-at-point))
        (error
         (let ((cbuff (current-buffer)))
           (be/haskell-switch-to-ghci t)
           (end-of-buffer)
           (pop-to-buffer cbuff)))))

    (be/util-eval-on-load ("flycheck")
      (let ((package-db  (be/haskell-find-cabal-sandbox-package-db)))
        (when package-db
          (put 'haskell-ghc :flycheck-command
               (list "ghc" "-Wall" "-fno-code"
                     "-fhelpful-errors" "-isrc" (format "-package-db=%s" package-db)
                     'source-inplace))
          (let ((current-cmd (get 'haskell-hdevtools :flycheck-command)))
            (put 'haskell-hdevtools :flycheck-command
                 (append current-cmd (list "-g" "-isrc" "-g" (format "-package-db=%s" package-db)))))))))


  ;; HELM support for hoogle ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  (be/util-eval-on-load "helm"

    (defun be/helm-c-hoogle-set-candidates (&optional request-prefix)
      (let* ((pattern (or (and request-prefix
                               (concat request-prefix
                                       " " helm-pattern))
                          helm-pattern))
             (short-pattern
              (if (string-match "\\`\\([a-zA-Z_][a-zA-Z0-9_]*\\) " pattern)
                  (match-string 1 pattern)
                pattern))
             (lim helm-candidate-number-limit)
             (args (append (list "search" "-l")
                           (and nil lim (list "-n" (int-to-string lim)))
                           (list short-pattern))))
        (let (candidates)
          (with-temp-buffer
            (apply #'call-process "hoogle" nil t nil args)
            (goto-char (point-min))
            (while (not (eobp))
              (if (looking-at "\\([^ ]+\\) *\\([^ ]+\\) :: \\(.+?\\) * -- \\(.+\\)")
                  (push (cons (format
                               "%s %s :: %s"
                               (match-string 1)
                               (match-string 2)
                               (match-string 3))
                              (cons
                               (match-string-no-properties 1)
                               (match-string-no-properties 2)))
                        candidates))
              (forward-line 1)))
          (nreverse candidates))))

    (setq be/helm-c-source-hoogle
          '((name . "Hoogle")
            (candidates . be/helm-c-hoogle-set-candidates)
            (action . (("Add Import"
                        . (lambda (match)
                            (be/haskell-add-import
                             (car match)
                             (cdr match))))))
            (filtered-candidate-transformer . (lambda (candidates source)
                                                candidates))
            (volatile)
            (delayed)))

    (defun be/haskell-helm-hoogle ()
      (interactive)
      (let ((input (or (haskell-ident-at-point)
                       (and (symbol-at-point)
                            (symbol-name (symbol-at-point))))))
        (helm :sources 'be/helm-c-source-hoogle
              :input input
              :prompt "Hoogle: "
              :buffer "*Hoogle search*"))))

  (be/util-eval-on-load ("lineker")
    (make-local-variable 'lineker-column-limit)
    (setq lineker-column-limit 90))

  (progn
    (require 'lineker)
    (require 'inf-haskell)
    (require 'auto-complete)
    (require 'ghc)
    (require 'helm)
    (require 'flycheck)))

(be/util-eval-on-mode haskell-mode
  (setq lineker-column-limit 90)
  (setq inferior-haskell-find-project-root nil)
  (setq haskell-stylish-on-save t)
  (linum-mode 1)
  (flycheck-mode 1)
  (lineker-mode 1)
  (turn-on-haskell-indentation))


(provide 'be-haskell)
