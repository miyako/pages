---
layout: default
title: Home
---

## Code Highlight with Jekyll and Rouge

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

TEST
