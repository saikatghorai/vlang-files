import time

fn check_surroundings(x int, y int, arr [][]bool) int {
	mut alive_in_surroundings := 0
	if arr[x][y] == true {
		alive_in_surroundings--
	}
	for xi in x - 1 .. x + 2 {
		if xi < 0 || xi == arr.len {
		} else {
			for yi in y - 1 .. y + 2 {
				if yi < 0 || yi == arr[0].len {
				} else {
					if arr[xi][yi] == true {
						alive_in_surroundings++
					}
				}
			}
		}
	}

	return alive_in_surroundings
}

fn tick(x int, y int, board [][]bool) bool {
	count := check_surroundings(x, y, board)
	birth := !board[x][y] && count == 3
	survive := board[x][y] && (count == 2 || count == 3)
	return birth || survive
}

fn update(mut arr [][]bool) {
	mut orig := arr.clone()
	for x in 0 .. arr.len {
		for y in 0 .. arr[0].len {
			arr[x][y] = tick(x, y, orig)
		}
	}
}

fn print_2d_arr(arr [][]bool) {
	for x in 0 .. arr.len {
		for y in 0 .. arr[0].len {
			if arr[x][y] == false {
				print('.')
			} else {
				print('*')
			}
		}
		print('\n')
	}
}

fn main() {
	mut board := [][]bool{len: 10, init: []bool{len: 10, init: false}}
	board[1][0] = true
	board[1][1] = true
	board[1][2] = true
	for {
		for i in 0 .. board.len + 1 {
			print('-')
		}
		print('\n')
		print_2d_arr(board)
		update(mut board)
		time.sleep(250 * time.millisecond)
	}
}
