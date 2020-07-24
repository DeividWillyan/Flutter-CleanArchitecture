import 'package:equatable/equatable.dart';

class BankAccount extends Equatable {
  final int accountNumber;
  final int digit;
  final int agency;
  final int agencyDigit;

  BankAccount({this.accountNumber, this.digit, this.agency, this.agencyDigit});

  bool isInvalidNumberAccout() =>
      (this.accountNumber == null || this.accountNumber <= 0);

  @override
  List<Object> get props =>
      [this.accountNumber, this.digit, this.agency, this.agencyDigit];

  @override
  String toString() {
    return 'BankAccount(accountNumber: $accountNumber, digit: $digit, agency: $agency, agencyDigit: $agencyDigit)';
  }
}
