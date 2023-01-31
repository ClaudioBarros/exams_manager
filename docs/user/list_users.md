**Listar Usuários**
----
    Retorna em formato json uma lista com dados de todos os usuários.

* **URL**
    
    /users/

* **Method:**

    `GET` 
  
*  **URL Params**

    Nenhum

* **Data Params**

    Nenhum

* **Success Response:**

  * **Code:** 200 <br />
    **Content:** `{ [{id : <int>, name : <string>, email : <string>, admin : <boolean>}, ...] }`
 
* **Error Response:**

  * **Code:** 401 UNAUTHORIZED <br />
    **Content:** `{ error : "Usuário não autorizado" }`


