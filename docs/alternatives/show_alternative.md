**Exibir Alternativa**
----

Retorna dados em formato json sobre uma única alternativa de uma única questão. 

* **URL**

    /alternative/:id

* **Method:**

    `GET`
  
*  **URL Params**

   **Required:**
 
    `id=[integer]`

* **Data Params**

    None

* **Success Response:**

  * **Code:** 200 <br />
    **Content:** `{ 
        id : <integer>,
        question_id : <integer,
        statement : <string>,
        value : <boolean>
        created_at : <timestamp>,
        updated_at : <timestamp>,
    }`

  * Caso alternativa não exista: <br/>
    **Code:** 200 <br />
    **Content:** `{}`
 
* **Error Response:**

  * **Code:** 401 UNAUTHORIZED <br />
    **Content:** `{ error : "Usuário não autorizado" }`

