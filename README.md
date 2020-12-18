## Sobre a Aplicação

Job Manager é uma aplicação web para ajudar no gerenciamento de trabalhos. contanto com um layout simples de fácil usabilidade para o usuário, funcionalidades:

- Login.
- Lista de usuário.
- Cadastro de usuário: ao usuário se cadastrar a api envia um E-mail de boas vindas para o usuário.
- Edição de usuário: ao atualizar um usuário a api envia um E-mail informando que ouve uma alteração no usuário.
- deletar usuário: ao excluir um usuário a api envia um E-mail informando que o usuário foi excluido.
- Lista de trabalho: é uma tabela com o nome do trabalho, data de entrega, status e botões de ações (editar, ver mais e excluir).
- Adicionar trabalho: ao usuário cadastrar um trabalho, a api automaticamente defini o status como 'em andamento' e também envia um E-mail para todos os usuários do banco de dados.
- Edição de tarefa: Pode ser atualizado somente a descrição e a data de entrega, a api envia um E-mail para todos os usuários do banco de dados. 
- deletar trabalho: ao excluir um trabalho a api envia um E-mail para todos os usários informando que o trabalho foi excluido.
- concluir trabalho: ao usuário clicar no botão de concluir, a aplicação atribui a data que foi concluido o trabalho, defini o usuário que concluiu e envia o E-mail para todos os usuários.

## Iniciando o banco de dados mysql
Existe duas formas para iniciarmos o nosso banco de dados, a primeira é importa o banco de dados que está no projeto na pasta data_base e a segunda é rodar as migrations no laravel com o comando 'php artisan migrate'

## Iniciando o backend da aplicação
No laravel iremos iniciar o servidor próprio do laravel e queue.
- php artisan serve
- php artisan queue:work

## Iniciando o frontend da aplicação

No vue iremos iniciar o servidor do vue com o comando 'npm run dev'

## Endpoint

- Adicionar Usuário: post 'http://127.0.0.1:8000/api/users'
- Login: post 'http://127.0.0.1:8000/api/login'
- Logout: get 'http://127.0.0.1:8000/api/logout'

- Usuários: get 'http://127.0.0.1:8000/api/users'
- Usuário: get 'http://127.0.0.1:8000/api/user/{id}/show'
- Editar usuário: put 'http://127.0.0.1:8000/api/user/{id}/edit'
- Excluir usuário: delete 'http://127.0.0.1:8000/api/user/{id}/delete'

- Jobs: get 'http://127.0.0.1:8000/api/jobs'
- Job: get 'http://127.0.0.1:8000/api/job/{id}/show'
- Adicionar job: post 'http://127.0.0.1:8000/api/job/add'
- Editar job: put 'http://127.0.0.1:8000/api/job/{id}/edit'
- Concluir job: get 'http://127.0.0.1:8000/api/job/{id}/conclude'
- Excluir job: delete 'http://127.0.0.1:8000/api/job/{id}/delete'
