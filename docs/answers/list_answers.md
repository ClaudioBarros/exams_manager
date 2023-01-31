**Listar Respostas**
----
    
Lista dados sobre todas as respostas de todos os usuários ordenados por usuário.

* **URL**
    
    /user_answers/
     
* **Method:**

    `GET` 
  
*  **URL Params**

    Nenhum

* **Data Params**

* **Success Response:**

  * **Code:** 200 <br />
    **Content:** `
    {
        {id : <integer>, 
         user_id : <integer> , 
         alternative_id : <integer>,
         created_at : <timestamp>,
         updated_at : <timestamp>},
         {...},
         ...
    }
    `
 
* **Error Response:**

  * **Code:** 401 UNAUTHORIZED <br />
    **Content:** `{ error : "Usuário não autorizado" }`

