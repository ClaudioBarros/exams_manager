**Criar Questão**
----

Cria uma nova questão e suas alternativas.

* **URL**

    /questions/

* **Method:**

    `POST`
  
*  **URL Params**

    Nenhum

* **Data Params**
   
    JSON : 
    `
    {   
        "statement" : <string>,  
        "topic_id" : <integer>,  
        "alternatives_attributes" : [  
            {"statement" : <string>,  
            "value" : <boolean>},
            {...}, 
            ...
        ]  
    }`  

* **Success Response:**

  * **Code:** 200 <br />
    **Content:** `
    message: "Questão criada com sucesso", 
    data: `{
        "id" : <integer>,
        "statement" : <string>,
        "created_at" : <timestamp>,
        "updated_at" : <timestamp>,
        "topic_id" : <integer>,
        "alternatives" : [
            {"id": <integer>}, {"id": <integer>}, {...}, ...
        ] 
    }`
 
* **Error Response:**

  * **Code:** 401 UNAUTHORIZED <br />
    **Content:** `{ error : "Usuário não autorizado" }`

  OR

  * **Code:** 422 UNPROCESSABLE ENTITY <br />
    **Content:** `{ error : "Erro ao criar questão" }`

