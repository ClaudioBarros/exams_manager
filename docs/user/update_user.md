**Atualizar Usuário**
----
    
    Atualiza os dados de um único usuário. 

* **URL**

  /user/:id

* **Method:**

    `PUT`
  
*  **URL Params**

   **Required:**
 
   `id=<integer>`

* **Data Params**
    
    `{"name" : <string>, "email" : <string>, "password" : <string>, "admin": <boolean> }`

* **Success Response:**

  * **Code:** 200 <br />
    **Content:** `{ message : "Usuário atualizado com sucesso"}`
 
* **Error Response:**

  * **Code:** 401 UNAUTHORIZED <br />
    **Content:** `{ error : "Usuário não autorizado" }`

  OR

  * **Code:** 422 UNPROCESSABLE ENTRY <br />
    **Content:** `{ error : "Erro ao atualizar usuário" }`

