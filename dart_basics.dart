// Student: <SEMANA munezero eric >
// Reg no: <26497/2024>
const String regNo = '26497/2024';
final int d = int.parse(regNo[regNo.length - 1]);
final int t = int.parse(regNo.substring(regNo.length - 2));

 
int countVowels(String text) {
  // this function counts the number of vowels in a given string sent to it as an argument and returns the count as an integer ,IT is ON PART B2
  int count = 0;
  const String vowels = 'aeiouAEIOU';
  int i = 0;
while (i < text.length){
  if (vowels.contains(text[i])){
    count++;
  }
  i++;}
 return count;
}

String initials(String fullName){
  //this function takes a full name as input and returns the initials of the name in uppercase letters, separated by periods. it trims any leading or trailing wihitespace from the input string and checks if the trimmed string is empty.if it is empty, the function returns an empty string.other wise, it splits the trimmed string into a list of words and iterates through each word to extract thefirst letter, converts it to uppercase, and appends it to the result string with a period. finally, the functiion returns the result string containing the initials of the name.
  String strimmed = fullName.trim();
  if (strimmed.isEmpty){
    return '';
  }
  List<String> words =  strimmed.split('');
  String result = '';
  int i = 0;
  while (i < words.length){
    String word = words[i];
    if (word.isEmpty){
      String firstletter = word[0].toUpperCase();
      result  = '$result$firstletter.';
    }
    i++;
  }
  return result;
}







void main() {
  // this is main function that calls the functions and print.
  String fullName = 'semana munezero eric';
  int vowelCount = countVowels(fullName);
  print('$fullName has $vowelCount vowels');

  print(initials('semana munezero eric'));


}
