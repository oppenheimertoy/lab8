require './main.rb'

class CalcController < ApplicationController
  def input
    render layout: false
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
