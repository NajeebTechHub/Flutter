import 'dart:io';

class BankAccount {
  String accountNumber;
  String accountHolderName;
  double balance;

  BankAccount(this.accountNumber, this.accountHolderName, this.balance);

  void deposit(double amount) {
    if (amount > 0) {
      balance += amount;
      print('Deposit of \$$amount successful.');
    } else {
      print('Invalid amount for deposit.');
    }
    print('Updated Balance: \$$balance');
  }

  void withdraw(double amount) {
    if (amount > 0 && amount <= balance) {
      balance -= amount;
      print('Withdrawal of \$$amount successful.');
    } else {
      print('Invalid amount for withdrawal or insufficient balance.');
    }
    print('Updated Balance: \$$balance');
  }

  void checkBalance() {
    print('Account Holder: $accountHolderName');
    print('Account Number: $accountNumber');
    print('Current Balance: \$$balance');
  }
}

void main() {
  var account1 = BankAccount('2222', 'Najeeb Anjum', 0);

  while (true) {
    print('''Select an option:
    1. Deposit
    2. Withdraw
    3. Check Balance
    4. Exit''');

    var option = int.parse(stdin.readLineSync() ?? '4');

    switch (option) {
      case 1:
        print('Enter amount to deposit:');
        var depositAmount = double.parse(stdin.readLineSync() ?? '0');
        account1.deposit(depositAmount);
        break;
      case 2:
        print('Enter amount to withdraw:');
        var withdrawAmount = double.parse(stdin.readLineSync() ?? '0');
        account1.withdraw(withdrawAmount);
        break;
      case 3:
        account1.checkBalance();
        break;
      case 4:
        print('Exiting...');
        return;
      default:
        print('Invalid option. Please try again.');
    }
    print('\n');
  }
}
