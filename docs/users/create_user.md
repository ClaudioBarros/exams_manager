**Criar Usuário**
----
    
    Cria um único usuário. 

* **URL**

  /users/

* **Method:**

    `POST`
  
*  **URL Params**

    Nenhum

* **Data Params**
    
    `{"name" : <string>, "email" : <string>, "password" : <string>, "admin": <boolean> }`

* **Success Response:**

  * **Code:** 200 <br />
    **Content:** `{ message : "Usuário criado com sucesso" }`
 
* **Error Response:**

  * **Code:** 401 UNAUTHORIZED <br />
    **Content:** `{ error : "Usuário não autorizado" }`

  OR

  * **Code:** 422 UNPROCESSABLE ENTRY <br />
    **Content:** `{ error : "Erro ao criar usuário" }`

