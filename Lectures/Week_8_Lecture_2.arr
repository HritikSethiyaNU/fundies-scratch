use context dcic2024
data River:
  | merge(width :: Number, left :: River, right :: River)
  | stream(flow-rate :: Number)
end

# Example: A small river network
stream-a = stream(5)
stream-b = stream(3)
stream-c = stream(8)

merge-1 = merge(12, stream-a, stream-b)
main-river = merge(15, merge-1, stream-c)


fun total-flow(r :: River) -> Number:
  cases (River) r:
    | merge(width, left, right) => total-flow(left) + total-flow(right)
    | stream(flow) => flow
  end
where:
  total-flow(stream-a) is 5
  total-flow(main-river) is 16
end

fun count-merges(r :: River) -> Number:
  cases (River) r:
    | merge(width, left, right) => 1 + count-merges(left) + count-merges(right)
    | stream(flow) => 0
  end
where:
  count-merges(stream-a) is 0
  count-merges(main-river) is 2
end


fun count-streams(r :: River) -> Number:
  cases(River) r:
    | merge(width, left, right) => count-streams(left) + count-streams(right)
    | stream(flow) => 1
  end 
where:
  count-streams(stream-a) is 1
  count-streams(main-river) is 3
end


fun max-width(r :: River) -> Number:
  cases (River) r:
    | stream(flow) => 0
    | merge(width, left, right) =>
        num-max(width, num-max(max-width(left), max-width(right)))
  end
where:
  max-width(main-river) is 15
end



fun widen-river(r :: River, amt :: Number) -> River:
  cases (River) r:
    | stream(flow) => stream(flow)
    | merge(width, left, right) =>
        merge(width + amt, widen-river(left, amt), widen-river(right, amt))
  end
where:
  widen-river(main-river, 5) is merge(20,
    merge(17, stream(5), stream(3)),
    stream(8))
end


fun cap-flow(r :: River, cap :: Number) -> River:
  cases (River) r:
    | stream(flow) => stream(if flow > cap: cap else: flow end)
    | merge(width, left, right) =>
        merge(width, cap-flow(left, cap), cap-flow(right, cap))
  end
where:
  cap-flow(main-river, 6) is merge(15,
    merge(12, stream(5), stream(3)),
    stream(6))
end


fun has-large-stream(r :: River) -> Boolean:
  cases (River) r:
    | stream(flow) => flow > 5
    | merge(width, left, right) =>
        has-large-stream(left) or has-large-stream(right)
  end
where:
  has-large-stream(main-river) is true
  has-large-stream(stream(2)) is false
end