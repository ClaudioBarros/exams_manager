**Atualizar Prova**
----

Atualiza dados referentes à uma única prova.

* **URL**

    /exam/:id

* **Method:**

    `PUT`
  
* **URL Params**

    **Required:**

    `id=[integer]`

* **Data Params**
   
    JSON : 
    `
    {   
        "name" : <string>,  
        "topic_id" : <integer>,  
        "questions" : [  
            {"id": <integer>}, {"id": <integer>}, {...}, ...  
        ]  
    }`  

* **Success Response:**

  * **Code:** 200 <br />
    **Content:** `
    {
        "name" : <string>,\ 
        "topic_id" : <integer>,\
        "questions" : [\
            {"id": <integer>}, {"id": <integer>}, {...}, ...
        ] 
    }`
 
* **Error Response:**

  * **Code:** 401 UNAUTHORIZED <br />
    **Content:** `{ error : "Usuário não autorizado" }`

  OR

  * **Code:** 422 UNPROCESSABLE ENTITY <br />
    **Content:** `{ error : "Erro ao atualizar prova" }`

