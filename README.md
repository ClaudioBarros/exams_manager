# Exams Manager

## Requisitos

    - Ruby 3.2.0 (ou superior)
    - Rails 7 (ou superior)
    - SQLite3

## Usando Docker
    
    Criar container: `$ docker build -t exams-manager`
    Rodar container: `$ docker run -it -p 3000:3000 exams-manager`

## Banco-de-Dados

## Testes

    `$ rpsec spec`

## API

### Autenticação

- [Autenticação](docs/auth.md)


### Usuário

- [Criação](docs/users/create_user.md)
- [Atualização](docs/users/update_user.md)
- [Exclusão](docs/users/delete_user.md)
- [Listagem](docs/users/index_user.md)
- [Listagem Individual](docs/users/show_user.md)


### Matéria

- [Criação](docs/topics/create_topic.md)
- [Atualização](docs/topics/update_topic.md)
- [Exclusão](docs/topics/delete_topic.md)
- [Listagem](docs/topics/list_topics.md)
- [Listagem Individual](docs/topics/show_topic.md)

### Prova

- [Criação](docs/exams/create_exam.md)
- [Atualização](docs/exams/update_exam.md)
- [Exclusão](docs/exams/delete_exam.md)
- [Listagem](docs/exams/list_exams.md)
- [Listagem Individual](docs/exams/show_exam.md)

### Participantes

- [Criação](docs/participants/create_participant.md)
- [Atualização](docs/participants/update_participant.md)
- [Exclusão](docs/participants/delete_participant.md)
- [Listagem](docs/participants/list_participants.md)
- [Listagem Individual](docs/participants/show_participant.md)


### Questões 

- [Criação](docs/questions/create_question.md)
- [Atualização](docs/questions/update_question.md)
- [Exclusão](docs/questions/delete_question.md)
- [Listagem](docs/questions/list_questions.md)
- [Listagem Individual](docs/questions/show_question.md)

### Alternativas

- [Criação](docs/alternatives/create_alternative.md)
- [Atualização](docs/alternatives/update_alternative.md)
- [Exclusão](docs/alternatives/delete_alternative.md)
- [Listagem](docs/alternatives/list_alternatives.md)
- [Listagem Individual](docs/alternatives/show_alternative.md)


### Associação entre Provas e Questões

- [Criação](docs/exam_questions/create_exam_question.md)
- [Exclusão](docs/exam_questions/delete_exam_question.md)
- [Listagem](docs/exam_questions/list_exam_questions.md)
- [Listagem Individual](docs/exam_questions/show_exam_question.md)

### Respostas dos Usuários  

- [Criação](docs/user_answers/create_user_answer.md)
- [Atualização](docs/user_answers/update_user_answer.md)
- [Exclusão](docs/user_answers/delete_user_answer.md)
- [Listagem](docs/user_answers/list_user_answers.md)
- [Listagem Individual](docs/user_answers/show_user_answer.md)




 







