module main

import math

fn grains_on_square(square int) !u64 {
	if square < 1 || square > 64 {
		return error('number must be between 1 and 64')
	}
	return u64(math.pow(f64(2), square - 1))
}

fn total_grains_on_board() u64 {
	return max_u64
}
