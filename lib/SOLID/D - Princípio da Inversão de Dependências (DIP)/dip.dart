// DIP - Depender de abstrações e não de classes concretas

class PagamentoRepository {
  void save() => print('salvando pamento.');
}

class ContaCorrente {
  PagamentoRepository _repository;
  ContaCorrente() {
    _repository = new PagamentoRepository();
  }

  void execultarAlgumaLogica() {
    _repository.save();
  }
}

// main(List<String> args) {
//   ContaCorrente c = ContaCorrente();
//   c.execultarAlgumaLogica();
// }

/*
  A violação acontece na linha 12, estamos dependendo de uma classe concreta
  se quisermos fazer o mock por exemplo do repositoy não é possível.

  Solução:
  Vamos inverter a responsabilidade, deixar que quem chamar a ContaCorrente resolva a dependencia do repository.
 */

abstract class IPagamentoRepository {
  void save();
}

class PagamentoRepositoryImp implements IPagamentoRepository {
  @override
  void save() => print('implementação');
}

class PagamentoRepositoryMock implements IPagamentoRepository {
  @override
  void save() => print('mock');
}

class ContaCorrente2 {
  IPagamentoRepository _repository;
  ContaCorrente2(IPagamentoRepository repository) {
    _repository = repository;
  }

  void execultarAlgumaLogica() {
    _repository.save();
  }
}

main(List<String> args) {
  ContaCorrente2 c = ContaCorrente2(PagamentoRepositoryImp());
  c.execultarAlgumaLogica();
  c = ContaCorrente2(PagamentoRepositoryMock());
  c.execultarAlgumaLogica();
}
