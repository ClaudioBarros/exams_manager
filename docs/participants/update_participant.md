**Atualizar Participante**
----

Atualiza os dados de um único participante.

* **URL**

    /participant/:id

* **Method:**

    `PUT`
  
*  **URL Params**

   **Required:**
 
    `id=<integer>`

* **Data Params**

    JSON : 
    `
    {  
        "user_id" : <integer> , "exam_id" : <integer> 
    }`  

* **Success Response:**

  * **Code:** 200 <br />
    **Content:** `
    message: "Participante atualizado com sucesso", 
    data: `
    {  
        id : <integer>,
        user_id : <integer> , 
        exam_id : <integer> ,
        created_at : <timestamp>,
        updated_at : <timestamp>
    }`  
 
* **Error Response:**

  * **Code:** 401 UNAUTHORIZED <br />
    **Content:** `{ error : "Usuário não autorizado" }`

  OR

  * **Code:** 422 UNPROCESSABLE ENTITY <br />
    **Content:** `{ error : "Erro ao atualizar participante" }`


