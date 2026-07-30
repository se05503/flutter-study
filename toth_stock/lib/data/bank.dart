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

final bankAccounts = [
  bankAccountShinhan1,
  bankAccountShinhan2,
  bankAccountShinhan3,
  bankAccountKakao1,
  bankAccountKakao2,
  bankAccountKakao3,
  bankAccountWoori1,
  bankAccountWoori2,
  bankAccountWoori3
];