//%attributes = {}
$constants:=[]

For ($themeID_l; 1; 100)
	$notFound:=0
	$enough:=10  //more than 10 missing id's -> exit loop
	For ($i; 0; 1000)
		$token_t:=":K"+String:C10($themeID_l)+":"+String:C10($i)
		$parsed_t:=Parse formula:C1576("@"+$token_t; Formula out with tokens:K88:3)
		//remove "not a token" or obsolete
		If (Position:C15("‘"; $parsed_t; *)=1) || (Position:C15("@"; $parsed_t; *)=1) || (Position:C15("_o_"; $parsed_t; *)=1)
			$notFound+=1
			If ($notFound<$enough)
				continue
			Else 
				break
			End if 
		End if 
		$constants.push(Parse formula:C1576($parsed_t))
	End for 
End for 

$constants:=$constants.orderByMethod(Formula:C1597(methods_list))

SET TEXT TO PASTEBOARD:C523(JSON Stringify:C1217($constants))
