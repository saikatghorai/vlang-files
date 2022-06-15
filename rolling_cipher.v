fn return_cipher_text(text string, roll_q int) string{
	mut rune_arr := text.runes()
	a := rune_arr.len
	for i in 0..a{
		rune_arr[i] += roll_q
	}
	return rune_arr.string()
}

fn decrypt(cipher_text string, roll_q int) string{
	mut rune_arr := cipher_text.runes()
	a := rune_arr.len 
	for i in 0..a{
		rune_arr[i] -= roll_q 
	}
	return rune_arr.string()
}

fn main(){
	secret := "Don't go there tomorrow!"
	println(return_cipher_text(secret, 5))
	println(decrypt(return_cipher_text(secret, 5), 5))
}
