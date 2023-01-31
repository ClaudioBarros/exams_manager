**Criar Alternativa**
----

Cria uma ou mais alternativas associadas individualmente a qualquer questão.

* **URL**

    /alternatives/

* **Method:**

    `POST`
  
*  **URL Params**

    Nenhum

* **Data Params**
   
    JSON : 
    `
    {  
     [
        {"question_id" : <integer> , "statement" : <string>, "value" : boolean}, 
        { ... }, 
        ...
     ]
    }`  

* **Success Response:**

  * **Code:** 200 <br />
    **Content:** `
    message: "Alternativa criada com sucesso", 
    data: `
    {  
     [
        {id: <integer>, 
        question_id : <integer> , 
        statement : <string>, 
        value : boolean,
        created_at : <timestamp>,
        updated_at : <timestamp>}, 
        { ... }, 
        ...
     ]
    }`  
 
* **Error Response:**

  * **Code:** 401 UNAUTHORIZED <br />
    **Content:** `{ error : "Usuário não autorizado" }`

  OR

  * **Code:** 422 UNPROCESSABLE ENTITY <br />
    **Content:** `{ error : "Erro ao criar alternativa" }`


