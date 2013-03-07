(require 'be-utils)

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

(be/util-eval-on-mode haskell-mode

  (defun be/haskell-cabal-dir ()
    "Returns the directory path where the *.cabal file is."
    (be/util-parent-dir (be/util-locate-dominating-file "*.cabal")))

  (defun be/haskell-cabal-dev-dir ()
    "Returns the directory path where the cabal-dev folder is."
    (let ((cabal-dir (be/haskell-cabal-dir))
          (cabal-dev-dir (be/util-locate-dominating-file "cabal-dev")))
      (while (or (not (string-equal cabal-dir cabal-dev-dir))
                 (not cabal-dev-dir))
        (setq cabal-dev-dir (be/util-parent-dir cabal-dev-dir)))
      cabal-dev-dir))


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
    (let* ((cabal-dev-dir (be/haskell-cabal-dev-dir))
           (default-directory (or cabal-dev-dir default-directory))
           (haskell-program-name (or (and cabal-dev-dir
                                          "cabal-dev ghci")
                                     haskell-program-name)))
      (switch-to-haskell)))

  (defun be/haskell-cabal-dev-configure ()
    (interactive)
    (let ((cabal-dev-path (be/haskell-cabal-dev-dir)))
      (if (and cabal-dev-path
               (executable-find "cabal-dev"))
          (let ((default-directory cabal-dev-path))
            (call-process-shell-command "cabal-dev configure --enable-tests" nil 0)
            (message "cabal-dev configure done"))
        (message "cabal-dev bin or directory wasn't found"))))

  (defun be/haskell-cabal-dev-reload-dependencies ()
    (interactive)
    (let ((cabal-dev-path (be/haskell-cabal-dev-dir)))
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
    (let* ((cabal-dev-path (be/haskell-cabal-dev-dir))
           (default-directory (or cabal-dev-path default-directory)))
      (when (and cabal-dev-path
                 (executable-find "cabal-dev"))
        (compile "cabal-dev build"))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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

  (defun be/haskell-goto-definition ()
    (interactive)
    (condition-case nil
        (inferior-haskell-find-definition (haskell-ident-at-point))
      (error
       (let ((cbuff (current-buffer)))
         (be/haskell-switch-to-ghci t)
         (call-interactively (end-of-buffer))
         (pop-to-buffer cbuff)))))

  (defun be/haskell-align-equals ()
    (interactive)
    (align-regexp
     (region-beginning) (region-end)
     "\\(\\s-*\\) = " 1 0 nil))

  (setq inferior-haskell-find-project-root nil)
  (ghc-init)
  (linum-mode 1)
  (flymake-mode 1)
  (haskell-indent-mode)
  (require 'auto-complete)

  )

(provide 'be-haskell)
