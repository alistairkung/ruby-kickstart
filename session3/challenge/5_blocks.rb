# Write a method, spiral_access, that takes a 2d square array (an array of arrays)
# and a block, and calls the block for each of the elements, in spiral order.
#
# HINT: This method is probably best sovled recursively
#
# Example:
# two_d = [
#   [ 1,  2,  3,  4, 5],
#   [16, 17, 18, 19, 6],
#   [15, 24, 25, 20, 7],
#   [14, 23, 22, 21, 8],
#   [13, 12, 11, 10, 9],
# ]
# order = []
# spiral_access two_d do |i|
#   order << i
# end
# order # => [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25]

def unravel(k, arr)
  n = arr.size
  p = n-k-1
  result = []

  k.upto p do |x|
    result << arr[k][x]
  end

  (k + 1).upto p do |x|
    result << arr[x][p]
  end

  (p-1).downto k do |x|
    result << arr[p][x]
  end

  (p-1).downto (k + 1) do |x|
    result << arr[x][k]
  end
  result
end

def spiral_access(arr, &block)
  return if (arr == [[]] || arr == [])

  nr_times = arr.size / 2
  final_order = []

  0.upto nr_times do |x|
    final_order += unravel(x, arr)
  end

  final_order.map(&block)
end
