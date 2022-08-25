import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CadastrarUsers extends StatefulWidget {
  const CadastrarUsers({Key? key}) : super(key: key);

  @override
  State<CadastrarUsers> createState() => _CadastrarUsersState();
}

class _CadastrarUsersState extends State<CadastrarUsers> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(),
          ],
        ),
      ),
    );
  }
}
