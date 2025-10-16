# test.rb - EtwMath unit tests
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

require_relative 'lib/etw_math'
require 'minitest/autorun'

class EtwMathTests < Minitest::Test
  def test_version
    assert_match(/^(\d+.\d+.\d+)$/, EtwMath::VERSION)
  end

  def test_seconds_per_day
    assert_equal(86400, EtwMath::SECONDS_PER_DAY)
  end

  def test_seconds_per_hour
    assert_equal(3600, EtwMath::SECONDS_PER_HOUR)
  end

  def test_seconds_per_minute
    assert_equal(60, EtwMath::SECONDS_PER_MINUTE)
  end

  def test_format_number
    assert_equal("1,234,567", EtwMath.format_number(1234567.89))
    assert_equal("1,234,567.89", EtwMath.format_number(1234567.89, true))
  end

  def test_format_time
    assert_equal("14d:06h:56m:07s", EtwMath.format_time(1234567))
    assert_equal("1,428d:21h:33m:09s", EtwMath.format_time(123456789))
  end

  #def test_print_decimal
  #  assert_nil(EtwMath.print_decimal(1234.56789))
  #end

  def test_input_valid
    assert(!EtwMath.input_valid?(-1))
    assert(!EtwMath.input_valid?(0))
    assert(!EtwMath.input_valid?('s'))
    assert(!EtwMath.input_valid?(5, 200, -999))
    assert(EtwMath.input_valid?(5))
    assert(EtwMath.input_valid?(5, 200, 1999, 1))
  end

  def test_brown_crate_max
    assert_equal("7,000,000", EtwMath.brown_crate_max(7000000))
    assert(!EtwMath.brown_crate_max(-1))
  end

  def test_yellow_crate_max
    assert_equal("14,000,000", EtwMath.yellow_crate_max(7000000))
    assert(!EtwMath.yellow_crate_max(-1))
  end

  def test_purple_crate_max
    assert_equal("21,000,000", EtwMath.purple_crate_max(7000000))
    assert(!EtwMath.purple_crate_max(-1))
  end

  def test_jackpot_amount
    assert_equal("35,000,000", EtwMath.jackpot_amount(7000000))
    assert(!EtwMath.jackpot_amount(-1))
  end

  def test_walk_speed_value
    assert_equal("310", EtwMath.walk_speed_value(150))
    assert(!EtwMath.walk_speed_value(-1))
  end

  def test_walk_speed_level
    assert_equal("145", EtwMath.walk_speed_level(300))
    assert(!EtwMath.walk_speed_level(-1))
  end

  def test_size_at_level
    assert_equal("505,000", EtwMath.size_at_level(100))
    assert(!EtwMath.size_at_level(-1))
  end

  def test_level_at_size
    assert_equal("100", EtwMath.level_at_size(505000))
    assert(!EtwMath.level_at_size(-1))
  end

  def test_optimal_size_level_threshold
    assert_equal("550", EtwMath.optimal_size_level_threshold(100, 5.5))
    assert(!EtwMath.optimal_size_level_threshold(-1, -1))
  end

  def test_optimal_multi
    assert_equal("100", EtwMath.optimal_multi(550, 5.5))
    assert(!EtwMath.optimal_multi(-1, -1))
  end

  def test_size_level_cost
    assert_equal("80", EtwMath.size_level_cost(2))
    assert(!EtwMath.size_level_cost(-1))
  end

  def test_walk_level_cost
    assert_equal("1,080", EtwMath.walk_level_cost(2))
    assert(!EtwMath.walk_level_cost(-1))
  end

  def test_multi_level_cost
    assert_equal("40,000", EtwMath.multi_level_cost(2))
    assert(!EtwMath.multi_level_cost(-1))
  end

  def test_eat_level_cost
    assert_equal("80,000", EtwMath.eat_level_cost(2))
    assert(!EtwMath.eat_level_cost(-1))
  end

  def test_total_size_investment
    assert_equal("30,240", EtwMath.total_size_investment(10))
    assert(!EtwMath.total_size_investment(-1))
  end

  def test_total_walk_investment
    assert_equal("408,240", EtwMath.total_walk_investment(10))
    assert(!EtwMath.total_walk_investment(-1))
  end

  def test_total_multi_investment
    assert_equal("15,120,000", EtwMath.total_multi_investment(10))
    assert(!EtwMath.total_multi_investment(-1))
  end

  def test_total_eat_investment
    assert_equal("30,240,000", EtwMath.total_eat_investment(10))
    assert(!EtwMath.total_eat_investment(-1))
  end

  def test_total_upgrade_investment
    assert_equal("237,475,190", EtwMath.total_upgrade_investment(83, 10, 15, 11))
    assert_equal("5,474,602,884,855", EtwMath.total_upgrade_investment(1000, 400, 200, 75))
    assert(!EtwMath.total_upgrade_investment(-1, -1, -1, -1))
  end

  def test_size_range_cost
    assert_equal("28,000", EtwMath.size_range_cost(5, 10))
    assert(!EtwMath.size_range_cost(-1, -1))
  end

  def test_walk_range_cost
    assert_equal("378,000", EtwMath.walk_range_cost(5, 10))
    assert(!EtwMath.walk_range_cost(-1, -1))
  end

  def test_multi_range_cost
    assert_equal("14,000,000", EtwMath.multi_range_cost(5, 10))
    assert(!EtwMath.multi_range_cost(-1, -1))
  end

  def test_eat_range_cost
    assert_equal("28,000,000", EtwMath.eat_range_cost(5, 10))
    assert(!EtwMath.eat_range_cost(-1, -1))
  end

  def test_small_bite_amount
    assert_equal("20,300", EtwMath.small_bite_amount(505000, 100))
    assert(!EtwMath.small_bite_amount(-1, -1))
  end

  def test_medium_bite_amount
    assert_equal("30,600", EtwMath.medium_bite_amount(505000, 100))
    assert(!EtwMath.medium_bite_amount(-1, -1))
  end

  def test_big_bite_amount
    assert_equal("41,000", EtwMath.big_bite_amount(505000, 100))
    assert(!EtwMath.big_bite_amount(-1, -1))
  end

  def test_small_bite_delta_multi
    assert_equal("53", EtwMath.small_bite_delta_multi(9440, 10954))
    assert(!EtwMath.small_bite_delta_multi(-1, -1))
  end

  def test_medium_bite_delta_multi
    assert_equal("35", EtwMath.medium_bite_delta_multi(9440, 10954))
    assert(!EtwMath.medium_bite_delta_multi(-1, -1))
  end

  def test_big_bite_delta_multi
    assert_equal("27", EtwMath.big_bite_delta_multi(9440, 10954))
    assert(!EtwMath.big_bite_delta_multi(-1, -1))
  end

  def test_small_first_bite_multi
    assert_equal("94", EtwMath.small_first_bite_multi(270))
    assert(!EtwMath.small_first_bite_multi(-1))
  end

  def test_medium_first_bite_multi
    assert_equal("63", EtwMath.medium_first_bite_multi(270))
    assert(!EtwMath.medium_first_bite_multi(-1))
  end

  def test_big_first_bite_multi
    assert_equal("47", EtwMath.big_first_bite_multi(270))
    assert(!EtwMath.big_first_bite_multi(-1))
  end

  def test_time_to_max
    assert_equal("00d:00h:04m:49s", EtwMath.time_to_max(565, 101))
    assert(!EtwMath.time_to_max(-1, -1))
  end

  def test_time_to_max_small
    assert_equal("00d:00h:02m:45s", EtwMath.time_to_max_small(140, 31))
    assert(!EtwMath.time_to_max_small(-1, -1))
  end
end
