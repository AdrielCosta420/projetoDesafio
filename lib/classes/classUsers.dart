// ignore_for_file: public_member_api_docs, sort_constructors_first
class Users {
  final String nome;
  final String dataNascimento;
  final String apelido;
  final String email;
  final int? celular;

  Users({
    required this.nome,
    required this.dataNascimento,
    required this.apelido,
    required this.email,
    this.celular,
  });


}
