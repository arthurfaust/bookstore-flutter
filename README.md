# BookStore

Aplicativo desenvolvido em **Flutter e Dart** para a atividade de catálogo de produtos, navegação, transformação de listas e acompanhamento do ciclo de vida de um aplicativo Android.

## Integrantes

- Arthur Faust Locatelli

## Funcionalidades

- **Catálogo de livros:** apresenta três produtos com nome, preço e quantidade disponível. Os cards são gerados com `map()` e `toList()`, e o estoque aparece sobreposto ao ícone do livro por meio de um `Stack`.
- **Detalhes dos produtos:** exibe nome, descrição, preço e estoque do livro selecionado. A navegação utiliza `Navigator.push()` para abrir os detalhes, passando o objeto `Produto`, e `Navigator.pop()` para retornar ao catálogo.
- **Transformações:** exibe a lista `[1, 2, 3, 4, 5]`, sua conversão para `List<String>` e seus valores multiplicados por dois. Também transforma as palavras `Flutter`, `é` e `incrível` em widgets `Text` e gera botões para os nomes Ana, Bruno e Carla. Cada botão exibe um `SnackBar` com o nome selecionado.
- **Histórico do ciclo de vida:** registra eventos reais recebidos pelo `AppLifecycleListener` (como `inactive`, `hidden`, `paused` e `resumed`) e os apresenta em ordem cronológica. O histórico é compartilhado entre as telas por um `ValueNotifier`, enquanto o aplicativo permanece em execução.

## Tecnologias

- Flutter
- Dart
- Material Design 3
- Android (dispositivo físico ou emulador)

Os produtos são cadastrados diretamente no código. **Não é necessário banco de dados nem conexão com a internet** para utilizar as funcionalidades do aplicativo após a configuração do ambiente.

## Pré-requisitos

1. Flutter SDK instalado e configurado no `PATH`.
2. Android SDK e ferramentas de desenvolvimento Android configurados.
3. Um celular Android com **depuração USB** habilitada ou um emulador Android iniciado.
4. Um editor, como o Visual Studio Code (com extensões Flutter e Dart), ou Android Studio.

Para verificar o ambiente:

```bash
flutter doctor
```

## Como executar

1. Descompacte o arquivo do projeto e abra sua pasta no terminal ou no VS Code.
2. Instale as dependências do projeto:

   ```bash
   flutter pub get
   ```

3. Conecte o dispositivo Android ou inicie um emulador e confirme que ele foi reconhecido:

   ```bash
   flutter devices
   ```

4. Execute o aplicativo:

   ```bash
   flutter run
   ```

Opcionalmente, execute a análise estática antes de iniciar:

```bash
flutter analyze
```

## Como testar

1. **Catálogo:** confira os três livros e os indicadores de estoque (6, 3 e 11 unidades).
2. **Detalhes:** abra pelo menos dois produtos diferentes e verifique que as informações correspondem ao item selecionado; use o botão **Voltar ao catálogo**.
3. **Transformações:** toque em **Transformações** no catálogo, confira os resultados das listas e pressione um dos botões de nomes para ver a mensagem na tela.
4. **Ciclo de vida:** abra o histórico pelo ícone na barra superior. Navegue entre catálogo e detalhes, depois pressione o botão **Home do Android** para enviar o aplicativo ao segundo plano. Retorne ao BookStore e consulte os eventos registrados. Os estados dependem da execução real; nenhum evento é inserido manualmente para simular o teste.

**Observação:** o histórico fica somente na memória. Ele é preservado durante a navegação normal entre as telas, mas pode ser perdido se o processo for encerrado ou o aplicativo for reiniciado.

## Estrutura principal do projeto

```text
bookstore_flutter/
├── android/          # Configuração da plataforma Android
├── lib/
│   └── main.dart     # Modelo Produto, catálogo, detalhes, transformações e histórico
├── pubspec.yaml      # Configurações e dependências Flutter
└── README.md         # Instruções do projeto
```

As demais pastas e arquivos gerados pelo Flutter devem permanecer no projeto conforme necessário para sua execução.
