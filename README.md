"# sample-api" 
Sample app for PHP-CRUD-API [https://github.com/mevdschee/php-crud-api]

**Features**

Basic usage of dbAuth, authorization, and multiTenancy middlewares


**note**: no front-end code, test in HTTP API client like Bruno [https://www.usebruno.com/] or Postman [https://www.postman.com/downloads/]

**tables**
 - users : list of users. set the users role_id and office_id directly in the db to activate.
 - roles : list of roles
 - offices : list of offices
 - reports : sample table linked to offices (office_id) and owner (created_by, i.e., users' id)

**views**

 - active_users : db view, joining users table with roles and offices


[Db Authentication Methods](https://github.com/mevdschee/php-crud-api?tab=readme-ov-file#database-authentication)


| Action 	| HTTP 	| URL 	|
|---	|---	|---	|
| Create 	| POST 	| /records/<resource> 	|
| List 	| GET 	| /records/<resource> 	|
| Read 	| GET 	| /records/<resource>/<id> 	|
| Update 	| PUT 	| /records/<resource>/<id> 	|
| Delete 	| DELETE 	| /records/<resource>/< 	|