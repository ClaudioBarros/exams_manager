**Autenticação**
----

Gera um JSON Web Token para autenticação.

* **URL**

    /authenticate/

* **Method:**

    `POST`
  
*  **URL Params**

    Nenhum

* **Data Params**
   
    JSON : 
    `
    {  
        "email" : <integer> , 
        "password" : <string>
    }`  

* **Success Response:**

  * **Code:** 200 <br />
    **Content:** `
    data: `{ auth_token : <string> }`  
 
* **Error Response:**

  * **Code:** 422 UNPROCESSABLE ENTITY <br />
    **Content:** `{ error : "Credenciais inválidas" }`


