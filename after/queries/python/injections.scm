; extends

; SQL autodetection - strings starting with common SQL keywords
; Supports both regular strings and f-strings

((string (string_content) @injection.content)
  (#lua-match? @injection.content "^%s*SELECT")
  (#set! injection.language "sql"))

((string (string_content) @injection.content)
  (#lua-match? @injection.content "^%s*INSERT")
  (#set! injection.language "sql"))

((string (string_content) @injection.content)
  (#lua-match? @injection.content "^%s*UPDATE")
  (#set! injection.language "sql"))

((string (string_content) @injection.content)
  (#lua-match? @injection.content "^%s*DELETE")
  (#set! injection.language "sql"))

((string (string_content) @injection.content)
  (#lua-match? @injection.content "^%s*CREATE")
  (#set! injection.language "sql"))

((string (string_content) @injection.content)
  (#lua-match? @injection.content "^%s*ALTER")
  (#set! injection.language "sql"))

((string (string_content) @injection.content)
  (#lua-match? @injection.content "^%s*DROP")
  (#set! injection.language "sql"))

((string (string_content) @injection.content)
  (#lua-match? @injection.content "^%s*WITH")
  (#set! injection.language "sql"))

; Cypher autodetection - strings starting with common Cypher keywords
; Also matches strings starting with // comments followed by keywords
((string (string_content) @injection.content)
  (#lua-match? @injection.content "^%s*//")
  (#set! injection.language "cypher"))

((string (string_content) @injection.content)
  (#lua-match? @injection.content "^%s*MATCH")
  (#set! injection.language "cypher"))

((string (string_content) @injection.content)
  (#lua-match? @injection.content "^%s*CREATE")
  (#set! injection.language "cypher"))

((string (string_content) @injection.content)
  (#lua-match? @injection.content "^%s*MERGE")
  (#set! injection.language "cypher"))

((string (string_content) @injection.content)
  (#lua-match? @injection.content "^%s*OPTIONAL MATCH")
  (#set! injection.language "cypher"))

((string (string_content) @injection.content)
  (#lua-match? @injection.content "^%s*CALL")
  (#set! injection.language "cypher"))

((string (string_content) @injection.content)
  (#lua-match? @injection.content "^%s*UNWIND")
  (#set! injection.language "cypher"))
