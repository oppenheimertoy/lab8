def perfect(num)
  n = 0
  1.upto(num-1) { |i| n += (num % i).zero? ? i : 0 }
  n === num
end

def subset arr
  arr.chunk_while { |node_one, node_two| perfect(node_one) && perfect(node_two) }.select { |node| perfect(node[0]) }
end

def count_subset arr
  arr.count { |node| perfect(node[0]) }
end

def max_subset arr
  arr.max { |node_one, node_two| node_one.length <=> node_two.length }
end
