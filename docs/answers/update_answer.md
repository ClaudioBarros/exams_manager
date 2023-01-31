**Atualizar Resposta**
----

Atualiza os dados de uma única resposta.

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
        "id" : <integer>,
        "user_id" : <integer> , 
        "exam_id" : <integer>, 
        "alternative_id" : <boolean>
    }

* **Success Response:**

  * **Code:** 200 <br />
    **Content:** `
    message: "Resposta atualizada com sucesso", 
    data: `{
        "id" : <integer>,
        "user_id" : <integer> , 
        "exam_id" : <integer>, 
        "alternative_id" : <boolean>,
        "created_at" : <timestamp>,
        "updated_at" : <timestamp>
    }`
 
* **Error Response:**

  * **Code:** 401 UNAUTHORIZED <br />
    **Content:** `{ error : "Usuário não autorizado" }`

  OR

  * **Code:** 422 UNPROCESSABLE ENTITY <br />
    **Content:** `{ error : "Erro ao atualizar resposta" }`

