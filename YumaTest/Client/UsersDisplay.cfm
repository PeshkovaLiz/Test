	
<html >
	
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta charset="utf-8" />
	<link rel="stylesheet" href="../css/theme.blue.css" >
	<script type="text/javascript" src="../js/jquery-3.4.1.js" ></script>
    <script type="text/javascript" src="../js/jquery.tablesorter.js" ></script>
    <script type="text/javascript" src="../js/filter.js" ></script>
   <link rel="stylesheet" href="../bootstrap-3.3.7-dist/css/bootstrap.css" > 
   	<link rel="stylesheet" href="../bootstrap-3.3.7-dist/css/bootstrap-theme.css" >
	</head>
<body>
	  <div class="container">
<br>
<cfif structKeyExists(url,'delete') >
	<cfquery datasource="AppUsers" >
		DELETE FROM users WHERE (IdUser=#delete#)
	</cfquery>
	<script>
	window.alert("User deleted!");
	</script>
</cfif>
<cfif structKeyExists(url,'add') >
	<script>
	window.alert("User created!");
	</script>
	</cfif>
<cfif structKeyExists(url,'edit') >
	<script>
	window.alert("User edited!");
	</script>
</cfif>
<script >
	window.onload=Sort();
</script>
<script>
		function confirmDelete(IdUser)   //подтверждение удаления
		{
			if(window.confirm('Are you sure you want delete this user?'))
			{
				window.location.href = 'UsersDisplay.cfm?delete='+IdUser;
			}
			else
			{
				null;
			}
		}
	
	</script>
	<script>
	$(function Sort() {
    $("#usersTable").tablesorter({ sortList: [[0,0], [1,0]] });
    });
   </script>
  <br>
<div class="col-md-12" >
	<h4><a href="CreateForm.cfm">Create new</a></h4>
  <input type="text" id="myInput" onkeyup="Filter()" placeholder="Search for ...">
<select id=filterselect  class="btn btn-default dropdown-toggle">  <!---выпадающий список параметра фильтрации--->
	<option value=0>First name</option>  <!---value соответствует индексу столбца таблицы--->
	<option value=1>Middle name</option>
	<option value=2>Last name</option>
	<option value=3>Phone</option>
</select><br><br>

<table cellpadding="5px" border="solid" align="center" class="table table-striped table-hover active tablesorter-blue" id="usersTable">

	<thead><tr>
		<th>First name</th>
		<th>Middle name</th>
		<th>Last name</th>
		<th>Phone</th>
		<th>Registration date</th>
		<th>&nbsp;</th>
		<th>&nbsp;</th>	
		</tr>
	</thead>
	<tbody>	
		<cfscript>
			for(row in UserOutput())  
			writeOutput( '<tr>
			<td> #row.firstName#</td>
			<td> #row.middleName#</td>
			<td> #row.lastName#</td>
			<td> #row.phone#</td>
			<td> #row.DateReg#</td>
			<td><a href="EditForm.cfm?id=#row.IdUser#">Редактировать</a></td>
			<td><a href="javascript:confirmDelete(#row.IdUser#);">Удалить</a></td>
			</tr>');
		</cfscript>
	</tbody>

	</table></div>


<cfscript>
public query function UserOutput(){   //функция вывода пользователей
	 OutputQuery = QueryExecute('SELECT * FROM users', [], {datasource = 'AppUsers'});
	 return OutputQuery;
   
}
</cfscript>
</div>
</body>
</html>	

