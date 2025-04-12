import 'package:flutter/material.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({super.key});

  final List<Map<String, dynamic>> produtos = const [
    {
      'nome': 'Sem pele com sal 400g',
      'descricao': 'Amendoim torrado sem pele, temperado com sal.',
      'preco': 10.00,
    },
    {
      'nome': 'Sem pele sem sal 400g',
      'descricao': 'Amendoim torrado sem pele e sem sal.',
      'preco': 10.00,
    },
    {
      'nome': 'Sem pele com alho 400g',
      'descricao': 'Amendoim com tempero de alho crocante.',
      'preco': 10.00,
    },
    {
      'nome': 'Amendoim japonês 400g',
      'descricao': 'Clássico amendoim japonês com casquinha crocante.',
      'preco': 10.00,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catálogo de Produtos'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: produtos.length,
        itemBuilder: (context, index) {
          final item = produtos[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item['nome'],
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(item['descricao']),
                  const SizedBox(height: 8),
                  Text('Preço: R\$ ${item['preco'].toStringAsFixed(2)}'),
                  const SizedBox(height: 8),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('${item['nome']} adicionado ao pedido.'),
                            duration: const Duration(seconds: 2),
                          ),
                        );
                      },
                      icon: const Icon(Icons.add_shopping_cart),
                      label: const Text('Adicionar'),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
