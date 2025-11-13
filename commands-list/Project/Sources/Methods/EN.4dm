//%attributes = {}
var $commands : Collection
$commands:=[]

For ($i; 1; 2000)
	
	$name:=Command name:C538($i)
	Case of 
		: ($name="")
			continue
		: ($name="_@")
			continue
		Else 
			$commands.push($name)
	End case 
End for 

$commands:=$commands.orderByMethod(Formula:C1597(methods_list))

SET TEXT TO PASTEBOARD:C523(JSON Stringify:C1217($commands))