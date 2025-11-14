---
layout: default
---

# Code Highlight with Jekyll and Rouge

## Example FR

```4d
var $commands : Collection
$commands:=[]

Boucle ($i; 1; 2000)
	$name:=Nom commande($i)
	Au cas ou 
		: ($name="")
			continue
		: ($name="_@")
			continue
		Sinon 
			$commands.push($name)
	Fin de cas 
Fin de boucle 

$commands:=$commands.orderByMethod(Formule(methods_list))
$uppercase:=$commands.filter(Formule(Trouver regex("^[\\p{Lu} 0-9]+$"; $1.value; 1)))
$lowercase:=$commands.filter(Formule(Trouver regex("\\p{Ll}"; $1.value; 1)))
FIXER TEXTE DANS CONTENEUR(JSON Stringify($lowercase))
```

## Example EN

```4d
$constants:=[]

For ($themeID_l; 1; 100)
    $notFound:=0
    $enough:=10  //more than 10 missing id's -> exit loop
    For ($i; 0; 1000)
        $token_t:=":K"+String($themeID_l)+":"+String($i)
        $parsed_t:=Parse formula("@"+$token_t; Formula out with tokens)
        //remove "not a token" or obsolete
        If (Position("‘"; $parsed_t; *)=1) || (Position("@"; $parsed_t; *)=1) || (Position("_o_"; $parsed_t; *)=1)
            $notFound+=1
            If ($notFound<$enough)
                continue
            Else 
                break
            End if 
        End if 
        $constants.push(Parse formula($parsed_t))
    End for 
End for 

$constants:=$constants.orderByMethod(Formula(methods_list))

SET TEXT TO PASTEBOARD(JSON Stringify($constants))
```
