**Deletar Usuário**
----

    Deleta dados de um único usuário.

* **URL**

  /user/:id

* **Method:**

  `DELETE`
  
*  **URL Params**

   **Required:**
 
   `id=<integer>`

* **Data Params**

  Nenhum

* **Success Response:**

  * **Code:** 200 <br />
    **Content:** `{Usuário deletado com sucesso}`
 
* **Error Response:**

  * **Code:** 422 UNPROCESSABLE ENTITY <br />
    **Content:** `{ message : "Erro ao deletar usuário"}`

  OR

  * **Code:** 401 UNAUTHORIZED <br />
    **Content:** `{ error : "Usuário não autorizado" }`

