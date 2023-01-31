**Deletar Associação entre Prova e Questão**
----

Deleta a associação entre uma prova e uma questão.

* **URL**

    /exam_questions/:eid/:qid 

* **Method:**

    `DELETE`
  
*  **URL Params**

   **Required:**
 
    exam_id, `eid=[integer]` 
    question_id, `qid=[integer]`

* **Data Params**

    None

* **Success Response:**

  * **Code:** 200 <br />
    **Content:** `{ message : "Associação excluída com sucesso" }`
 
* **Error Response:**

  * **Code:** 401 UNAUTHORIZED <br />
    **Content:** `{ error : "Usuário não autorizado" }`
  OR

  * **Code:** 422 UNPROCESSABLE ENTITY <br />
    **Content:** `{ message : "Erro ao deletar associação"}`




