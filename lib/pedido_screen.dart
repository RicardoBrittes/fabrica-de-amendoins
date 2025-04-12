import 'package:flutter/material.dart';

class PedidoScreen extends StatefulWidget {
  const PedidoScreen({super.key});

  @override
  State<PedidoScreen> createState() => _PedidoScreenState();
}

class _PedidoScreenState extends State<PedidoScreen> {
  final List<Map<String, dynamic>> _produtos = [
    {
      'nome': 'Sem pele com sal 400g',
      'quantidade': 0,
      'preco': 10.00,
    },
    {
      'nome': 'Sem pele sem sal 400g',
      'quantidade': 0,
      'preco': 10.00,
    },
    {
      'nome': 'Sem pele com alho 400g',
      'quantidade': 0,
      'preco': 10.00,
    },
    {
      'nome': 'Amendoim japonês 400g',
      'quantidade': 0,
      'preco': 10.00,
    },
  ];

  double get _total {
    return _produtos.fold(0, (sum, item) => sum + (item['quantidade'] * item['preco']));
  }

  void _incrementarQuantidade(int index) {
    setState(() {
      _produtos[index]['quantidade']++;
    });
  }

  void _decrementarQuantidade(int index) {
    setState(() {
      if (_produtos[index]['quantidade'] > 0) {
        _produtos[index]['quantidade']--;
      }
    });
  }

  void _confirmarPedido() {
    final itensSelecionados = _produtos.where((item) => item['quantidade'] > 0).toList();

    if (itensSelecionados.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Adicione pelo menos um item ao pedido.'),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Pedido Confirmado'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Total: R\$${_total.toStringAsFixed(2)}'),
            const SizedBox(height: 8),
            Text('Itens: ${itensSelecionados.length}'),
            const SizedBox(height: 16),
            const Text('Itens selecionados:'),
            ...itensSelecionados.map((item) => Text(
              '${item['nome']} - ${item['quantidade']} un.',
            )),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _limparPedido();
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void _limparPedido() {
    setState(() {
      for (var item in _produtos) {
        item['quantidade'] = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Montar Pedido'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: _limparPedido,
            tooltip: 'Limpar pedido',
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 8),
              itemCount: _produtos.length,
              itemBuilder: (context, index) {
                final item = _produtos[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item['nome'],
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'R\$${item['preco'].toStringAsFixed(2)}',
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.remove),
                              onPressed: () => _decrementarQuantidade(index),
                            ),
                            Text(
                              item['quantidade'].toString(),
                              style: const TextStyle(fontSize: 18),
                            ),
                            IconButton(
                              icon: const Icon(Icons.add),
                              onPressed: () => _incrementarQuantidade(index),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor.withOpacity(0.1),
              borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Total:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'R\$${_total.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _confirmarPedido,
                    child: const Text('Confirmar Pedido'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}