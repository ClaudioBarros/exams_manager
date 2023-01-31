**Exibir Questão**
----

Retorna dados em formato json sobre uma única questão. 

* **URL**

    /questions/:id

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
        "id" : <integer>,
        "statement" : <string>,
        "created_at" : <timestamp>,
        "updated_at" : <timestamp>,
        "topic_id" : <integer>,
        "alternatives" : [
            {"id": <integer>}, {"id": <integer>}, {...}, ...
        ] 
    }`

  * Caso questão não exista: <br/>
    **Code:** 200 <br />
    **Content:** `{}`
 
* **Error Response:**

  * **Code:** 401 UNAUTHORIZED <br />
    **Content:** `{ error : "Usuário não autorizado" }`

