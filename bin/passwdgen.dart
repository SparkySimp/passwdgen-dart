import 'package:passwdgen/passwdgen.dart' as passwdgen;

void main(List<String> arguments) {
	for(var pwd in passwdgen.generatePasswords(int.parse(arguments[0]), 2, 4, 5, 3)) {
		print(pwd);
	}
}
