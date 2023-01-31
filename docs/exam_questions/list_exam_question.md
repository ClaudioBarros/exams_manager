**Listar Associações entre Provas e Questões**
----
    
Lista todas as associações entre provas e questões, ordenadas por prova. 

* **URL**
    
    /exam_questions/
     
* **Method:**

    `GET` 
  
*  **URL Params**

    Nenhum

* **Data Params**

    Nenhum

* **Success Response:**

  * **Code:** 200 <br />
    **Content:** `{[{id : <integer>, 
                   exam_id : <integer>,
                   question_id : <integer>,
                   created_at : <timestamp>,
                   updated_at : <timestamp>},
                   {...}, 
                   ...
                   ]}
 
* **Error Response:**

  * **Code:** 401 UNAUTHORIZED <br />
    **Content:** `{ error : "Usuário não autorizado" }`



