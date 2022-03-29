import 'dart:io';

List<List<Map<String, dynamic>>> pedidos = [];
void main(List<String> args) {
  while (true) {
    print("Oque deseja fazer?");
    print("Pedir");
    print("Finalizar");
    print("Imprimir");
    String? comando = stdin.readLineSync();
    if (comando == "Finalizar") {
      print("O lucro do dia foi ${terminarDia()}");
      print("<==DIA FINALIZADDO==>");
      break;
    } else if (comando == "Pedir") {
      pedir();
    } else if (comando == "Imprimir") {
      imprimir();
    }
  }
}

pedir() {
  List<Map<String, dynamic>> pedido = [];

  while (true) {
    Map<String, dynamic> item = {};
    print("<== Oque deseja fazer? ==>");
    print("Adicionar Item");
    print("Finalizar");
    String comando = stdin.readLineSync()!;
    if (comando == "Adicionar") {
      print("Digite o item");
      item["nome"] = stdin.readLineSync();

      print("Quantidade do item: ");
      item["quantidade"] = int.parse(stdin.readLineSync()!);

      print("Valor do item");
      item["valor"] = double.parse(stdin.readLineSync()!);
      pedido.add(item);

      item["totalItem"] = item["quantidade"] * item["valor"];
    } else if (comando == "Finalizar") {
      print("<== Pedido Finalizado ==>");
      break;
    } else {
      print("Opção invalida!!!");
    }
  }
  pedidos.add(pedido);
}

imprimir() {
  int i = 1;
  for (var pedido in pedidos) {
    double totalPedido = 0;
    print("PEDIDO $i");
    i++;
    print("quant| Nome | Total ");
    for (var item in pedido) {
      print(item["quantidade"].toString() +
          " ==== " +
          item["nome"].toString() +
          " === " +
          item["totalItem"].toString());
      totalPedido += item["totalItem"];
    }
    print("Total do Pedido: ${totalPedido}");
  }
}

double terminarDia() {
  double totalDia = 0;
  for (var pedido in pedidos) {
    for (var item in pedido) {
      totalDia += item["totalItem"];
    }
  }
  return totalDia;
}
