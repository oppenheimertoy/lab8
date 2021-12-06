
class CalcController < ApplicationController
  def input
    #render layout: false
  end

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

  def view
    arr_len = params[:arr_len].to_i
    arr = params[:arr].split(' ').map(&:to_i) if params[:arr]
    if arr_len.positive? && arr.length >= arr_len
      arr = arr.reverse.drop(arr.length - arr_len).reverse
      if arr.any? { |node| perfect(node) }
        @table = subset(arr)
        @count = count_subset(@table)
        @max = max_subset(@table)
      else
        @table = []
        @count = 0
        @max = []
      end
    end
  end
end
