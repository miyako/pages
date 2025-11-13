//%attributes = {"invisible":true,"preemptive":"capable"}
#DECLARE($item : Object)

$item.result:=($item.value>$item.value2)

If (($item.value+"@")=$item.value2)
	$item.result:=(Length:C16($item.value)<Length:C16($item.value2))
End if 
