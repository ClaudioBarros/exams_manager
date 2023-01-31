**Listar Matérias**
----
    
Lista todas as matérias. 

* **URL**
    
    /topics/
     
* **Method:**

    `GET` 
  
*  **URL Params**

    Nenhum

* **Data Params**
    
    Nenhum

* **Success Response:**

  * **Code:** 200 <br />
    **Content:** `{[
                    {id: <integer>, 
                    name : <string> , 
                    created_at : <timestamp>,
                    updated_at : <timestamp>},
                    {...}, 
                    ...
                   ]}
 
* **Error Response:**

  * **Code:** 401 UNAUTHORIZED <br />
    **Content:** `{ error : "Usuário não autorizado" }`


