**Deletar Matéria**
----

Deleta uma única matéria. 

* **URL**

    /topic/:id

* **Method:**

    `DELETE`
  
*  **URL Params**

   **Required:**
 
    `id=[integer]`

* **Data Params**

    None

* **Success Response:**

  * **Code:** 200 <br />
    **Content:** `{ message : "Matéria excluída com sucesso" }`
 
* **Error Response:**

  * **Code:** 401 UNAUTHORIZED <br />
    **Content:** `{ error : "Usuário não autorizado" }`
  OR

  * **Code:** 422 UNPROCESSABLE ENTITY <br />
    **Content:** `{ message : "Erro ao deletar matéria"}`



