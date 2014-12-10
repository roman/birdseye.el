(require 'be-utils)

(be/util-eval-on-mode sql-mode
  (sql-highlight-mysql-keywords))

(provide 'be-sql)
