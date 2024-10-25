import 'package:flutter/material.dart';

class NotebookScreen extends StatelessWidget {
  final int playersCount;

  const NotebookScreen({super.key, required this.playersCount});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Expanded(
          child: ListView.builder(
            itemCount: playersCount,
            itemBuilder: (context, index) {
              return NotebookCacho(player: index + 1);
            },
          ),
        ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () => Navigator.pop(context),
          label: const Text('Finalizar juego')
      ),
    );
  }
}

class NotebookCacho extends StatefulWidget {
  final int player;

  const NotebookCacho({super.key, required this.player});

  @override
  State<NotebookCacho> createState() => _NotebookCachoState();
}

class _NotebookCachoState extends State<NotebookCacho> {
  int balas = 0, escalera = 0, cuadras = 0, tontos = 0, full = 0, quinas = 0, tricas = 0,
      poker = 0, senas = 0, grande = 0, total = 0;

  void calcularPuntaje(int minValue, int maxValue) {
    setState(() {
      switch (minValue) {
        case 1:
          if (balas < maxValue) {
            balas += minValue;
          } else {
            balas = 0;
          }
        case 2:
          if (tontos < maxValue) {
            tontos += minValue;
          } else {
            tontos = 0;
          }
        case 3:
          if (tricas < maxValue) {
            tricas += minValue;
          } else {
            tricas = 0;
          }
        case 4:
          if (cuadras < maxValue) {
            cuadras += minValue;
          } else {
            cuadras = 0;
          }
        case 5:
          if (quinas < maxValue) {
            quinas += minValue;
          } else {
            quinas = 0;
          }
        case 6:
          if (senas < maxValue) {
            senas += minValue;
          } else {
            senas = 0;
          }
        case 20:
          if (escalera == 0) {
            escalera = maxValue;
          } else if (escalera == maxValue) {
            escalera = minValue;
          } else {
            escalera = 0;
          }
        case 30:
          if (full == 0) {
            full = maxValue;
          } else if (full == maxValue) {
            full = minValue;
          } else {
            full = 0;
          }
        case 40:
          if (poker == 0) {
            poker = maxValue;
          } else if (poker == maxValue) {
            poker = minValue;
          } else {
            poker = 0;
          }
        case 50:
          if (grande == 0) {
            grande = maxValue;
          } else {
            grande = 0;
          }
      }
      total = balas +
          escalera +
          cuadras +
          tontos +
          full +
          quinas +
          tricas +
          poker +
          senas +
          grande;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: Colors.blueGrey[50]
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('JUGADOR ${widget.player}: ', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
              Text(
                  '$total',
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)
              ),
            ],
          ),
        ),
        GridView.count(
          crossAxisCount: 3,
          crossAxisSpacing: 2,
          mainAxisSpacing: 2,
          childAspectRatio: (1 / .55),
          shrinkWrap: true,
          children: [
            _CustomButton(name: 'Balas', value: balas, onPressed: () => calcularPuntaje(1, 5)),
            _CustomButton(name: 'Escalera', value: escalera, onPressed: () => calcularPuntaje(20, 25)),
            _CustomButton(name: 'Cuadras', value: cuadras, onPressed: () => calcularPuntaje(4, 20)),
            _CustomButton(name: 'Tontos', value: tontos, onPressed: () => calcularPuntaje(2, 10)),
            _CustomButton(name: 'Full', value: full, onPressed: () => calcularPuntaje(30, 35)),
            _CustomButton(name: 'Quinas', value: quinas, onPressed: () => calcularPuntaje(5, 25)),
            _CustomButton(name: 'Tricas', value: tricas, onPressed: () => calcularPuntaje(3, 15)),
            _CustomButton(name: 'Poker', value: poker, onPressed: () => calcularPuntaje(40, 45)),
            _CustomButton(name: 'Senas', value: senas, onPressed: () => calcularPuntaje(6, 30)),
            _CustomButton(name: 'Grande', value: grande, onPressed: () => calcularPuntaje(50, 50)),
          ],
        ),
      ],
    );
  }
}

class _CustomButton extends StatelessWidget {
  final String name;
  final int value;
  final VoidCallback onPressed;

  const _CustomButton(
      {super.key,
      required this.name,
      required this.value,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.blueGrey)),
      child: TextButton(
        onPressed: onPressed,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(name.toUpperCase(), style: const TextStyle(fontSize: 14)),
            Text('$value', style: const TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}


