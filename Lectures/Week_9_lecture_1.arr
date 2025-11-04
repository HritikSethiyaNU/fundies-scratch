use context dcic2024

data TaxonomyTree:
  node(rank :: String, name :: String, children :: List<TaxonomyTree>)
end

# Example: Part of the cat family
lion = node("Species", "Panthera leo", [list: ])
tiger = node("Species", "Panthera tigris", [list: ])
leopard = node("Species", "Panthera pardus", [list: ])
panthera = node("Genus", "Panthera", [list: lion, tiger, leopard])

house-cat = node("Species", "Felis catus", [list: ])
wildcat = node("Species", "Felis silvestris", [list: ])
felis = node("Genus", "Felis", [list: house-cat, wildcat])

felidae = node("Family", "Felidae", [list: panthera, felis])


fun count-nodes(t :: TaxonomyTree) -> Number:
   1 + count-nodes-children(t.children)
where:
  count-nodes(lion) is 1
  count-nodes(panthera) is 4
  count-nodes(felis) is 3
  count-nodes(felidae) is 8
end

fun count-nodes-children(c :: List<TaxonomyTree>) -> Number:
  cases (List) c:
    | empty => 0
    | link(first, rest) =>
      count-nodes(first) + count-nodes-children(rest)
  end
end

fun count-leaves(t :: TaxonomyTree) -> Number:
  cases (List) t.children:
    | empty => 1
    | else => count-leaves-children(t.children)
  end
where:
  count-leaves(lion) is 1
  count-leaves(panthera) is 3
  count-leaves(felis) is 2
  count-leaves(felidae) is 5
end

fun count-leaves-children(c :: List<TaxonomyTree>) -> Number:
  cases (List) c:
    | empty => 0
    | link(first, rest) =>
      count-leaves(first) + count-leaves-children(rest)
  end
end

# Question 1 

fun count-species(t :: TaxonomyTree) -> Number:
  if t.rank == "Species":
    1 + count-species-children(t.children)
  else:
    count-species-children(t.children)
  end
end

fun count-species-children(c :: List<TaxonomyTree>) -> Number:
  cases (List) c:
    | empty => 0
    | link(first, rest) =>
      count-species(first) + count-species-children(rest)
  end


where:
  count-species(lion) is 1
  count-species(panthera) is 3
  count-species(felidae) is 5
end


# Question -  2

fun count-rank(t :: TaxonomyTree, rank :: String) -> Number:
  if t.rank == rank:
    1 + count-rank-children(t.children, rank)
  else:
    count-rank-children(t.children, rank)
  end
end

fun count-rank-children(c :: List<TaxonomyTree>, rank :: String) -> Number:
  cases (List) c:
    | empty => 0
    | link(first, rest) =>
      count-rank(first, rank) + count-rank-children(rest, rank)
  end


where:
  count-rank(felidae, "Species") is 5
  count-rank(felidae, "Genus") is 2
  count-rank(felidae, "Family") is 1
end


# Question - 3
fun taxon-height(t :: TaxonomyTree) -> Number:
  1 + max-height-children(t.children)
end

# returns the maximum height among a list of children
fun max-height-children(c :: List<TaxonomyTree>) -> Number:
  cases (List) c:
    | empty => 0
    | link(first, rest) =>
      num-max([list: taxon-height(first), max-height-children(rest)])
  end


where:
  taxon-height(lion) is 1
  taxon-height(panthera) is 2
  taxon-height(felidae) is 3
end




# Question - 4 

fun all-names(t :: TaxonomyTree) -> List<String>:
  append([list: t.name], all-names-list(t.children))
end

fun all-names-list(c :: List<TaxonomyTree>) -> List<String>:
  cases (List) c:
    | empty => [list: ]
    | link(first, rest) =>
      append(all-names(first), all-names-list(rest))
  end


where:
  all-names(lion) is [list: "Panthera leo"]
  all-names(panthera) is [list: "Panthera", "Panthera leo", "Panthera tigris", "Panthera pardus"]
  all-names(felidae) is [list: "Felidae", "Panthera", "Panthera leo", "Panthera tigris", "Panthera pardus",
                         "Felis", "Felis catus", "Felis silvestris"]
end

