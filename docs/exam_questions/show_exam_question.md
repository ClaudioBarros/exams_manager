**Exibir Associação entre Prova e Questão**
----

Retorna dados em formato json sobre uma única associação entre prova e questão. 

* **URL**

    /exam_questions/:eid/:qid

* **Method:**

    `GET`
  
*  **URL Params**

   **Required:**
 
    exam_id, `eid=[integer]` \
    question_id, `qid=[integer]`\

* **Data Params**

    None

* **Success Response:**

  * **Code:** 200 <br />
    **Content:** `
    {
        id : <integer>, 
        exam_id : <integer>,
        question_id : <integer>,
        created_at : <timestamp>,
        updated_at : <timestamp>
    }`

  * Caso participante não exista: <br/>
    **Code:** 200 <br />
    **Content:** `{}`
 
* **Error Response:**

  * **Code:** 401 UNAUTHORIZED <br />
    **Content:** `{ error : "Usuário não autorizado" }`

