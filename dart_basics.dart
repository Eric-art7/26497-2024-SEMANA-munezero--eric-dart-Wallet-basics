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

String initials(String fullName) {
  // this function takes a full name and  returns the initials of the name in uppercase and separated by a dot.
  String strimmed = fullName.trim();
  if (strimmed.isEmpty) {
    return '';
  }
  List<String> words = strimmed.split(' '); 
  String result = '';
  int i = 0;
  while (i < words.length) {
    String word = words[i];
    if (word.isNotEmpty) { 
      String firstletter = word[0].toUpperCase();
      result = '$result$firstletter.';
    }
    i++;
  }
  return result;
}



void drawTriangle(int height) {
  // this function drow a triangle of stars and # where * is for odd rows and # is for even rows where start from left to right.
  if (height <= 0) return;

  int row = 1;
  while (row <= height) {
    String line = '';
    int space = 1;
    while (space <= height - row) {
      line += ' ';
      space++;
    }
    int column = 1;
    while (column <= row) {
      if (row % 2 == 1) {
        line += '*';
      } else {
        line += '#';
      }
      column++;
    }
    print(line);
    row++;
  }
}

int momoFee(int amount){
  // traff function .
  if (amount <= 0){
    return -1;
  }else if (amount <= 1000){
    return 20;
  }else if (amount <= 10000 && amount > 1000){
    return 100;
  }else if (amount <= 150000 && amount > 10000){
    return 250;
  }else {
    return 1500;
  }
}

String maskPhone(String phone) {
   // function masks a phone number.
  if (phone.length != 10) {
    return 'INVALID';
  }
  String firstThree = phone.substring(0, 3);
  String lastTwo = phone.substring(8, 10);
  String stars = '';
  int i = 0;
  while (i < 5) {
    stars += '*';
    i++;
  }
  return '$firstThree$stars$lastTwo';
}




void main() {
  // this is main function that calls the functions and print.
  print('Reg no: $regNo | D = $d | T = $t');

  String fullName = 'semana munezero eric';
  int vowelCount = countVowels(fullName);
  print('$fullName has $vowelCount vowels');

  print(initials('semana munezero eric'));

  drawTriangle(10);
  drawTriangle(0);
  drawTriangle(-2);



  int i = 1;
  int totalFees = 0;
  String masked = maskPhone('0788123456');
  while (i <= 10) {
    int amount = i * 4000 + 97 * 100;
    int fee = momoFee(amount);
    totalFees += fee;
    print('Receipt $i | $amount RWF | fee $fee RWF | to $masked');
    i++;
  }
  print('Total fees: $totalFees RWF');



}
