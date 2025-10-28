use context dcic2024

data TaxonomyTree:
  node(rank :: String, name :: String, children :: List<TaxonomyTree>)
end


lion = node("Species", "Panthera leo", [list: ])
tiger = node("Species", "Panthera tigris", [list: ])
leopard = node("Species", "Panthera pardus", [list: ])
panthera = node("Genus", "Panthera", [list: lion, tiger, leopard])

house-cat = node("Species", "Felis catus", [list: ])
wildcat = node("Species", "Felis silvestris", [list: ])
felis = node("Genus", "Felis", [list: house-cat, wildcat])

felidae = node("Family", "Felidae", [list: panthera, felis])


fun is-leaf(t :: TaxonomyTree) -> Boolean:
  is-empty(t.children)
end



#Part 1

fun count-species(t :: TaxonomyTree) -> Number:
  count-rank(t, "Species")
where:
  count-species(panthera) is 3
  count-species(felidae) is 5
end


#Part 2

fun count-rank(t :: TaxonomyTree, r :: String) -> Number:
  (if t.rank == r: 1 else: 0 end)
  + count-rank-children(t.children, r)
where:
  count-rank(lion, "Species") is 1
  count-rank(felis, "Species") is 2
  count-rank(felidae, "Genus") is 2
  count-rank(felidae, "Family") is 1
end


fun count-rank-children(c :: List<TaxonomyTree>, r :: String) -> Number:
  cases (List) c:
    | empty => 0
    | link(first, rest) =>
        count-rank(first, r) + count-rank-children(rest, r)
  end
end

# Part 3
fun taxon-height(t :: TaxonomyTree) -> Number:
  if is-empty(t.children):
    1
  else:
    1 + taxon-height-children(t.children)
  end
where:
  taxon-height(lion) is 1
  taxon-height(panthera) is 2
  taxon-height(felidae) is 3
end

fun taxon-height-children(c :: List<TaxonomyTree>) -> Number:
  cases (List) c:
    | empty => 0
    | link(first, rest) =>
        num-max(taxon-height(first), taxon-height-children(rest))
  end
end


#Part 4 
fun all-names(t :: TaxonomyTree) -> List<String>:
  link(t.name, all-names-children(t.children))
where:
  all-names(panthera) is [list: "Panthera", "Panthera leo", "Panthera tigris", "Panthera pardus"]
  all-names(felidae) is [list:
    "Felidae", "Panthera", "Panthera leo", "Panthera tigris", "Panthera pardus",
    "Felis", "Felis catus", "Felis silvestris"]
end


fun all-names-children(c :: List<TaxonomyTree>) -> List<String>:
  cases (List) c:
    | empty => [list: ]
    | link(first, rest) =>
        append(all-names(first), all-names-children(rest))
  end
end

