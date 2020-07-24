// ISP - Muitas interfaces especificas são melhores que uma geral.abstract

abstract class Conta {
  void depositar(int val);
  void transferir(int valor);
  void realizarEmprestimo();
}

class ContaCorrente extends Conta {
  @override
  void depositar(int val) => print('realizando...');

  @override
  void transferir(int valor) => print('realizando...');

  @override
  void realizarEmprestimo() => print('realizando...');
}

class ContaPoupanca extends Conta {
  @override
  void depositar(int val) => print('realizando...');

  @override
  void transferir(int valor) =>
      throw Exception('Conta poupança não faz transerencia.');

  @override
  void realizarEmprestimo() =>
      throw Exception('Conta poupança não faz emprestimo.');
}

/* 
 * O Problema aqui é que estamos dependendo de Conta
 * e conta nos oferece mais coisas do que realmente estamos utilizando.
 * 
 * Solução:
 */

abstract class Conta2 {
  void depositar(int val);
}

abstract class CestaDeServicos {
  void transferir(int valor);
  void realizarEmprestimo();
}

class ContaCorrente2 extends Conta2 implements CestaDeServicos {
  @override
  void depositar(int val) => "";

  @override
  void realizarEmprestimo() => "";

  @override
  void transferir(int valor) => "";
}

class ContaPoupanca2 extends Conta2 {
  @override
  void depositar(int val) => "";
}

class ContaConjunto extends Conta2 {
  @override
  void depositar(int val) => "";
}
