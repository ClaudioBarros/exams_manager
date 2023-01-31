**Listar Participantes**
----
    
Lista todos os participantes, ordenados por prova. 

* **URL**
    
    /alternatives/
     
* **Method:**

    `GET` 
  
*  **URL Params**

    Nenhum

* **Data Params**

    Nenhum

* **Success Response:**

  * **Code:** 200 <br />
    **Content:** `{[{id : <integer>, 
                   user_id : <integer>,
                   exam_id : <integer>,
                   created_at : <timestamp>,
                   updated_at : <timestamp>},
                   {...}, 
                   ...
                   ]}
 
* **Error Response:**

  * **Code:** 401 UNAUTHORIZED <br />
    **Content:** `{ error : "Usuário não autorizado" }`


