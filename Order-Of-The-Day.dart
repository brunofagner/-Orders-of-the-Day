import "dart:io";

List<String> produtos = [];

main() {
  bool condicao = true;
  while (condicao) {
    print("==== ADICIONE UM PRODUTO ====");
    String text = stdin.readLineSync()!;
    if (text == "sair") {
      print("==== TERMINOU O PROGRAMA ====");
      condicao = false;
    } else if (text == "imprimir") {
      imprimir();
    } else if (text == "remover") {
      remover();
    } else {
      produtos.add(text);
      print("\x1B[2J\x1B[0;0H");
    }
  }
}

imprimir() {
  for (var i = 0; i < produtos.length; i++) {
    print("ITEM $i - ${produtos[i]}");
  }
}

remover() {
  print("==== qual item deseja remover?");
  imprimir();
  int item = int.parse(stdin.readLineSync()!);
  produtos.removeAt(item);
  print("==== ITEM REMOVIDO");
}
