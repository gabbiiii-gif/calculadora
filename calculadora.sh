#!/bin/bash
# =========================================================
# CALCULADORA SIMPLES - ATIVIDADE EBAC (MODULO LINUX)
# Autor: Gabriel dos Reis Silva
# Uso:   ./calculadora.sh
# =========================================================

# Funcao auxiliar: verifica se o valor digitado e um numero inteiro.
# O [[ =~ ]] compara com uma expressao regular (sinal opcional + digitos).
eh_numero() {
    [[ "$1" =~ ^-?[0-9]+$ ]]
}

echo "======================================"
echo "     CALCULADORA - ATIVIDADE EBAC"
echo "======================================"
echo ""

# 'while true' cria o LACO DE REPETICAO.
# O programa fica rodando ate o usuario decidir sair.
while true
do
    # ---- 1) RECEBER OS NUMEROS COM 'read' ----
    # O 'read' le o que o usuario digita e guarda dentro da variavel.
    read -p "Digite o primeiro numero: " numero1
    read -p "Digite o segundo numero: " numero2

    # Validacao: evita que o script quebre se o usuario digitar texto.
    if ! eh_numero "$numero1" || ! eh_numero "$numero2"; then
        echo "Erro: digite apenas numeros inteiros."
        echo ""
        continue   # volta para o inicio do laco
    fi

    # ---- 2) MOSTRAR O MENU DE OPERACOES ----
    echo ""
    echo "Escolha a operacao:"
    echo "1 - Somar (+)"
    echo "2 - Subtrair (-)"
    echo "3 - Multiplicar (x)"
    echo "4 - Dividir (/)"
    read -p "Digite o numero da opcao: " opcao
    echo ""

    # ---- 3) CONDICIONAL: decide qual operacao executar ----
    # O 'case' no Shell faz o mesmo papel do if / elif / else do Python.
    case "$opcao" in

        1)
            resultado=$(( numero1 + numero2 ))
            echo "Resultado: $numero1 + $numero2 = $resultado"
            ;;

        2)
            resultado=$(( numero1 - numero2 ))
            echo "Resultado: $numero1 - $numero2 = $resultado"
            ;;

        3)
            resultado=$(( numero1 * numero2 ))
            echo "Resultado: $numero1 x $numero2 = $resultado"
            ;;

        4)
            # Nao existe divisao por zero: conferimos antes de calcular.
            if [ "$numero2" -eq 0 ]; then
                echo "Erro: nao e possivel dividir por zero!"
            else
                # O $(( )) faz a divisao INTEIRA (sem casas decimais),
                # igual ao // do Python usado na primeira etapa.
                resultado=$(( numero1 / numero2 ))
                echo "Resultado: $numero1 / $numero2 = $resultado"
            fi
            ;;

        *)
            echo "Opcao invalida! Tente novamente."
            ;;
    esac

    # ---- 4) PERGUNTAR SE QUER CONTINUAR ----
    echo ""
    read -p "Deseja fazer outra conta? (s/n): " continuar

    # O ${variavel,,} converte a resposta para minuscula (aceita "s" ou "S").
    if [ "${continuar,,}" != "s" ]; then
        echo "Programa encerrado. Ate mais!"
        break   # o 'break' encerra o laco de repeticao
    fi

    echo ""
done
