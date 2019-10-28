<cfcomponent>           <!---НЕ ИСПОЛЬЗУЕТСЯ!--->
<!---добавление--->
	<cffunction name="addUser" access="public" output="false" returntype="void">
		<cfargument name="FirstName" type="string" required="true" />
		<cfargument name="MiddleName" type="string" required="true" />
		<cfargument name="LastName" type="string" required="true" />
		<cfargument name="Phone" type="string" required="true" />

		<cfquery  >
			INSERT INTO users
			(firstName, middleName, lastName, Phone)
			VALUES
			(
				<cfqueryparam value="#form.FirstName#" cfsqltype="cf_sql_varchar" />,
				<cfqueryparam value="#form.MidName#" cfsqltype="cf_sql_varchar" />,
				<cfqueryparam value="#form.LastName#" cfsqltype="cf_sql_varchar" />,
				<cfqueryparam value="#form.Phone#" cfsqltype="cf_sql_varchar" />
			)
		</cfquery>
	</cffunction>
	
		<!---метод getUserByID()--->
	<cffunction name="getUserByID" access="public" output="false" returntype="query">
		<cfargument name="IdUser" type="numeric" required="true" />
		<cfset var User = '' />
		<cfquery  name="User">
			SELECT *
			FROM users
			WHERE IdUser = <cfqueryparam value="#arguments.UserId#" cfsqltype="cf_sql_integer" /> 
		</cfquery>
		<cfreturn User />
	</cffunction>
			<!---метод Get Users()--->
		<cffunction name="getUsers" returntype="Query">
			<cfquery name="local.getUsers">
				SELECT *
				FROM users
			</cfquery>
			<cfreturn local.getUsers/>
		</cffunction> 
	
	<!---редактирование--->
	<cffunction name="updateUser" access="public" output="false" returntype="void">
		<cfargument name="FirstName" type="string" required="true" />
		<cfargument name="MiddleName" type="string" required="true" />
		<cfargument name="LastName" type="string" required="true" />
		<cfargument name="Phone" type="string" required="true" />
		<cfquery>
			UPDATE users
			SET
			FirstName = <cfqueryparam value="#arguments.FirstName#" cfsqltype="cf_sql_varchar" />,
			MiddleName = <cfqueryparam value="#arguments.MiddleName#" cfsqltype="cf_sql_varchar" />,
			LastName = <cfqueryparam value="#arguments.LastName#" cfsqltype="cf_sql_varchar" />,
			Phone = <cfqueryparam value="#arguments.Phone#" cfsqltype="cf_sql_varchar" />,
			WHERE IdUser = <cfqueryparam value="#arguments.IdUser#" cfsqltype="cf_sql_integer" />
		</cfquery>
	</cffunction>
			<!---удаление--->
		<cffunction name="deleteUser" returntype="void">
			<cfargument name="IdUser" type="numeric" required="true" />
			<cfquery>
				DELETE FROM users
				WHERE IdUser = <cfqueryparam value="#arguments.IdUser#" cfsqltype="cf_sql_integer" />
			</cfquery>
		</cffunction>
	
</cfcomponent>