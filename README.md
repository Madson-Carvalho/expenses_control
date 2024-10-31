# Atividade Avaliativa: Desenvolvimento de Aplicativo de Controle de Despesas em Flutter com Firebase

Objetivo: Desenvolver um aplicativo mobile de controle de despesas utilizando o framework Flutter e integrando-o com o Firebase para armazenamento e autenticação dos dados.
Descrição da Atividade:
Os alunos deverão desenvolver um aplicativo que permita aos usuários registrar, visualizar e gerenciar suas despesas diárias. O app deverá ser funcional e oferecer uma interface amigável, onde o usuário possa:

## 1.	Prototipagem no Figma:
Antes de começar a programar o aplicativo, os alunos devem criar um protótipo funcional no Figma, ilustrando o layout e a navegação entre as telas.
O protótipo deve incluir as seguintes telas:
- Tela de login/cadastro
- Tela de registro de nova despesa
- Tela de exibição das despesas (lista)
- Tela de resumo (dashboard)
- Tela de edição de despesa
Critérios: O protótipo deve ser claro, com todos os componentes de UI bem definidos, e seguir boas práticas de design de interfaces, como legibilidade e simplicidade.

## 2.	Cadastro e Autenticação de Usuários:
Utilizar o Firebase Authentication para permitir que os usuários façam login, criem contas e saiam da sessão.
O login pode ser realizado com email/senha ou por outros métodos como Google/Facebook (opcional).

## 3.	Registro de Despesas:
Criar um formulário para que o usuário insira novas despesas, com os seguintes campos:
- Título da Despesa (ex: "Supermercado")
- Valor (em reais)
- Categoria (alimentação, transporte, lazer, etc.)
- Data
- Notas adicionais (opcional)
    
## 4.	Exibição das Despesas:
Exibir uma lista das despesas registradas, mostrando o título, valor, categoria e data.
A lista deve ser carregada a partir de dados armazenados no Firebase Firestore.

## 5.	Filtragem e Ordenação:
Implementar opções para o usuário filtrar as despesas por categoria e ordenar por valor ou data.

## 6.	Dashboard Resumido:
Implementar um resumo das despesas, mostrando o total gasto no mês e uma distribuição por categorias (gráfico opcional).

## 7.	Edição e Exclusão de Despesas:
Permitir que o usuário edite ou exclua despesas já cadastradas, com atualização em no Firebase.
 	
## 8.	Persistência dos Dados:
Utilizar Firebase Firestore para armazenar os dados das despesas e garantir a sincronização entre diferentes dispositivos.

# Link figma
<a href="https://www.figma.com/design/kuqPGYqsi5icGtD29VaUU9/Finance-Management-Mobile?node-id=7020-3430&t=M0SDLl2R4zVTBmpi-1" tagert="_blank">Acesse aqui o link do figma</a>

# Telas do aplicativo:
### Tela de login
![image](https://github.com/user-attachments/assets/209ee489-d187-446a-849b-112f2b340626)
### Tela de cadastro de usuário
![image](https://github.com/user-attachments/assets/a8c8151b-2714-4b16-934a-981df6ec2338)
### Home
![image](https://github.com/user-attachments/assets/ba7d5fee-c2c1-41ff-8e5e-ac4a5d288ae6)
### Cadastro de despesas
![image](https://github.com/user-attachments/assets/a2aa033f-baa5-4d61-abdb-70406ccfc953)
### Despesas
![image](https://github.com/user-attachments/assets/7e468167-9a14-4283-beb5-470ca697e99e)
