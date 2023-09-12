## HTTP Methods
HTTP defines a set of request methods to indicate the desired action to be performed for a given resource.

There are various HTTP Request Methods:

1. **GET**:
   - To retrieve data from the server.
   - Example:
     ```shell
     curl -X GET http://example.com/api/user/123
     ```

2. **POST**:
   - Send input data to the server, often used for creating new resources.
   - Example:
     ```shell
     curl -X POST http://example.com/api/users -H "Content-Type: application/json" -d '{"name": "John Doe", "email": "johndoe@example.com"}'
     ```

3. **HEAD**:
   - Exactly like GET, but the server only responds with Headers.
   - Example:
     ```shell
     curl -X HEAD http://example.com/api/user/123
     ```

4. **PUT**:
   - Write documents to the server.
   - Example:
     ```shell
     curl -X PUT http://example.com/api/user/123 -H "Content-Type: application/json" -d '{"name": "Updated John Doe", "email": "updated@example.com"}'
     ```

5. **DELETE**:
   - Deletes a resource from the server.
   - Example:
     ```shell
     curl -X DELETE http://example.com/api/user/123
     ```

6. **OPTIONS**:
   - Asks the server which methods it supports for a resource.
   - Example:
     ```shell
     curl -X OPTIONS http://example.com/api/user/123
     ```

7. **TRACE**:
   - Echos the received request from the Web Server.
   - Example:
     ```shell
     curl -X TRACE http://example.com/path/to/resource
     ```

## Http headers
- https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Accept


## HTTP Response Status Code

There are various HTTP Response Status Codes:

- **100-199** - Informational Status Codes
- **200-299** - Success Status Codes
- **300-399** - Redirection Status Codes
- **400-499** - Client Error Status Codes
- **500-599** - Server Error Status Codes

### 11.1 - 200 status code

A **200 status code** indicates that the action received by the client is:

- Received
- Understood
- Accepted
- Processed

**Examples:**

- `200 OK`
- `206 Partial Content`

### 11.2 - 300 status code

The **300 series status code** indicates that the client must take additional steps to complete the request. These codes are generally used for URL redirection.

**Examples:**

- `301 Moved Permanently`
- `304 Not Modified`

### 11.3 - 400 status code

A **400 series status code** indicates that the client seems to have sent some request that is not ideal or has encountered an error.

**Examples:**

- `401 Unauthorized`
- `403 Forbidden`
- `404 Page Not Found`

### 11.4 - 500 status code

The **500 series status code** indicates that the issue is on the server-side, and it has failed to fulfill the request.

**Examples:**

- `500 Internal Server Error`
- `504 Gateway Timeout`
- `503 Service Unavailable`

#### Additional Information

- Each HTTP status code has a specific purpose and helps clients and servers communicate the outcome of a request effectively.
- Status codes in the 200-299 range generally indicate success, while those in the 300-399 range signify redirection, and those in the 400-499 range indicate client errors. The 500-599 range is for server errors.
- It's important to note that status codes are accompanied by a human-readable status message in the response, which provides more detailed information about the status of the request.

Understanding HTTP status codes is crucial for diagnosing and troubleshooting issues when working with web applications and APIs.
