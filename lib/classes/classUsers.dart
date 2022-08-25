class ClassUsers {
  String nome = '';
  String data_Nascimento = '';
  String apelido = '';
  String email = '';
  int? celular;
  ClassUsers({
    required this.nome,
    required this.data_Nascimento,
    required this.apelido,
    required this.email,
    this.celular,
  });
}
