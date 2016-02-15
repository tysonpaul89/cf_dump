# cf_dump
Coldfusion custom tag  to cfdump into a html file

Description:
------------
* cf_dump is a custom that mimics coldfusions cfdump tag.
* The output of the this custom tag can be saved in the hard disk as html  

Install:
--------
You must store custom tag file in any one of the following:

* The same directory as the calling page
* The cfusion\CustomTags directory
* A subdirectory of the cfusion\CustomTags directory
* A directory that you specify in the ColdFusion Administrator

syntax:	
------
<cf_dump var="#variableName#" name="filename" path="c:\test\">

Attributes:
----------
var(Required)
* pass the variable through this attribute

name(optional) 	
* Name of the output file name
* Default name will be a uniqueid

path(optional)
* path where to save the output
* default directory is c:\cfdump\, if folder is not present CF will create a folder
