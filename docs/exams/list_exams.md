**Listar Provas**
----
    
Lista dados sobre todas as provas.

* **URL**
    
    /exams/
     
* **Method:**

    `GET` 
  
*  **URL Params**

    Nenhum

* **Data Params**

* **Success Response:**

  * **Code:** 200 <br />
    **Content:** `{{id : <integer>, 
                   name : <string>,
                   created_at : <timestamp>,
                   updated_at : <timestamp>,
                   questions : [
                    {...}, {...}, {...}
                   ]}, {...}, ...}`
 
* **Error Response:**

  * **Code:** 401 UNAUTHORIZED <br />
    **Content:** `{ error : "Usuário não autorizado" }`

