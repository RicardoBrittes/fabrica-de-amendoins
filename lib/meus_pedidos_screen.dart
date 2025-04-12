import 'package:flutter/material.dart';

class MeusPedidosScreen extends StatelessWidget {
  const MeusPedidosScreen({super.key});

  final List<Map<String, dynamic>> pedidos = const [
    {
      'data': '10/04/2025',
      'total': 30.00,
      'itens': [
        {'nome': 'Sem pele com sal 400g', 'quantidade': 2},
        {'nome': 'Amendoim japonês 400g', 'quantidade': 1},
      ]
    },
    {
      'data': '08/04/2025',
      'total': 20.00,
      'itens': [
        {'nome': 'Sem pele sem sal 400g', 'quantidade': 2},
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus Pedidos'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: pedidos.length,
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) {
          final pedido = pedidos[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 3,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Pedido em ${pedido['data']}',
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text('Total: R\$ ${pedido['total'].toStringAsFixed(2)}'),
                  const SizedBox(height: 12),
                  const Text('Itens:', style: TextStyle(fontWeight: FontWeight.bold)),
                  ...List.generate(pedido['itens'].length, (i) {
                    final item = pedido['itens'][i];
                    return Text('- ${item['quantidade']}x ${item['nome']}');
                  }),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
