import 'package:flutter/material.dart';

class StatusPedidoScreen extends StatefulWidget {
  const StatusPedidoScreen({super.key});

  @override
  State<StatusPedidoScreen> createState() => _StatusPedidoScreenState();
}

class _StatusPedidoScreenState extends State<StatusPedidoScreen> {
  String statusAtual = 'Em produção';

  void _mudarStatus() {
    setState(() {
      statusAtual = statusAtual == 'Em produção' ? 'Saiu para entrega' : 'Em produção';
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Status atualizado: $statusAtual'),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isEntrega = statusAtual == 'Saiu para entrega';
    return Scaffold(
      appBar: AppBar(
        title: const Text('Status do Pedido'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              isEntrega ? Icons.local_shipping : Icons.kitchen,
              size: 100,
              color: isEntrega ? Colors.green : Colors.orange,
            ),
            const SizedBox(height: 24),
            Text(
              'Seu pedido está:\n$statusAtual',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 32),
            ElevatedButton.icon(
              onPressed: _mudarStatus,
              icon: const Icon(Icons.update),
              label: const Text('Simular mudança de status'),
            ),
          ],
        ),
      ),
    );
  }
}
