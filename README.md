# Calculadora Simples — Atividade EBAC

Calculadora de terminal que recebe dois números inteiros e deixa o usuário escolher entre quatro operações: soma, subtração, multiplicação e divisão. O programa repete até o usuário decidir sair.

O projeto tem duas versões da mesma calculadora:

- **Python** (`calculadora.py` e `calculadora.ipynb`): primeira etapa do curso.
- **Shell Script** (`calculadora.sh`): mesma lógica reescrita em Bash para o módulo de Linux.

## Arquivos do repositório

| Arquivo | O que é |
|---|---|
| `calculadora.sh` | Script executável em Bash (versão Linux) |
| `calculadora.py` | Código em Python |
| `calculadora.ipynb` | Mesmo código Python em formato Jupyter Notebook |
| `comandos.txt` | Registro dos comandos Linux usados na atividade (`nano`, `chmod`, `ls -l`) |
| `.gitattributes` | Garante fim de linha LF nos scripts, para o `.sh` rodar no Linux mesmo se o repositório for clonado no Windows |

---

## Como executar o arquivo `.sh`

**Requisito:** terminal com Bash. Linux e macOS já têm. No Windows, use o **Git Bash** ou o **WSL**.

### 1. Baixar o projeto

```bash
git clone https://github.com/gabbiiii-gif/calculadora.git
cd calculadora
```

Também dá para baixar só o script pela página do arquivo no GitHub (botão **Download raw file**).

### 2. Dar permissão de execução

```bash
chmod +x calculadora.sh
```

O `+x` adiciona a permissão de **execução**. Sem ela, o terminal recusa o `./calculadora.sh` com `Permission denied`.

> O arquivo já foi enviado ao GitHub marcado como executável. Se você clonou com `git clone`, este passo normalmente não é necessário, mas não causa problema repetir.

### 3. (Opcional) Ajustar as permissões para `744`

```bash
chmod 744 calculadora.sh
ls -l calculadora.sh
# -rwxr--r-- 1 usuario usuario 2932 ... calculadora.sh
```

| Dígito | Quem | Permissão |
|---|---|---|
| `7` | Proprietário | leitura (4) + escrita (2) + execução (1) |
| `4` | Grupo | somente leitura |
| `4` | Outros | somente leitura |

Assim, só o dono pode alterar o arquivo.

### 4. Executar

```bash
./calculadora.sh
```

Alternativa, sem precisar de permissão de execução:

```bash
bash calculadora.sh
```

### Exemplo de uso

```text
======================================
     CALCULADORA - ATIVIDADE EBAC
======================================

Digite o primeiro numero: 10
Digite o segundo numero: 3

Escolha a operacao:
1 - Somar (+)
2 - Subtrair (-)
3 - Multiplicar (x)
4 - Dividir (/)
Digite o numero da opcao: 4

Resultado: 10 / 3 = 3

Deseja fazer outra conta? (s/n): n
Programa encerrado. Ate mais!
```

### Problemas comuns

| Erro | Causa | Solução |
|---|---|---|
| `Permission denied` | Arquivo sem permissão de execução | `chmod +x calculadora.sh` |
| `$'\r': command not found` | Arquivo salvo com fim de linha do Windows (CRLF) | `sed -i 's/\r$//' calculadora.sh` |
| `[[: not found` ou `Bad substitution` | Script rodado com `sh` em vez de `bash` | Use `./calculadora.sh` ou `bash calculadora.sh` |

---

## Como executar o código Python

```bash
python3 calculadora.py
```

No Windows, o comando costuma ser `python calculadora.py`.

O notebook `calculadora.ipynb` abre no Jupyter, no VS Code ou no Google Colab. Execute a célula de código e digite os valores na caixa de entrada.

---

## Explicação do código Python

O programa tem quatro partes, todas dentro de um laço de repetição.

### Laço de repetição: `while True`

```python
while True:
    ...
```

