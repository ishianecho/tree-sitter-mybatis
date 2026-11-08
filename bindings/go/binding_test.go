package tree_sitter_mybatis_test

import (
	"testing"

	tree_sitter "github.com/tree-sitter/go-tree-sitter"
	tree_sitter_mybatis "github.com/ishianecho/tree-sitter-mybatis/bindings/go"
)

func TestCanLoadGrammar(t *testing.T) {
	language := tree_sitter.NewLanguage(tree_sitter_mybatis.Language())
	if language == nil {
		t.Errorf("Error loading Mybatis grammar")
	}
}
