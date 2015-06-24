##
# Question: Please implement a function that gets the minimal number of coins with values v1, v2, ..., vn, to make change for an amount of money with value t. There are an infinite number of coins for each value vi.
# For example, the minimum number of coins to make change for 15 out of a set of coins with values 1, 3, 9, 10 is 3. We can choose two coins with value 3 and a coin with value 9. The number of coins for other choices should be greater than 3.

class CoinChange
  def initialize(coins)
    @minimal_ways = [] # table for dp
    @coins = coins # array of coin
  end
  def minimal_numbers_of_coins_for(change)
    if @minimal_ways[change].nil?
      if change == 0
        @minimal_ways[change] = 0
      else
        @minimal_ways[change] = @coins.map{ |coin| minimal_numbers_of_coins_for(change-coin) if change>=coin }.compact.min + 1
      end
    else
      @minimal_ways[change]
    end
  end
end

counter = 0
while str = STDIN.gets
  break if str.chomp == "exit"
  change = str.chomp.to_i if counter == 0
  coins = str.chomp.split(' ').map(&:to_i) if counter == 1
  counter += 1
end

coin_change = CoinChange.new(coins)
p coin_change.minimal_numbers_of_coins_for(change)
