**Exibir Usuário**
----

    Retorna dados em formato json sobre um único usuário.

* **URL**

  /user/:id

* **Method:**

  `GET`
  
*  **URL Params**

   **Required:**
 
   `id=<integer>`

* **Data Params**

  Nenhum

* **Success Response:**

  * **Code:** 200 <br />
    **Content:** `{ id : <int>, name : <string>, email : <string>, admin : <boolean }`
 
* **Error Response:**

  * **Code:** 200 <br />
    **Content:** `empty data`

  OR

  * **Code:** 401 UNAUTHORIZED <br />
    **Content:** `{ error : "Usuário não autorizado" }`

