/// lib/passwdgen.dart - Contains functions for password generation.

import 'dart:math';

extension Shuffle on String {
	String get shuffled => (split('')..shuffle()).join('');
}

extension PickRandom<T> on List<T> {
		T get randomElement => (this..shuffle())[Random().nextInt(this.length)];
}

List<String> generatePasswords(int count, int uppercase, 
		int lowercase, int digit, int symbols) {
	
	var lSymbols = [0x21, 0x22, 0x23, 0x24, 0x25, 0x26, 0x27, 0x28, 0x29,
		       0x2A, 0x2B, 0x2C, 0x2D, 0x2E, 0x2F, 0x30];
	var passwords = List<String>.filled(count, "");

	// Generate passwords
	for(int nCipher = 0; nCipher < count; nCipher += 1) {
		int iCount = 0;
		String genCipher = "";

		// generate digits
		for(int nDigit = 0; nDigit < digit; nDigit += 1) {
			var prng = Random();
			genCipher += String.fromCharCode(prng.nextInt(10) + 48);
		}
		
		// generate uppercase letters
		for(int nUp = 0; nUp < uppercase; nUp += 1) {
			var prng = Random();
			genCipher += String.fromCharCode(prng.nextInt(28) + 65);
		}

		// generate lowercase letters
		for(int nLow = 0; nLow < lowercase; nLow += 1) {
			var prng = Random();
			genCipher += String.fromCharCode(prng.nextInt(28) + 97);
		}
		
		// generate symbols 
		for(int nSym = 0; nSym < symbols; nSym += 1) {
			var prng = Random();
			genCipher += String.fromCharCode(lSymbols.randomElement);
		}

		// shuffle the generated cipher and add it to the list

		passwords[nCipher] = genCipher.shuffled;
	}

	return passwords;
}
