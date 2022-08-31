import 'package:objectbox/objectbox.dart';

@Entity()
class User {
  @Id()
  int id = 0;
  String nome;
  String? dataNascimento;
  String? apelido;
  String? email;
  String? celular;
  String? avatarUrl;
  User({
    required this.nome,
    this.dataNascimento,
    this.apelido,
    this.email,
    this.celular,
    this.avatarUrl,
  });
}
