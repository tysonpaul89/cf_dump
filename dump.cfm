<!--- cf_dump
Description:
------------
* cf_dump is a custom that mimics coldfusions cfdump tag.
* The output of the this custom tag can be saved in the hard disk as html  

syntax:	
------
<cf_dump var="#variableName#" name="filename" path="c:\test\">

Attributes:
----------
var(Required) 	- pass the variable through this attribute
name(optional) 	- Name of the output file name
				- Default name will be a uniqueid
path(optional)	- path where to save the output
				- default directory is c:\cfdump\, if folder is not present CF will create a folder

Author		:	Tyson
Created		: 	11-Jan-2016
--->

<cftry>
	
	<cfparam name="ATTRIBUTES.var" default="">
	<cfparam name="ATTRIBUTES.name" default="#getUniqueID()#">
	<cfparam name="ATTRIBUTES.path" default="C:/cfdump">
	
	<!--- Setting location to save file --->
	<!--- <cfset path = "C:/cfdump"> --->
	
	
	<!--- checking if path exists in Hard disk --->
	<cfif directoryExists(ATTRIBUTES.path)>
		
		<!--- Calling function save file --->
		<cfset saveDumpToFile(ATTRIBUTES.var,ATTRIBUTES.name,ATTRIBUTES.path)>
		
	<cfelse>
	
		<!--- Creates folder if not exist --->
		<cfdirectory action="create" directory="#ATTRIBUTES.path#">
		
		<!--- Calling function save file --->
		<cfset saveDumpToFile(ATTRIBUTES.var,ATTRIBUTES.name,ATTRIBUTES.path)>
		
	</cfif>
	
	<!--- Function saves dumpes data and then saves it into a file --->
	<cffunction name="saveDumpToFile">
		<cfargument name="data" type="any">
		<cfargument name="label" type="string">
		<cfargument name="location" type="string">
		
		<!--- Saving the Dumped data into variable --->
		<cfsavecontent variable="res">
			<cfdump var="#ARGUMENTS.data#">
		</cfsavecontent>
		
		<!--- Saving data into file --->
		<cffile action="write" file="#ARGUMENTS.location#/#ARGUMENTS.label#.html" output="#res#">
		
	</cffunction>
	
	
	<!--- Generates unique name to use as filename --->	
	<cffunction name="getUniqueID">
		<cfset rightNow = now()>
		<cfreturn (dateformat(rightNow,'yyyymmdd') & timeformat(rightNow,"HHmmss")&NumberFormat(TimeFormat(rightNow, "l"),"000"))>
	</cffunction>

<cfcatch>
	
	<cfset errorPath = 'c:/cfdump'>
	
	<cfif directoryExists(errorPath)>
		<!--- Saving Error into file --->
		<cffile action="write" file="#errorPath#/error.html" output="#cfcatch#">
	<cfelse>
	
		<!--- Creates folder if not exist --->
		<cfdirectory action="create" directory="#errorPath#">
		
		<!--- Saving Error into file --->
		<cffile action="write" file="#errorPath#/error.html" output="#cfcatch#">
		
	</cfif>

</cfcatch>
</cftry>
