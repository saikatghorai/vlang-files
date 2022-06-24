import os

__global (
	cell_row_size = int(1000)
	data_limit    = int(1000)
)

fn parse(text string) {
	mut idx := 0
	mut cellrow := []int{len: cell_row_size, init: 0}
	for i in text {
		match i.ascii_str() {
			'>' {
				if idx == 1000 {
					idx = 0
				} else {
					idx++
				}
			}
			'<' {
				if idx == 0 {
					idx = 1000
				} else {
					idx++
				}
			}
			'+' {
				if cellrow[idx] > data_limit {
					cellrow[idx] %= data_limit
				} else {
					cellrow[idx]++
				}
			}
			'-' {
				if cellrow[idx] < 0 {
					cellrow[idx] %= data_limit
					cellrow[idx]++
				} else {
					cellrow[idx]--
				}
			}
			'.' {
				println(rune(cellrow[idx]))
			}
			',' {
				cellrow[idx] = os.input('').int()
			}
			else {}
		}
	}
}

fn main() {
	mut input := ''

	if os.args.len == 1 {
		input = os.input('')
	} else {
		input = os.args[1]
	}
	parse(input)
}
