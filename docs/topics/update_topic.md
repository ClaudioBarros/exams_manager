**Atualizar Matéria**
----

Atualiza os dados de uma única matéria.

* **URL**

    /topic/:id

* **Method:**

    `PUT`
  
*  **URL Params**

   **Required:**
 
    `id=<integer>`

* **Data Params**
   
    JSON : 
    `
    {   
        "name" : <string>,  
    }`  

* **Success Response:**

  * **Code:** 200 <br />
    **Content:** `
    message: "Matéria atualizada com sucesso", 
    data: `{
        "id" : <integer>,
        "name" : <string>,  
        "created_at" : <timestamp>,
        "updated_at" : <timestamp>
    }`
 
* **Error Response:**

  * **Code:** 401 UNAUTHORIZED <br />
    **Content:** `{ error : "Usuário não autorizado" }`

  OR

  * **Code:** 422 UNPROCESSABLE ENTITY <br />
    **Content:** `{ error : "Erro ao atualizar matéria" }`


