**Listar Alternativas**
----
    
Lista todas as alternativas de todas as questões, ordenadas por questão. 

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
                   question_id : <integer>,
                   statement : <string>,
                   value : <boolean>,
                   created_at : <timestamp>,
                   updated_at : <timestamp>}, 
                    {...}, ...
                   ]}
 
* **Error Response:**

  * **Code:** 401 UNAUTHORIZED <br />
    **Content:** `{ error : "Usuário não autorizado" }`

