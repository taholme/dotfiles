; extends

(string
  (string_content) @injection.content
  (#match? @injection.content "^.*FROM|ALTER|SELECT|CREATE|UPDATE|DELETE|INSERT|WITH.*$")
  (#set! injection.language "sql"))
