using Toybox.System;

//(:background)
class Util {
	
	public static function splitString(str, splitter) {
		var resultArray = [];
		var index = str.find(splitter);

		while (index != null) {
			resultArray.add(str.substring(0, index));
			str = str.substring(index + 1, str.length());
			
			index = str.find(splitter);
		}
		
		// Handling last segment
		resultArray.add(str);
		
		return resultArray;
	}
	
	public static function ljust(str, length, character) {
		var toAdd = length - str.length();
		var out = "";
	
		// Return the string if it already has 'length' or more characters
		if (toAdd <= 0) { return str; }
			
		while (toAdd > 0) {
			out += character;
			toAdd--;
		}
		out += str;
		
		return out;
	}
}