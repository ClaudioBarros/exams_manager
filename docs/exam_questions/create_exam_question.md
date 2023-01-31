**Criar Associação entre Prova e Questão**
----

Cria uma única associação entre uma prova e uma questão.

* **URL**

    /exam_questions/

* **Method:**

    `POST`
  
*  **URL Params**

    Nenhum

* **Data Params**
   
    JSON : 
    `
    {  
        "exam_id" : <integer> , "question_id" : <integer> 
    }`  

* **Success Response:**

  * **Code:** 200 <br />
    **Content:** `
    message: "Associação criada com sucesso", 
    data: `
    {  
        id : <integer>,
        exam_id : <integer> ,
        question_id : <integer> , 
        created_at : <timestamp>,
        updated_at : <timestamp>
    }`  
 
* **Error Response:**

  * **Code:** 401 UNAUTHORIZED <br />
    **Content:** `{ error : "Usuário não autorizado" }`

  OR

  * **Code:** 422 UNPROCESSABLE ENTITY <br />
    **Content:** `{ error : "Erro ao criar associação" }`




