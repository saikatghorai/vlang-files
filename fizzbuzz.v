import os

fn main(){
	mut str := ""
	for i := 1; i <= os.args[1].i64(); i++{
		if i%3==0{
			str += "Fizz"
		}
		if i%5==0{
			str += "Buzz"
		}
		if str == ""{
			str += "${i}"
		}
		println(str)
		str = ""
	}
}
