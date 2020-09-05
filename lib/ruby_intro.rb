# When done, submit this entire file to the autograder.

# Part 1

def sum arr
  # YOUR CODE HERE

  # Check for Empty array
  if arr.empty?
    return 0
  end

  # Addition of elements in array
  val = 0
  arr.each do|num|
    val += num
  end
  return val

end

def max_2_sum arr
  # YOUR CODE HERE

  # Check for Empty array
  if arr.empty?
    return 0
  end

  # Check if array contains a single element only
  if arr.length == 1
    return arr[0]
  end

  # Get the two max elements
  max_elements = arr.max(2)
  return max_elements.sum

end

def sum_to_n? arr, n
  # YOUR CODE HERE

  # Return False for empty array irresepective of n
  if arr.length < 2
    return false
  end

  # Create a hash and add complement of elements
  myHash = Hash.new
  idx = 0
  for idx in 0..(arr.length-1)
    if myHash.key?(arr[idx])
      return true
    end
    myHash[n-arr[idx]] = idx
  end
  return false

end

# Part 2

def hello(name)
  # YOUR CODE HERE
  return "Hello, " + name.to_s
end

def starts_with_consonant? s
  # YOUR CODE HERE
  if s.length == 0
    return false
  end

  # Get the first character and check if its a vowel
  s_begin = s.to_s[0].upcase
  vowels = ["A", "E", "I", "O", "U"]
  if vowels.include? s_begin
    return false
  end

  # Case for non-letters
  if s_begin =~ /[[:alpha:]]/
    return true
  else
    return false
  end

end

def binary_multiple_of_4? s
  # YOUR CODE HERE

  # Reject invalid binary numbers
  if s =~ /^(00?|[01]+00)$/
    return true
  end
  return false

end

# Part 3

class BookInStock
# YOUR CODE HERE

  attr_accessor :isbn, :price

  def initialize(isbn, price)
    @isbn = isbn
    @price = price
    # Argument Checks
    if @isbn.empty?
      raise ArgumentError
    end
    if @price <= 0
      raise ArgumentError
    end
  end

  def price_as_string
    return "$#{'%.2f' % @price}"
  end

end
