// LSP - Os subtipos devem ser substituíveis pelos seus tipos base

class Conta {
  void depositar(int val) => print('depositando...');
  void transferir(int valor) => print('transferencido...');
  void realizarEmprestimo() => print('realizando emprestimo...');
}

class ContaCorrente implements Conta {
  @override
  void depositar(int val) => print('realizando...');

  @override
  void transferir(int valor) => print('realizando...');

  @override
  void realizarEmprestimo() => print('realizando...');
}

class ContaPoupanca implements Conta {
  @override
  void depositar(int val) => print('realizando...');
  
  @override
  void transferir(int valor) => throw Exception('Conta poupança não faz transerencia.');

  @override
  void realizarEmprestimo() => throw Exception('Conta poupança não faz emprestimo.');
}

main(List<String> args) {
  Conta c  = ContaCorrente();
  c.realizarEmprestimo();
  c = ContaPoupanca();
  c.realizarEmprestimo(); 
}

/** 
  O exemple fere o principio do LSP uma vez que as classes derivadas não podem ser usadas como classe base.

*/
