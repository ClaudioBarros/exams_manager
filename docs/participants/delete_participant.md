**Deletar Participante**
----

Deleta dados referentes à um participante.

* **URL**

    /participants/:id

* **Method:**

    `DELETE`
  
*  **URL Params**

   **Required:**
 
    `id=[integer]`

* **Data Params**

    None

* **Success Response:**

  * **Code:** 200 <br />
    **Content:** `{ message : "Participante excluído com sucesso" }`
 
* **Error Response:**

  * **Code:** 401 UNAUTHORIZED <br />
    **Content:** `{ error : "Usuário não autorizado" }`
  OR

  * **Code:** 422 UNPROCESSABLE ENTITY <br />
    **Content:** `{ message : "Erro ao deletar participante"}`



