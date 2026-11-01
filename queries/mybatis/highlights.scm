; XML declaration, processing instructions, and document type declarations
(XMLDecl) @keyword.directive

(PI) @embedded

(doctypedecl
  "!DOCTYPE" @keyword.directive.define
  (Name) @type
  (ExternalID
    (PubidLiteral) @string.special
    (SystemLiteral
      (URI) @string.special.url)))

[
  "PUBLIC"
  "SYSTEM"
] @keyword

[
  (STag
    (Name) @tag)
  (ETag
    (Name) @tag)
  (EmptyElemTag
    (Name) @tag)
  (MapperSTag
    (Name) @tag)
  (MapperETag
    (Name) @tag)
  (SqlMapSTag
    (Name) @tag)
  (SqlMapETag
    (Name) @tag)
  (SelElem
    (Name) @tag)
  (InsElem
    (Name) @tag)
  (UpdElem
    (Name) @tag)
  (DelElem
    (Name) @tag)
  (ProcElem
    (Name) @tag)
  (StmtElem
    (Name) @tag)
  (SelKeyElem
    (Name) @tag)
  (SqlElem
    (Name) @tag)
  (IncludeElem
    (Name) @tag)
  (IfElem
    (Name) @tag)
  (ChooseElem
    (Name) @tag)
  (WhenElem
    (Name) @tag)
  (OtherwiseElem
    (Name) @tag)
  (TrimElem
    (Name) @tag)
  (WhereElem
    (Name) @tag)
  (SetElem
    (Name) @tag)
  (ForeachElem
    (Name) @tag)
  (BindElem
    (Name) @tag)
  (DynamicSqlElem
    (Name) @tag)
  (IterateElem
    (Name) @tag)
  (IsNotEmptyElem
    (Name) @tag)
  (IsEmptyElem
    (Name) @tag)
  (IsEqualElem
    (Name) @tag)
  (IsNotEqualElem
    (Name) @tag)
  (IsGreaterThanElem
    (Name) @tag)
  (IsGreaterEqualElem
    (Name) @tag)
  (IsLessThanElem
    (Name) @tag)
  (IsLessEqualElem
    (Name) @tag)
  (IsNotNullElem
    (Name) @tag)
  (IsNullElem
    (Name) @tag)
  (IsPropertyAvailableElem
    (Name) @tag)
  (IsNotPropertyAvailableElem
    (Name) @tag)
  (IsParameterPresentElem
    (Name) @tag)
  (IsNotParameterPresentElem
    (Name) @tag)
]

; XML and MyBatis tag delimiters are anonymous tokens. SQL operator captures
; below are more specific and override the shared '<' and '>' characters.
(_
  "<" @tag.delimiter)

(_
  "</" @tag.delimiter)

(_
  ">" @tag.delimiter)

(_
  "/>" @tag.delimiter)

; XML attributes and references
(Attribute
  (Name) @tag.attribute
  (AttValue) @string)

(EntityRef) @constant

(CharRef) @constant

(Attribute
  "=" @operator)

[
  "\""
  "'"
] @punctuation.delimiter

; CDATA and comments
(CDSect
  (CDStart) @tag.delimiter
  (CData) @module
  "]]>" @tag.delimiter)

(CharData) @markup

(Comment) @comment

(comment) @comment @spell

; SQL names and calls
(object_reference
  name: (identifier) @type)

((object_reference
  name: (identifier) @variable.parameter)
  (#match? @variable.parameter "^[$#]"))

(invocation
  (object_reference
    name: (identifier) @function.call))

(relation
  alias: (identifier) @variable)

(field
  name: (identifier) @field)

(column
  (identifier) @field)

(term
  alias: (identifier) @variable)

; SQL literals and MyBatis parameter placeholders
((literal) @string
  (#match? @string "^['\"]"))

((literal) @string
  (#match? @string "^&"))

((literal) @number
  (#match? @number "^[-+]?(0[xX][0-9A-Fa-f]+|0[bB][01]+|[0-9]+([eE][+-][0-9]+)?)$"))

((literal) @float
  (#match? @float "^[-+]?([0-9]+[.][0-9]*|[.][0-9]+)([eE][+-][0-9]+)?$"))

; MyBatis parameter delimiters and property fields
(literal
  [
    "#"
    "$"
    "{"
    "}"
  ] @tag.delimiter)

(literal
  (field) @field)

((literal) @field
  (#match? @field "^[$#][{][^}.]+[}]$")
  (#offset! @field 0 2 0 -1))

((literal) @field
  (#match? @field "^#[^#{}.]+#$")
  (#offset! @field 0 1 0 -1))

; SQL keywords
[
  (keyword_all)
  (keyword_and)
  (keyword_as)
  (keyword_asc)
  (keyword_between)
  (keyword_by)
  (keyword_call)
  (keyword_case)
  (keyword_current_timestamp)
  (keyword_delete)
  (keyword_desc)
  (keyword_distinct)
  (keyword_duplicate)
  (keyword_else)
  (keyword_end)
  (keyword_false)
  (keyword_from)
  (keyword_full)
  (keyword_group)
  (keyword_having)
  (keyword_in)
  (keyword_inner)
  (keyword_insert)
  (keyword_into)
  (keyword_is)
  (keyword_join)
  (keyword_left)
  (keyword_like)
  (keyword_limit)
  (keyword_not)
  (keyword_null)
  (keyword_offset)
  (keyword_on)
  (keyword_or)
  (keyword_order)
  (keyword_over)
  (keyword_partition)
  (keyword_right)
  (keyword_select)
  (keyword_set)
  (keyword_table)
  (keyword_then)
  (keyword_truncate)
  (keyword_true)
  (keyword_union)
  (keyword_update)
  (keyword_values)
  (keyword_when)
  (keyword_where)
] @keyword

; SQL operators and punctuation
(assignment
  "=" @operator)

(binary_expression
  [
    "+"
    "-"
    "*"
    "/"
    "%"
    "||"
    "="
    "<"
    "<="
    "!="
    ">="
    ">"
    "<>"
    "=>"
    "&gt;="
    "&gt;"
    "&lt;="
    "&lt;&gt;"
    "&lt;"
  ] @operator)

(named_argument
  name: (identifier) @variable.parameter)

[
  "("
  ")"
] @punctuation.bracket

[
  ";"
  ","
  "."
] @punctuation.delimiter

(ERROR) @error
