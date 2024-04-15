"# sample-api" 
Sample app for PHP-CRUD-API

**Features**

Basic usage of dbAuth, authorization, and multiTenancy middlewares


**note**: no front-end code, test in HTTP API client like Bruno [https://www.usebruno.com/] or Postman

**tables**
 - users : list of users. set the users role_id and office_id to activate.
 - roles : list of roles
 - offices : list of offices
 - reports : sample table linked to offices (office_id) and owner (created_by, i.e., users' id)

**views**

 - active_users : db view, joining users table with roles and offices
