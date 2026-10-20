import 'package:flutter/material.dart';

void main() {
  runApp(const BookStoreApp());
}

class BookStoreApp extends StatelessWidget {
  const BookStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BookStore',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
        ),
        useMaterial3: true,
      ),
      home: const CatalogoPage(),
    );
  }
}

class Produto {
  final String nome;
  final String descricao;
  final double preco;
  final int quantidadeDisponivel;

  const Produto({
    required this.nome,
    required this.descricao,
    required this.preco,
    required this.quantidadeDisponivel,
  });
}

const List<Produto> produtos = [
  Produto(
    nome: 'Flutter Essencial',
    descricao: 'Aprenda a desenvolver aplicativos '
        'multiplataforma utilizando Flutter e Dart.',
    preco: 89.90,
    quantidadeDisponivel: 6,
  ),
  Produto(
    nome: 'Estruturas de Dados',
    descricao: 'Conheça as principais estruturas de dados '
        'e algoritmos utilizados na programação.',
    preco: 119.90,
    quantidadeDisponivel: 3,
  ),
  Produto(
    nome: 'Lógica de Programação',
    descricao: 'Aprenda os fundamentos da lógica de '
        'programação e resolução de problemas.',
    preco: 69.90,
    quantidadeDisponivel: 11,
  ),
];

class CatalogoPage extends StatelessWidget {
  const CatalogoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BookStore'),
      ),

      body: ListView(
        padding: const EdgeInsets.all(12),

        children: produtos.map((produto) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(12),

              child: Row(
                children: [
                  // Ícone com indicador de estoque
                  SizedBox(
                    width: 85,
                    height: 85,

                    child: Stack(
                      children: [
                        const Center(
                          child: Icon(
                            Icons.menu_book,
                            size: 60,
                            color: Colors.indigo,
                          ),
                        ),

                        Positioned(
                          right: 0,
                          top: 0,

                          child: CircleAvatar(
                            radius: 15,
                            backgroundColor: Colors.indigo,

                            child: Text(
                              '${produto.quantidadeDisponivel}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(width: 12),

                  // Informações do produto
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Text(
                          produto.nome,
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 6),

                        Text(
                          'R\$ ${produto.preco.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.green,
                          ),
                        ),

                        const SizedBox(height: 8),

                        FilledButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetalhesPage(
                                  produto: produto,
                                ),
                              ),
                            );
                          },
                          child: const Text('Ver detalhes'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class DetalhesPage extends StatelessWidget {
  final Produto produto;

  const DetalhesPage({
    super.key,
    required this.produto,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes do Produto'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            // Ícone do produto
            const Center(
              child: Icon(
                Icons.menu_book,
                size: 100,
                color: Colors.indigo,
              ),
            ),

            const SizedBox(height: 24),

            // Nome do produto
            Text(
              produto.nome,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 16),

            // Descrição
            Text(
              produto.descricao,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 20),

            // Preço
            Text(
              'R\$ ${produto.preco.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 22,
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            // Estoque disponível
            Text(
              'Quantidade disponível: '
              '${produto.quantidadeDisponivel}',
              style: const TextStyle(
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 30),

            // Botão para retornar
            Center(
              child: FilledButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back),
                label: const Text('Voltar ao catálogo'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}