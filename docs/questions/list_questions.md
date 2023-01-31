**Listar Questões**
----

Retorna dados em formato json sobre todas as questões. 

* **URL**

    /questions/

* **Method:**

    `GET`
  
*  **URL Params**

    Nenhum

* **Data Params**

    Nenhum

* **Success Response:**

  * **Code:** 200 <br />
    **Content:** `{[
    {
        "id" : <integer>,
        "statement" : <string>,
        "created_at" : <timestamp>,
        "updated_at" : <timestamp>,
        "topic_id" : <integer>,
        "alternatives" : [
            {"id": <integer>}, {"id": <integer>}, {...}, ...
        ] 
    },
    {...}, 
    ...
    ]}`
 
* **Error Response:**

  * **Code:** 401 UNAUTHORIZED <br />
    **Content:** `{ error : "Usuário não autorizado" }`

