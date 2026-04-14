; Local compatibility query for old kulala_http parser builds.
; Keep only node types that exist in parser metadata v0.1.6.

(request_separator) @keyword

(method) @function.method

(header_entity) @constant

(identifier) @variable
(variable) @variable

(value) @string

(variable_declaration
  "@" @character.special)
(variable_declaration_inline
  "@" @character.special)

(variable_declaration
  "=" @operator)
(variable_declaration_inline
  "=" @operator)

(metadata) @keyword

(http_version) @string.special

(status_code) @number
(status_text) @string

(external_body
  path: (_) @external_body_path)

(res_redirect
  path: (_) @redirect_path)

(pre_request_script
  (path) @number.special.path)
(res_handler_script
  (path) @number.special.path)

[
  (comment)
  (request_separator)
] @comment @spell
