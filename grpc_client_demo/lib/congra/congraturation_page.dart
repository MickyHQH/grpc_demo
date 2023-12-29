import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CongratulationPage extends StatelessWidget {
  const CongratulationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      backgroundColor: Colors.teal,
      body: Column(
        children: [
          Container(
            alignment: Alignment.topCenter,
            child: Image.network(
                'https://www.funimada.com/assets/images/cards/big/congrats-7.gif',
              width: MediaQuery.of(context).size.width * 0.8,
              height: 500,
            ),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
              child: const Text('Back to Home', style: TextStyle(fontSize: 22))
          )
        ],
      ),
    );
  }
}
