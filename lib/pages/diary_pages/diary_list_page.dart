import 'package:flutter/material.dart';

class DiaryListPage extends StatelessWidget {
  const DiaryListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          const Text('Sono la pagina di visualizzazione del diario'),
          TextButton(
            child: const Text('Back'),
            onPressed: (){},
          )
        ],),
      ),
    );
  }
}
