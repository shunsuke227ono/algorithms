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
