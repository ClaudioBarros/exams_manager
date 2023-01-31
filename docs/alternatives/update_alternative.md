**Atualizar Alternativa **
----

Atualiza os dados de uma única alternativa.

* **URL**

    /alternative/:id

* **Method:**

    `PUT`
  
*  **URL Params**

   **Required:**
 
    `id=<integer>`

* **Data Params**
   
    JSON : 
    `
    {   
        "question_id" : <integer>,
        "statement" : <string>,  
        "value" : <boolean>
    }`  

* **Success Response:**

  * **Code:** 200 <br />
    **Content:** `
    message: "Alternativa atualizada com sucesso", 
    data: `{
        "id" : <integer>,
        "question_id" : <integer>,
        "statement" : <string>,  
        "value" : <boolean>
        "created_at" : <timestamp>,
        "updated_at" : <timestamp>
    }`
 
* **Error Response:**

  * **Code:** 401 UNAUTHORIZED <br />
    **Content:** `{ error : "Usuário não autorizado" }`

  OR

  * **Code:** 422 UNPROCESSABLE ENTITY <br />
    **Content:** `{ error : "Erro ao atualizar alternativa" }`

