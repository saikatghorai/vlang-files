fn create_vignere_cipher(texto string, keyo string) string{
	mut text := texto.runes()
	mut key := keyo.runes()
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
	return text.string()
}

fn main(){
	secret := "Dont go there tomorrow"
	key := "aaaaaaaaaaaaaaaaaaaaa"
	println(create_vignere_cipher(secret, key))
}
