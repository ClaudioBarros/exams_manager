**Deletar Prova**
----

Deleta dados referentes à uma única prova.

* **URL**

    /exam/:id

* **Method:**

    `DELETE`
  
*  **URL Params**

   **Required:**
 
    `id=[integer]`

* **Data Params**

    None

* **Success Response:**

  * **Code:** 200 <br />
    **Content:** `{Prova deletada com sucesso }`
 
* **Error Response:**

  * **Code:** 401 UNAUTHORIZED <br />
    **Content:** `{ error : "Usuário não autorizado" }`

  OR

  * **Code:** 422 UNPROCESSABLE ENTITY <br />
    **Content:** `{ message : "Erro ao deletar prova"}`
