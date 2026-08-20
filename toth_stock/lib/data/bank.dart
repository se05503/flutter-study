class Bank {
  final String name;
  final String logoImg;
  Bank(this.name, this.logoImg);
}

class BankAccount {
  final Bank bank;
  int balance;
  final String? accountTypeName;
  BankAccount(this.bank, this.balance, {this.accountTypeName});
}

final bankShinhan = Bank("신한은행", "assets/image/ic_shinhan.png");
final bankKakaoBank = Bank("카카오뱅크", "assets/image/ic_kakaobank.png");
final bankWoori = Bank("우리은행", "assets/image/ic_woori.png");

final bankAccountShinhan1 = BankAccount(bankShinhan, 300000, accountTypeName: "신한 주거래 우대통장(저축예금)");
final bankAccountShinhan2 = BankAccount(bankShinhan, 500000, accountTypeName: "저축예금");
final bankAccountShinhan3 = BankAccount(bankShinhan, 800000, accountTypeName: "저축예금");
final bankAccountKakao1 = BankAccount(bankKakaoBank, 1000000, accountTypeName: "입출금통장");
final bankAccountKakao2 = BankAccount(bankKakaoBank, 1100000, accountTypeName: "저축예금");
final bankAccountKakao3 = BankAccount(bankKakaoBank, 1200000);
final bankAccountWoori1 = BankAccount(bankWoori, 900000, accountTypeName: "입출금통장");
final bankAccountWoori2 = BankAccount(bankWoori, 950000);
final bankAccountWoori3 = BankAccount(bankWoori, 970000);
final bankAccountShinhan4 = BankAccount(bankShinhan, 1500000, accountTypeName: "급여통장");
final bankAccountShinhan5 = BankAccount(bankShinhan, 2000000);
final bankAccountKakao4 = BankAccount(bankKakaoBank, 5000000, accountTypeName: "비상금통장");
final bankAccountKakao5 = BankAccount(bankKakaoBank, 300000, accountTypeName: "저금통");
final bankAccountWoori4 = BankAccount(bankWoori, 1200000, accountTypeName: "주택청약종합저축");
final bankAccountWoori5 = BankAccount(bankWoori, 450000);
final bankAccountShinhan6 = BankAccount(bankShinhan, 700000, accountTypeName: "마이너스통장");
final bankAccountKakao6 = BankAccount(bankKakaoBank, 880000);
final bankAccountWoori6 = BankAccount(bankWoori, 3300000, accountTypeName: "정기예금");
final bankAccountShinhan7 = BankAccount(bankShinhan, 100000);

final bankAccounts = [
  bankAccountShinhan1,
  bankAccountShinhan2,
  bankAccountShinhan3,
  bankAccountKakao1,
  bankAccountKakao2,
  bankAccountKakao3,
  bankAccountWoori1,
  bankAccountWoori2,
  bankAccountWoori3,
  bankAccountShinhan4,
  bankAccountShinhan5,
  bankAccountKakao4,
  bankAccountKakao5,
  bankAccountWoori4,
  bankAccountWoori5,
  bankAccountShinhan6,
  bankAccountKakao6,
  bankAccountWoori6,
  bankAccountShinhan7,
];
