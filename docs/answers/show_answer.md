**Exibir Resposta**
----

Retorna dados em formato json sobre uma única resposta de uma única questão. 

* **URL**

    /user_answer/:id

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
        user_id : <integer>,
        exam_id : <integer>,
        alternative_id : <integer>
        created_at : <timestamp>,
        updated_at : <timestamp>,
    }`

  * Caso resposta não exista: <br/>
    **Code:** 200 <br />
    **Content:** `{}`
 
* **Error Response:**

  * **Code:** 401 UNAUTHORIZED <br />
    **Content:** `{ error : "Usuário não autorizado" }`

