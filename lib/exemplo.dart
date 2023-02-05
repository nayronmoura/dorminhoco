void main() {
  Pessoa joao = Joao(nome: 'Joao', idade: 16, altura: 1.60);

  print(joao.eaposentado());
}

abstract class Pessoa {
  final String nome;
  final int idade;
  final double altura;

  Pessoa({required this.nome, required this.idade, required this.altura});

  String eaposentado();
}

class Joao implements Pessoa {
  @override
  final String nome;
  @override
  final int idade;
  @override
  final double altura;

  Joao({required this.nome, required this.idade, required this.altura});

  @override
  String eaposentado() {
    if (idade <= 65) {
      return 'é aposentado';
    } else {
      return 'não é aposentado';
    }
  }
}
