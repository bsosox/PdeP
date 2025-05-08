multipl [] = 1
multipl (x:xs) = x * multipl xs 

longitud [] = 0
longitud (x:xs) = 1 + longitud xs 

concatenacion [] = []
concatenacion (xs:xss) = xs ++ concatenacion xss 

-- funcion [] = valor base VB
-- funcion (x:xs) = operacion OP x funcion xs 

plegar f vb [] = vb
plegar f vb (x:xs) = f x (plegar f vb xs) 

-- puedo definidir sumatoria multiplicacion y concatenacion en funcion de plegar

sumatoria2 lista = plegar (+) 0 lista
productoria2 lista = plegar (+) lista
concatenacion2 lista = plegar (++) lista

filtrar :: (a->Bool) -> [a] -> [a]

filtrar condicion [] = []
filtrar condicion (x:xs) 
 | condicion x = x : filtrar condicion xs
 | otherwise = filtrar condicion xs 

mapear :: (a->b) -> [a] -> [b]
mapear funcion [] = []
mapear funcion (x:xs) = funcion x : mapear funcion xs 

todosCumplen :: (a->Bool) -> [a] -> Bool
todosCumplen [] = True
todosCumplen condicion (x:xs) = condicion x && todosCumplen condicion xs

algunosCumplen :: (a->Bool) -> [a] -> Bool
algunosCumplen [] = True
algunosCumplen condicion (x:xs) = condicion x || algunosCumplen condicion xs