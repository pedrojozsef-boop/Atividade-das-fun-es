programa
{
	funcao inicio()
	{
		real precoUnitario, desconto = 0.0, subtotal, valorFinal
		inteiro quantidade
		logico possuiDesconto

		escreva("=== SISTEMA DE VENDAS ===\n\n")
		
		// Entrada de dados
		escreva("Informe o preço unitário do produto (R$): ")
		leia(precoUnitario)
		
		escreva("Informe a quantidade desejada: ")
		leia(quantidade)

		// 1. Processamento: Calcular Subtotal
		subtotal = calcularSubtotal(precoUnitario, quantidade)

		// 2. Verificar se o cliente tem direito a desconto
		possuiDesconto = verificarDesconto(subtotal, quantidade)

		// 3. Aplicar Desconto (se aplicável)
		se (possuiDesconto)
		{
			desconto = aplicarDesconto(subtotal)
		}

		// 4. Calcular Valor Final
		valorFinal = calcularValorFinal(subtotal, desconto)

		// 5. Exibir o Resumo Completo da Compra
		exibirResumoCompra(precoUnitario, quantidade, subtotal, desconto, valorFinal, possuiDesconto)
	}

	// Função 1: Calcula o subtotal (Preço Unitário x Quantidade)
	funcao real calcularSubtotal(real preco, inteiro qtd)
	{
		retorne preco * qtd
	}

	// Função 2: Regra de negócio para conceder desconto (Ex: compras acima de R$ 100 OU mais de 5 itens)
	funcao logico verificarDesconto(real subtotal, inteiro qtd)
	{
		se (subtotal >= 100.0 ou qtd >= 5)
		{
			retorne verdadeiro
		}
		senao
		{
			retorne falso
		}
	}

	// Função 3: Aplica 10% de desconto sobre o subtotal
	funcao real aplicarDesconto(real subtotal)
	{
		real percentualDesconto = 0.10 // 10%
		retorne subtotal * percentualDesconto
	}

	// Função 4: Subtrai o desconto do subtotal para obter o total a pagar
	funcao real calcularValorFinal(real subtotal, real desconto)
	{
		retorne subtotal - desconto
	}

	// Função 5: Procedimento para formatar e exibir as informações na tela
	funcao exibirResumoCompra(real preco, inteiro qtd, real subtotal, real desconto, real valorFinal, logico aplicouDesconto)
	{
		escreva("\n----------------------------------------")
		escreva("\n         RESUMO DA COMPRA               ")
		escreva("\n----------------------------------------")
		escreva("\nPreço Unitário : R$ ", preco)
		escreva("\nQuantidade     : ", qtd)
		escreva("\nSubtotal       : R$ ", subtotal)
		
		se (aplicouDesconto)
		{
			escreva("\nDesconto (10%) : R$ ", desconto)
		}
		senao
		{
			escreva("\nDesconto       : R$ 0.00 (Sem desconto aplicado)")
		}
		
		escreva("\n----------------------------------------")
		escreva("\nVALOR FINAL    : R$ ", valorFinal)
		escreva("\n----------------------------------------\n")
	}
}