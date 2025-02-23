(package_clause "package" @include)

(package_identifier) @variable

(import_declaration "import" @include)

[
  "!"
  "*"
  "|"
  "&"
  "||"
  "&&"
  "=="
  "!="
  "<"
  "<="
  ">"
  ">="
  "=~"
  "!~"
  "+"
  "-"
  "*"
  "/"
] @operator

(unary_expression "*" @operator.default)

(unary_expression "=~" @operator.regexp)

(unary_expression "!~" @operator.regexp)

(binary_expression _ "&" @operator.unify _)

(binary_expression _ "|" @operator.disjunct _)

(builtin) @function.builtin

(qualified_identifier) @function.builtin

(let_clause "let" @keyword)

(for_clause "for" @repeat)
(for_clause "in" @repeat)

(guard_clause "if" @conditional)

(comment) @comment

[
  (string_type)
  (simple_string_lit)
  (multiline_string_lit)
] @string

[
  (number_type)
  (int_lit)
  (int_type)
  (uint_type)
  (float_lit)
  (float_type)
] @number

[
  (bool_type)
  (true)
  (false)
] @boolean

(null) @constant.builtin

(ellipsis) @punctuation.special

[
  ","
  ":"
] @punctuation.delimiter

[
  "("
  ")"
  "["
  "]"
  "{"
  "}"
] @punctuation.bracket

(interpolation "\\(" @punctuation.special (_) ")" @punctuation.special) @none

(field (label (identifier) @field))

(
  (identifier) @definition
  (#match? @definition "^#")
)

(field (label alias: (identifier) @label))

(let_clause left: (identifier) @label)


(attribute (identifier) @attribute)
