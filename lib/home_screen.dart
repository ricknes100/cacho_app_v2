import 'package:flutter/material.dart';
import 'package:cacho_app/notebook_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cacho App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Cantidad de jugadores',
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
            const SizedBox(height: 16.0),
            for (int i = 2; i <= 4; i++)...[
              FilledButton.tonal(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NotebookScreen(playersCount: i)
                        )
                    );
                  },
                  child: Text('$i Jugadores')
              ),
            ],
          ],
        ),
      ),
    );
  }
}
