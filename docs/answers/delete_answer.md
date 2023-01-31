**Deletar Resposta**
----

Deleta uma única resposta.

* **URL**

    /user_answers/:id

* **Method:**

    `GET`
  
*  **URL Params**

   **Required:**
 
    `id=[integer]`

* **Data Params**

    None

* **Success Response:**

  * **Code:** 200 <br />
    **Content:** `{ message : "Resposta excluída com sucesso" }`
 
* **Error Response:**

  * **Code:** 401 UNAUTHORIZED <br />
    **Content:** `{ error : "Usuário não autorizado" }`
  OR

  * **Code:** 422 UNPROCESSABLE ENTITY <br />
    **Content:** `{ message : "Erro ao deletar resposta"}`

