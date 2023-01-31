**Exibir Matéria**
----

Retorna dados em formato json sobre uma única matéria. 

* **URL**

    /topic/:id

* **Method:**

    `GET`
  
*  **URL Params**

   **Required:**
 
    `id=[integer]`

* **Data Params**

    None

* **Success Response:**

  * **Code:** 200 <br />
    **Content:** `
    data: `
    {  
        id: <integer>, 
        name : <string> , 
        created_at : <timestamp>,
        updated_at : <timestamp>
    }`  

  * Caso matéria não exista: <br/>
    **Code:** 200 <br />
    **Content:** `{}`
 
* **Error Response:**

  * **Code:** 401 UNAUTHORIZED <br />
    **Content:** `{ error : "Usuário não autorizado" }`


