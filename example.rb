# example.rb - EtwMath examples
# Copyright (C) 2025 Lazy Villain
# https://github.com/LazyAntihero/etw_math
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#
# 1. Redistributions of source code must retain the above copyright notice, this
#    list of conditions and the following disclaimer.
#
# 2. Redistributions in binary form must reproduce the above copyright notice,
#    this list of conditions and the following disclaimer in the documentation
#    and/or other materials provided with the distribution.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
# ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
# WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
# DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
# ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
# (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
# LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
# ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
# (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
# SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

require_relative 'etw_math'

puts "Input tests..."
puts EtwMath.input_valid?(5)
puts EtwMath.input_valid?(5, 500, 2)
puts EtwMath.input_valid?(5, 200, -1)
puts EtwMath.input_valid?(5, 's')
puts EtwMath.input_valid?(5, 0)
puts EtwMath.input_valid?()

puts "\nMax brown crate reward for a max size of 7,000,000:"
puts EtwMath.brown_crate_max(7000000)
puts "\nMax yellow crate reward for a max size of 7,000,000:"
puts EtwMath.yellow_crate_max(7000000)
puts "\nMax purple crate reward for a max size of 7,000,000:"
puts EtwMath.purple_crate_max(7000000)
puts "\nMax jackpot amount for a max size of 7,000,000:"
puts EtwMath.jackpot_amount(7000000)
puts "\nWalk speed level for a walk speed value of 300:"
puts EtwMath.walk_speed_level(300)
puts "\nWalk speed value for a walk speed level of 150:"
puts EtwMath.walk_speed_value(150)
puts "\nMax size at size level 100 size is:"
puts EtwMath.size_at_level(100)
puts "\nSize level for a max size of 505,000 is:"
puts EtwMath.level_at_size(505000)
puts "\nOptimal size level for a multi of 100 using a factor of 5.5 is:"
puts EtwMath.optimal_size_level_threshold(100, 5.5)
puts "\nOptimal multi for a size level of 550 using a ratio of 5.5 is:"
puts EtwMath.optimal_multi(550, 5.5)
puts "\nSize upgrade cost at level 2 is:"
puts EtwMath.size_level_cost(2)
puts "\nWalk speed upgrade cost at level 2 is:"
puts EtwMath.walk_level_cost(2)
puts "\nMultiplier upgrade cost at level 2 is:"
puts EtwMath.multi_level_cost(2)
puts "\nEat speed upgrade cost at level 2 is:"
puts EtwMath.eat_level_cost(2)
puts "\nTotal cost of size upgrades at level 10 is:"
puts EtwMath.total_size_investment(10)
puts "\nTotal cost of walk speed upgrades at level 10 is:"
puts EtwMath.total_walk_investment(10)
puts "\nTotal cost of multi upgrades at level 10 is:"
puts EtwMath.total_multi_investment(10)
puts "\nTotal cost of eat speed upgrades at level 10 is:"
puts EtwMath.total_eat_investment(10)
puts "\nTotal cost of all upgrades at levels 83, 10, 15, and 11 is:"
puts EtwMath.total_upgrade_investment(83, 10, 15, 11)
puts "\nTotal cost of all upgrades at levels 1000, 400, 200, and 75 is:"
puts EtwMath.total_upgrade_investment(1000, 400, 200, 75)
puts "\nCost of size upgrades from level 5 to 10 is:"
puts EtwMath.size_range_cost(5, 10)
puts "\nCost of walk speed upgrades from level 5 to 10 is:"
puts EtwMath.walk_range_cost(5, 10)
puts "\nCost of multi upgrades from level 5 to 10 is:"
puts EtwMath.multi_range_cost(5, 10)
puts "\nCost of eat speed upgrades from level 5 to 10 is:"
puts EtwMath.eat_range_cost(5, 10)
puts "\nSmall bite amount at size 505,000 and 100 multi is:"
puts EtwMath.small_bite_amount(505000, 100)
puts "\nMedium bite amount at size 505,000 and 100 multi is:"
puts EtwMath.medium_bite_amount(505000, 100)
puts "\nBig bite amount at size 505,000 and 100 multi is:"
puts EtwMath.big_bite_amount(505000, 100)
puts "\nIf original size was 9,440 and size after eating a small bite is 10,954, the multi is:"
puts EtwMath.small_bite_delta_multi(9440, 10954)
puts "\nIf original size was 9,440 and size after eating a medium bite is 10,954, the multi is:"
puts EtwMath.medium_bite_delta_multi(9440, 10954)
puts "\nIf original size was 9,440 and size after eating a big bite is 10,954, the multi is:"
puts EtwMath.big_bite_delta_multi(9440, 10954)
puts "\nIf first small bite amount is 270, the multi is:"
puts EtwMath.small_first_bite_multi(270)
puts "\nIf first medium bite amount is 270, the multi is:"
puts EtwMath.medium_first_bite_multi(270)
puts "\nIf first big bite amount is 270, the multi is:"
puts EtwMath.big_first_bite_multi(270)
puts "\nTime to max for a size level of 565 at 101 multi is:"
puts EtwMath.time_to_max(565, 101)
puts "\nTime to max for a size level of 140 at 31 multi is:"
puts EtwMath.time_to_max_small(140, 31)
