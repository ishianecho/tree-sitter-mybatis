# tree-sitter-mybatis

A tree-sitter grammar for MyBatis and iBATIS mapper files.

## Installation

```sh
git clone https://github.com/ishi-o/tree-sitter-mybatis.git
cd tree-sitter-mybatis
npm install
tree-sitter build -o mybatis.so
```

## Development

```sh
tree-sitter generate
make test
```

## References

- [MyBatis — Mapper XML Files](https://mybatis.org/mybatis-3/xml.html)
- [MyBatis — Dynamic SQL](https://mybatis.org/mybatis-3/dynamic-sql.html)
- [iBATIS — SqlMaps 2 Developer Guide](https://ibatis.apache.org/docs/en/pdf/iBATIS-SqlMaps-2_en.pdf)
