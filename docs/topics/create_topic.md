**Criar Matéria**
----

Cria uma única matéria.

* **URL**

    /topics/

* **Method:**

    `POST`
  
*  **URL Params**

    Nenhum

* **Data Params**
   
    JSON : `{"name" : <string>}`  

* **Success Response:**

  * **Code:** 200 <br />
    **Content:** `
    message: "Matéria criada com sucesso", 
    data: `
    {  
        id: <integer>, 
        name : <string> , 
        created_at : <timestamp>,
        updated_at : <timestamp>
    }`  
 
* **Error Response:**

  * **Code:** 401 UNAUTHORIZED <br />
    **Content:** `{ error : "Usuário não autorizado" }`

  OR

  * **Code:** 422 UNPROCESSABLE ENTITY <br />
    **Content:** `{ error : "Erro ao criar matéria." }`



