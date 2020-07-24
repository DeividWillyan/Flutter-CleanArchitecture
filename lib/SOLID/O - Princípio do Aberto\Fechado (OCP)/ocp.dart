// OCP nos informa que  devemos ser capazes de extender um comportamento de classe, sem modificá-lo.

class Pagamento {
  void pagarBoleto() => print('pagando boleto');
  void pagarImposto() => print('pagando imposto');
}

/*
  E se precisarmos adicionar um novo tipo de pagamento? desta forma estamos sujetos a modificar nosso codigo ja em produção.
  Esta alteração ira gerar um novo binario para lugares onde não necessita deste novo meio de pagamento.


  Solução:
  Como solução devemos ser capazer de extender o funcionamento da nossa classe de pagamento ou seja "pagar", 
  porem sem modificar a classe existente.

 */

abstract class Pagamento2 {
  int valor = 20;
  void pagar();
}

// na extensão reutilizamos o valor
class PagamentoBoleto extends Pagamento2 {
  @override
  void pagar() => print('Pagando boleto $valor');
}

// na herança re-implementamos o valor.
class PagamentoImposto implements Pagamento2 {
  @override
  int valor = 10;

  @override
  void pagar() => print('Pagando imposto $valor');
}

// nova forma de pagamento.
class PagamentoCartao extends Pagamento2 {
  @override
  void pagar() => print('Pagando cartao');
}
