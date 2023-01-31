**Criar Prova**
----

Cria uma nova prova e opcionalmente associa questões à ela.

* **URL**

    /exams/

* **Method:**

    `POST`
  
*  **URL Params**

    Nenhum

* **Data Params**
   
    JSON : 
    `
    {   
        "name" : <string>,  
        "topic_id" : <integer>,  
        "questions" : [  
            {"id": <integer>}, {"id": <integer>}, {...}, ...  
        ]  
    }`  

* **Success Response:**

  * **Code:** 200 <br />
    **Content:** `
    {   "id" : <integer>
        "name" : <string>,
        "created_at" : <timestamp>,
        "updated_at" : <timestamp>, 
        "topic_id" : <integer>,
        "questions" : [
            {"id": <integer>}, {"id": <integer>}, {...}, ...
        ] 
    }`
 
* **Error Response:**

  * **Code:** 401 UNAUTHORIZED <br />
    **Content:** `{ error : "Usuário não autorizado" }`

  OR

  * **Code:** 422 UNPROCESSABLE ENTITY <br />
    **Content:** `{ error : "Erro ao criar prova" }`

