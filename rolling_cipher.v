fn return_cipher_text_int_arr(to_be_encrypted []int, roll_q int) []int{
	mut cipher_text_int_arr := []int{}
	a := to_be_encrypted.len
	for i in 0..a {
		cipher_text_int_arr << to_be_encrypted[i] + roll_q 
	}
	return cipher_text_int_arr 
}

fn convert_text_to_int_arr(text string) []int{
	mut int_arr := []int{}
	a := i64(text.len)
	for i := 0; i < a; i++ {
		int_arr << text[i] 
	}
	return int_arr 
}
fn convert_int_arr_to_rune(arr []int) []rune{
	mut u := []rune{}
	a := arr.len
	for i in 0..a{
		c := arr[i].hex().runes()
		println(c)
		u << c
	}
	return u 
}

fn encrypt(text string){
	init_int_arr := convert_text_to_int_arr(text)
	cipher_text_int_arr := return_cipher_text_int_arr(init_int_arr, 5)
	cipher_text := convert_int_arr_to_rune(cipher_text_int_arr)
	println(cipher_text)
}

fn main(){
	secret := "Dont go there tomorrow!"
	encrypt(secret)
}

