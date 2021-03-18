import "dart:io";

main(){
	print("Bem-vindo ao carrinho de compras do Arthurzera! Este é um CRUD feito em Dart.\n");

	List<String> produtos = [];
	var condicao = true;
	String mensagem = "1 - Adicionar item.\n2 - Mostrar itens.\n3 - Editar item. \n4 - Remover item. \n0 - Sair.";

	while (condicao){
		print(mensagem);
		int opcao = int.parse(stdin.readLineSync().toString());

		if (opcao == 1){
      limpaTela();
			adicionarItem(produtos);
		} else if (opcao == 2){
      limpaTela();
			mostrarItens(produtos);
		} else if (opcao == 3){
      limpaTela();
      editarItem(produtos);
    } else if (opcao == 4){
      limpaTela();
      removerItem(produtos);
    } else if (opcao == 0){
      break;
    }
     else{
			print("Por favor, selecione uma opcão válida!");
		}
	}
}


adicionarItem(produtos){
  print("Digite o nome do produto que deseja adicionar.");
	var produto = stdin.readLineSync().toString();
	produtos.add(produto);
	print("${produto} adicionado com sucesso ao carrinho.\n" );
}


mostrarItens(produtos){
  if (carrinhoVazio(produtos) == false){
    print("Estes são os produtos presentes no carrinho:");
	  for (var i = 0; i < produtos.length; i++){
		  print("Item ${i} - ${produtos[i]}");
    }
  }else{
      print("Carrinho ainda está vazio.\n");
  }
}


editarItem(produtos){
  if (carrinhoVazio(produtos) == false){
    mostrarItens(produtos);
    print("\nDigite qual o número do produto que deseja editar.");
    int produto_index = int.parse(stdin.readLineSync().toString());
    print("Você está editando ${produtos[produto_index]}.\nAtualize o valor de ${produtos[produto_index]} para: ");
    var novo_produto = stdin.readLineSync().toString();
    produtos[produto_index] = novo_produto;
    print("Carrinho de compras atualizado com sucesso!\n");
  } else{
    print("Não é possível editar carrinho vazio.\n");
  }
}


removerItem(produtos){
  if (carrinhoVazio(produtos) == false){
    mostrarItens(produtos);
    print("\nDigite qual o número do produto que deseja remover.");
    int produto_index = int.parse(stdin.readLineSync().toString());
    produtos.removeAt(produto_index);
    print("Produto removido com sucesso!\n");
  }
  else{
    print("Não é possível remover produtos de um carrinho vazio.\n");
  }
}


carrinhoVazio(produtos){
  if (produtos.length == 0){
    return true;
  }
  else{
    return false;
  }
}


limpaTela(){
  print("\x1B[2J\x1B[0;0H");
}