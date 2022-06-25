import os

__global (
	cell_row_size = int(30_000)
	data_limit    = int(256)
)

fn parse(text string) {
	mut loop_table := []int{len: 100}
	mut loop_stack := []int{len: 100}
	for i in 0 .. text.len {
		match text[i].ascii_str() {
			'[' {
				loop_stack = loop_stack.reverse()
				loop_stack.prepend(i)
				loop_stack = loop_stack.reverse()
			}
			']' {
				loop_beginning_index := loop_stack.pop()
				loop_table[loop_beginning_index] = i
				loop_table[i] = loop_beginning_index
			}
			else {}
		}
	}
	mut idx := 0
	mut cellrow := []int{len: cell_row_size, init: 0}
	for i := 0; i < text.len; i++ {
		match text[i].ascii_str() {
			'>' {
				if idx == cell_row_size {
					idx = 0
				} else {
					idx++
				}
			}
			'<' {
				if idx == 0 {
					idx = cell_row_size - 1
				} else {
					idx--
				}
			}
			'+' {
				if cellrow[idx] + 1 == 256 {
					cellrow[idx] = 0
				} else {
					cellrow[idx]++
				}
			}
			'-' {
				if cellrow[idx] - 1 < 0 {
					cellrow[idx] = 255
				} else {
					cellrow[idx]--
				}
			}
			'.' {
				if idx != -1 {
					println(rune(cellrow[idx]))
				} else {
					println('')
				}
			}
			',' {
				cellrow[idx] = os.input('')[0]
				idx++
			}
			'[' {
				if cellrow[idx] == 0 {
					i == loop_table[i]
				} else {
				}
			}
			']' {
				if cellrow[idx] != 0 {
					i = loop_table[i]
				}
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
