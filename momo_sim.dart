// Student: <SEMANA munezero eric >
// Reg no: <26497/2024>
const String regNo = '26497/2024';
final int d = int.parse(regNo[regNo.length - 1]);
final int t = int.parse(regNo.substring(regNo.length - 2));



int momoFee(int amount) {
  // by S.M.E.
  if (amount <= 0) {
    return -1;
  } else if (amount <= 1000) {
    return 20;
  } else if (amount <= 10000) {
    return 100;
  } else if (amount <= 150000) {
    return 250;
  } else {
    return 1500;
  }
}

String formatRwf(int amount) {
  // formats an integer amount into rwanda francs RWF format with commas as thousand separators.
  if (amount == 0) return '0 RWF';
  bool isNegative = amount < 0;
  int absAmount = isNegative ? -amount : amount;
  String digits = absAmount.toString();
  String result = '';
  int count = 0;
  int i = digits.length - 1;
  while (i >= 0) {
    if (count > 0 && count % 3 == 0) {
      result = ',$result';
    }
    result = '${digits[i]}$result';
    count++;
    i--;
  }
  if (isNegative) {
    result = '-$result';
  }
  return '$result RWF';
}



bool isValidPin(String pin) {
  // isvalidpin function checks if a given pin is valid based on certain criteria.
  if (pin.length != 5) return false;
  if (pin == '12345') return false;
  int i = 0;
  bool allSame = true;
  while (i < pin.length) {
    int code = pin.codeUnitAt(i);
    if (code < 48 || code > 57) {
      return false;
    }
    if (pin[i] != pin[0]) {
      allSame = false;
    }
    i++;
  }
  if (allSame) return false;
  return true;
}



int sendMoney(int balance, int amount) {
  // sendmoney function simulates sending money and returns the new balances after deducting the amount and the fee.
  int fee = momoFee(amount);
  if (fee == -1) {
    print('Failed: invalid amount');
    return balance;
  }
  if (amount + fee > balance) {
    print('Failed: insufficient balance');
    return balance;
  }
  int newBalance = balance - (amount + fee);
  print(
      'Sent ${formatRwf(amount)} (fee ${formatRwf(fee)}). New balance: ${formatRwf(newBalance)}');
  return newBalance;
}



int buyAirtime(int balance, int amount) {
  // this fuction simulates buying airtine and returns the new balance after deducting the amount.
  if (amount < 100 || amount > 50000) {
    print('Failed: invalid airtime amount');
    return balance;
  }
  if (amount > balance) {
    print('Failed: insufficient balance');
    return balance;
  }
  int newBalance = balance - amount;
  print('Bought ${formatRwf(amount)} airtime. New balance: ${formatRwf(newBalance)}');
  return newBalance;
}




void main() {
  // this is main function that calls the functions and print .
  print('Reg no: $regNo | D = $d | T = $t');

  // 1. Test isValidPin
  print('12345 -> ${isValidPin('12345')}');
  print('77777 -> ${isValidPin('77777')}');
  print('4821 -> ${isValidPin('4821')}');
  print('48a21 -> ${isValidPin('48a21')}');
  print('4821$d -> ${isValidPin('4821$d')}');

  // 2. Starting balance (20000 + 97 * 500 = 68,500 RWF)
  int balance = 20000 + t * 500;
  print('Starting balance: ${formatRwf(balance)}');

  // 3. Transactions in order: send (D + 1) * 3000 = 24,000 three times
  int transferAmount = (d + 1) * 3000;
  int count = 0;
  while (count < 3) {
    balance = sendMoney(balance, transferAmount);
    count++;
  }

  balance = buyAirtime(balance, 1000);
  balance = sendMoney(balance, 0);
  balance = sendMoney(balance, 200000);

  // 4. Final balance
  print('Final balance: ${formatRwf(balance)}');

  // 5. At least 5 extra test calls with expected outputs
  print(formatRwf(0)); // 0 RWF
  print(formatRwf(-5000)); // -5,000 RWF
  print(formatRwf(1000000)); // 1,000,000 RWF
  print(isValidPin('54321')); // true
  print(isValidPin(' 1234')); // false (edge case: leading space)
  print(isValidPin('00000')); // false (edge case: all zeros)
}
