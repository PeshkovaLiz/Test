<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta charset="utf-8" />
   <link rel="stylesheet" href="../bootstrap-3.3.7-dist/css/bootstrap.css" > 
   	<link rel="stylesheet" href="../bootstrap-3.3.7-dist/css/bootstrap-theme.css" >
	</head>
	<body>
	<cfscript> //sql-запрос находит пользователя с id
		EditQuery = QueryExecute('SELECT * FROM users WHERE IdUser=#id#', [], {datasource = 'AppUsers'});
	</cfscript>
	<div align="center" class="form-group">
		<h1>Edit User</h1>
		<legend></legend>
	<cfform id="edit" >
		<fieldset >
		<label style="margin-right:20px">E-mail</label>
		<cfinput type="text" name="Email" id="Email" required="true" message="Email" value="#EditQuery.Email#"/><br>
		
		<label style="margin-right:20px">Password</label>
		<cfinput type="text" name="Password" id="Password" required="true" message="Password" value="#EditQuery.Password#"/><br>
		
		<label style="margin-right:20px">First Name</label>
		<cfinput  type="text" name="FirstName" id="FirstName" required="true" message="First Name" value="#EditQuery.firstName#"/><br>
		
		<label style="margin-right:20px">Middle Name</label>
		<cfinput type="text" name="MidName" id="MidName" required="true" message="Middle Name" value="#EditQuery.middleName#"/><br>
		
		<label style="margin-right:20px">Last Name</label>
		<cfinput type="text" name="LastName" id="LastName" required="true" message="Last Name" value="#EditQuery.lastName#"/><br>
		
		<label style="margin-right:20px">Phone</label>
		<cfinput type="text" name="Phone" id="Phone" required="true" message="Phone" value="#EditQuery.Phone#"/><br>
		
		<label style="margin-right:20px">Registration date</label>
		<cfinput  type="text" validate = "eurodate" name="DateReg" id="DateReg" required="true" message="DateReg" value="#EditQuery.DateReg#"/><br>		
      </fieldset>
      <input type="submit" name="editSubmit" id="editSubmit" value="Submit"><br><br>
      	<p><a href="UsersDisplay.cfm">На главную</a></p>
	</cfform></div>
	<cfif structKeyExists(form, 'editSubmit')> <!---если нажата кнопка submit выполняется sql-запрос на изменение данных--->
		<cfquery datasource="AppUsers">
			UPDATE users SET Email="#form.Email#", Password="#form.Password#",
			firstName="#form.FirstName#", middleName="#form.MidName#", 
			lastName="#form.LastName#", Phone="#form.Phone#", DateReg="#form.DateReg#"
			WHERE IdUser=#id#;

	</cfquery>
   <cflocation url="UsersDisplay.cfm?edit=true" />
	</cfif>
	</body>
</html>