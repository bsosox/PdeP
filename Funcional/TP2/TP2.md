Funcional 2: 
Aplicación Parcial y Composición
Aplicación Parcial
Nota previa Hay aplicación parcial cuando a una función la evaluamos con menor cantidad de argumentos con la que está definida. 
Veamos un Ejemplo: 
La función (*) recibe dos enteros como argumento y devuelve el resultado de la multiplicación. 
(*)::Int->Int->Int 
Si queremos aplicar la función (*) con un solo argumento nos quedaría: 
(2*) Esto nos devuelve una función que es (Int->Int), recibe un entero y devuelve otro entero. 
Si esta última función la aplico sobre un entero, nos devuelve otro entero como resultado Ej: Main> (2*) 9 18 