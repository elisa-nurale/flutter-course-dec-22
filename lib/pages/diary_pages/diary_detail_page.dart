import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_course_dec_22/router/router.gr.dart';

class DiaryDetailPage extends StatelessWidget {
  const DiaryDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          const Text('Sono la pagina di dettaglio del diario'),
          TextButton(
            child: const Text('Back'),
            onPressed: (){
              context.router.push(LoginRoute());
              //context.router.pop();
            },
          )
        ],),
      ),
    );
  }
}
