class BankAccountDTO {
  final int accountNumber;
  final int digit;
  final int agency;
  final int agencyDigit;

  BankAccountDTO({
    this.accountNumber,
    this.digit,
    this.agency,
    this.agencyDigit,
  });

  BankAccountDTO copyWith({
    int accountNumber,
    int digit,
    int agency,
    int agencyDigit,
  }) {
    return BankAccountDTO(
      accountNumber: accountNumber ?? this.accountNumber,
      digit: digit ?? this.digit,
      agency: agency ?? this.agency,
      agencyDigit: agencyDigit ?? this.agencyDigit,
    );
  }

  @override
  String toString() {
    return 'BankAccountDTO(accountNumber: $accountNumber, digit: $digit, agency: $agency, agencyDigit: $agencyDigit)';
  }
}
