fn create_vignere_cipher(texto string, keyo string) string{
	mut text := texto.runes()
	mut key := keyo.runes()
	if key.len != text.len{
		numgaps := text.len - key.len 
		mut idx := 0
		for i := 0; i < numgaps; i++{
			key << key[idx]
			idx += 1 % key.len 
		}}
	for i in 0..text.len{
		text[i] += (key[i] - 97) 
		if text[i] > 122{
			text[i] = (text[i] % 123 + 97)
		}
	}
	return text.string()
}


// THE FOLLOWING FUNCTION IS WIP
fn decrypt(encrypted_text string, key string) string{
	mut encrypted_text_arr := encrypted_text.runes()
	mut key_arr := key.runes()
	if encrypted_text_arr.len != key_arr.len{
		numgaps := encrypted_text_arr.len - key_arr.len 
		mut idx := 0
		for i := 0; i < numgaps; i++{
			key_arr << key_arr[idx]
			idx += 1 % key_arr.len 
		}}
		for i in 0..encrypted_text_arr.len{
		encrypted_text_arr[i] -= (key_arr[i]) 
		if encrypted_text_arr[i] < 97{
			encrypted_text_arr[i] += `a`
		}
	}
	return encrypted_text_arr.string()
}


fn main(){
	secret := "Heatwavesbeenfakinmeout"
	key := "aaaaaaaaaaaaaaaaaaaaaaa" 
	println(create_vignere_cipher(secret, key))
//	println(decrypt(create_vignere_cipher(secret, key), key))
}
