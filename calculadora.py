# ============================================
# CALCULADORA SIMPLES - ATIVIDADE EBAC
# Autor: Gabriel dos Reis Silva
# Uso:   python3 calculadora.py
# ============================================

# A palavra 'while True' cria um LAÇO DE REPETIÇÃO.
# Isso faz o programa continuar rodando ate o usuario decidir sair.
while True:

    # ---- 1) RECEBER OS NUMEROS COM 'input' ----
    # O comando 'input' recebe o que o usuario digita (sempre como texto).
    # O 'int(...)' CONVERTE esse texto para numero INTEIRO (sem casas decimais).
    numero1 = int(input("Digite o primeiro numero: "))
    numero2 = int(input("Digite o segundo numero: "))

    # ---- 2) MOSTRAR O MENU DE OPERACOES ----
    print("\nEscolha a operacao:")
    print("1 - Somar (+)")
    print("2 - Subtrair (-)")
    print("3 - Multiplicar (x)")
    print("4 - Dividir (/)")

    # Aqui recebemos a escolha do usuario e convertemos para inteiro (int).
    opcao = int(input("Digite o numero da opcao: "))

    # ---- 3) CONDICIONAL: decide qual operacao fazer ----
    if opcao == 1:
        resultado = numero1 + numero2
        print("Resultado:", numero1, "+", numero2, "=", resultado)

    elif opcao == 2:
        resultado = numero1 - numero2
        print("Resultado:", numero1, "-", numero2, "=", resultado)

    elif opcao == 3:
        resultado = numero1 * numero2
        print("Resultado:", numero1, "x", numero2, "=", resultado)

    elif opcao == 4:
        # Nao podemos dividir por zero, entao verificamos antes.
        if numero2 == 0:
            print("Erro: nao e possivel dividir por zero!")
        else:
            # A '//' faz a divisao INTEIRA (mostra o resultado sem casas decimais).
            resultado = numero1 // numero2
            print("Resultado:", numero1, "/", numero2, "=", resultado)

    else:
        print("Opcao invalida! Tente novamente.")

    # ---- 4) PERGUNTAR SE QUER CONTINUAR ----
    # O '.lower()' transforma a resposta em minuscula, para aceitar "s" ou "S".
    continuar = input("\nDeseja fazer outra conta? (s/n): ").lower()

    # Se o usuario NAO digitar 's', o 'break' encerra o laco de repeticao.
    if continuar != "s":
        print("Programa encerrado. Ate mais!")
        break
