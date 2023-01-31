**Criar Participante**
----

Cria um único participante .

* **URL**

    /participants/

* **Method:**

    `POST`
  
*  **URL Params**

    Nenhum

* **Data Params**
   
    JSON : 
    `
    {  
        "user_id" : <integer> , "exam_id" : <integer> 
    }`  

* **Success Response:**

  * **Code:** 200 <br />
    **Content:** `
    message: "Participante criado com sucesso", 
    data: `
    {  
        id : <integer>,
        user_id : <integer> , 
        exam_id : <integer> ,
        created_at : <timestamp>,
        updated_at : <timestamp>
    }`  
 
* **Error Response:**

  * **Code:** 401 UNAUTHORIZED <br />
    **Content:** `{ error : "Usuário não autorizado" }`

  OR

  * **Code:** 422 UNPROCESSABLE ENTITY <br />
    **Content:** `{ error : "Erro ao criar participante" }`



