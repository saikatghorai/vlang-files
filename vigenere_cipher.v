fn create_vignere_cipher(mut text []rune, mut key []rune) []rune{
	if key.len != text.len{
		numgaps := text.len - key.len 
		mut idx := 0
		for i := 0; i < numgaps; i++{
			key << text[idx]
			idx += 1 % text.len 
		}}
	for i in 0..text.len{
		text[i] += (key[i] - `\``) 
	}
	return text 
}

fn main(){
	secret := "Dont go there tomorrow"
	key := "aaaaaaaaaaaaaaaaaaaaa"
	mut ru_arr_sec := secret.runes()
	mut ru_arr_ke := key.runes()
	println(create_vignere_cipher(mut ru_arr_sec, mut ru_arr_ke).string())
}