`while True` cria um laço que nunca termina sozinho. O programa repete o ciclo "ler números, escolher operação, mostrar resultado" até encontrar um `break`.

### 1. Ler os números: `input` e `int`

```python
numero1 = int(input("Digite o primeiro numero: "))
numero2 = int(input("Digite o segundo numero: "))
```

- `input()` mostra a mensagem e espera o usuário digitar. O valor chega sempre como **texto** (`str`).
- `int()` converte esse texto para **número inteiro**. Sem a conversão, `"10" + "3"` daria `"103"` (junta os textos) em vez de `13`.

### 2. Mostrar o menu

```python
print("\nEscolha a operacao:")
print("1 - Somar (+)")
...
opcao = int(input("Digite o numero da opcao: "))
```

`print()` escreve o menu na tela. O `\n` pula uma linha antes do texto. A escolha do usuário também passa por `int()`, para poder ser comparada com `1`, `2`, `3` e `4`.

### 3. Escolher a operação: `if` / `elif` / `else`

```python
if opcao == 1:
    resultado = numero1 + numero2
elif opcao == 2:
    resultado = numero1 - numero2
elif opcao == 3:
    resultado = numero1 * numero2
elif opcao == 4:
    if numero2 == 0:
        print("Erro: nao e possivel dividir por zero!")
    else:
        resultado = numero1 // numero2
else:
    print("Opcao invalida! Tente novamente.")
```

- O `if` testa a primeira condição. Cada `elif` ("senão, se") testa a próxima. O `else` executa quando nenhuma condição é verdadeira, ou seja, quando a opção digitada não existe.
- `==` compara dois valores. Não confundir com `=`, que guarda um valor numa variável.
- Na divisão existe um `if` dentro do outro. Ele confere se o segundo número é `0` antes de dividir, porque dividir por zero gera erro (`ZeroDivisionError`) e encerra o programa.
- `//` faz a **divisão inteira**: `10 // 3` dá `3`, sem casas decimais. O operador `/` daria `3.3333...`.

### 4. Continuar ou sair: `.lower()` e `break`

```python
continuar = input("\nDeseja fazer outra conta? (s/n): ").lower()

if continuar != "s":
    print("Programa encerrado. Ate mais!")
    break
```

- `.lower()` converte a resposta para minúscula. Assim, `S` e `s` são aceitos.
- `!=` significa "diferente de". Qualquer resposta que não seja `s` encerra o programa.
- `break` sai do `while True` e termina o programa.

### Limitação conhecida

A versão Python não valida a entrada. Se o usuário digitar texto em vez de número, o `int()` gera `ValueError` e o programa para. A versão em Shell resolve isso com a função `eh_numero`, que confere a entrada antes de calcular.

---

## Python x Shell Script

As duas versões seguem a mesma lógica. A tabela mostra o equivalente de cada recurso:

| Recurso | Python | Shell Script (Bash) |
|---|---|---|
| Laço de repetição | `while True:` | `while true` / `do` ... `done` |
| Ler entrada | `input("...")` | `read -p "..." variavel` |
| Converter para número | `int(...)` | não precisa; `$(( ))` já faz conta com inteiros |
| Condicional | `if` / `elif` / `else` | `case "$opcao" in 1) ... ;; esac` |
| Conta | `numero1 + numero2` | `$(( numero1 + numero2 ))` |
| Divisão inteira | `//` | `/` dentro de `$(( ))` |
| Minúscula | `.lower()` | `${variavel,,}` |
| Sair do laço | `break` | `break` |
| Validar número | não tem | `[[ "$1" =~ ^-?[0-9]+$ ]]` |

Diferença com números negativos: o Python arredonda a divisão para baixo (`-7 // 2` dá `-4`). O Bash descarta a parte decimal (`-7 / 2` dá `-3`).

---

## Autor

**Gabriel dos Reis Silva** — atividade do curso EBAC.
