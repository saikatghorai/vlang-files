fn return_cipher_text(mut rune_arr []rune, roll_q int) []rune{
	a := rune_arr.len
	for i in 0..a{
		rune_arr[i] += roll_q
	}
	return rune_arr
}

fn main(){
	secret := "Don't go there tomorrow!"
	mut rune_arr := secret.runes()
	encrypted_text := return_cipher_text(mut rune_arr, 5).string()
	println(encrypted_text)
}
