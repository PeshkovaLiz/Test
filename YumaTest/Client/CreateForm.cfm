		<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta charset="utf-8" />
	<link rel="stylesheet" href="../css/theme.blue.css" >
   <link rel="stylesheet" href="../bootstrap-3.3.7-dist/css/bootstrap.css" > 
   	<link rel="stylesheet" href="../bootstrap-3.3.7-dist/css/bootstrap-theme.css" >
	</head>
	<body>
		<div align=center class="container">
		<h1>Create a new user</h1>
			<cfform id="createUser" preservedata="true" class="form-horizontal"> <!---форма создания нового пользователя--->
			<fieldset style="width:500px">
				<legend></legend>

				<dl>

					<label >E-mail</label>
					<cfinput    name="Email" id="Email" required="true" validateAt="onSubmit" placeholder="Enter E-mail" /><br>

					<label >Password</label>
					<cfinput  name="Password" id="Password" required="true" validateAt="onSubmit" placeholder="Enter password" /><br>

					<label  >First Name</label>
					<cfinput  name="FirstName" id="FirstName" required="true" validateAt="onSubmit" placeholder="Enter first name"/><br>

					<label  >Middle Name</label>
					<cfinput name="MidName" id="MidName" required="true"  validateAt="onSubmit" placeholder="Enter middle name"/><br>
					
					<label  >Last Name</label>
					<cfinput  name="LastName" id="LastName" required="true"  validateAt="onSubmit" placeholder="Enter last name"/><br>
					
					<label  >Phone</label>
					<cfinput name="Phone" id="Phone" required="true" validateAt="onSubmit" placeholder="Enter phone"/><br>
					
				</dl>
				<input type="submit" name="createSubmit" id="createSubmit" value="Create" />
				<p><a href="UsersDisplay.cfm">На главную</a></p>
			</fieldset>
				</cfform>
	</div>
	<cfif structKeyExists(form, 'createSubmit')>  <!---если нажата кнопка submit выполняется sql-запрос на ввод данных--->
		<cfquery datasource="AppUsers" >
		INSERT INTO users (Email, Password, firstName, middleName, lastName, Phone, DateReg) 
					VALUES ("#form.Email#","#form.Password#", "#form.FirstName#", "#form.MidName#",
					 "#form.LastName#", "#form.Phone#", CURRENT_DATE)
	</cfquery>
	<cflocation url="UsersDisplay.cfm?add=true" />
	</cfif>
	</body>
	</html>
