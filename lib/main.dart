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
    
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),

          child: FilledButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const TransformacoesPage(),
                ),
              );
            },

            icon: const Icon(Icons.transform),
            label: const Text('Transformações'),
          ),
        ),
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

class TransformacoesPage extends StatelessWidget {
  const TransformacoesPage({super.key});

  @override
  Widget build(BuildContext context) {

    // 1. Transformações numéricas
    final List<int> numeros = [1, 2, 3, 4, 5];

    final List<String> numerosString = numeros
        .map((numero) => numero.toString())
        .toList();

    final List<int> numerosDobrados = numeros
        .map((numero) => numero * 2)
        .toList();

    // 2. Palavras transformadas em widgets
    final List<String> palavras = [
      'Flutter',
      'é',
      'incrível',
    ];

    final List<Widget> textos = palavras.map((palavra) {
      return Text(
        palavra,
        style: const TextStyle(fontSize: 18),
      );
    }).toList();

    // 3. Nomes transformados em botões
    final List<String> nomes = [
      'Ana',
      'Bruno',
      'Carla',
    ];

    final List<Widget> botoes = nomes.map((nome) {
      return FilledButton(
        onPressed: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Nome selecionado: $nome'),
            ),
          );
        },
        child: Text(nome),
      );
    }).toList();

    // Interface da página
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transformações'),
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),

        children: [

          // Seção 1: Números
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(
                    'Transformação de números',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),

                  const SizedBox(height: 12),

                  Text('Lista original: $numeros'),

                  const SizedBox(height: 8),

                  const Text('Lista de strings (List<String>):'),

                  Text(
                    '[${numerosString.map((s) => '"$s"').join(', ')}]',
                  ),

                  const SizedBox(height: 8),

                  Text('Multiplicados por 2: $numerosDobrados'),
                ],
              ),
            ),
          ),

          const SizedBox(height: 12),

          // Seção 2: Palavras
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(
                    'Palavras em widgets',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),

                  const SizedBox(height: 12),

                  Wrap(
                    spacing: 12,
                    runSpacing: 8,
                    children: textos,
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 12),

          // Seção 3: Botões
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(
                    'Nomes em botões',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),

                  const SizedBox(height: 12),

                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: botoes,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}