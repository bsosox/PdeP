fst3 :: (a, b, c) -> a
fst3 (a, _, _) = a

snd3 :: (a, b, c) -> b
snd3 (_, b, _) = b

trd3 :: (a, b, c) -> c
trd3 (_, _, c) = c

aplicar :: ((Int -> b, Int -> d), Int) -> (b, d, Int)
aplicar ((f1, f2), num) = (f1 num, f2 num, num)

cuentaBizarra :: (Int, Int) -> Int
cuentaBizarra par = aplicarRegla par

aplicarRegla :: (Int, Int) -> Int
aplicarRegla (num1, num2)
    | num1 > num2 = suma num1 num2 
    | num2 - num1 > 10 = resta num2 num1
    | otherwise = producto num1 num2

suma x y = x + y
resta x y = x - y
producto x y = x * y

--data Notas = Notas Int Int     deriving (Show, Eq)

esNotaBochazo :: Int -> Bool
esNotaBochazo nota = nota < 6

aprobo :: (Int, Int) -> Bool
aprobo (nota1, nota2) = not (esNotaBochazo(nota1)) && not (esNotaBochazo(nota2))

promociono :: (Int, Int)  -> Bool
promociono notas = (aprobo notas) && aptoPromocion(notas)

aptoPromocion :: (Int, Int)  -> Bool
aptoPromocion (nota1, nota2) = nota1 >= 7 && nota2 >= 7 && (suma nota1 nota2 >= 15) 

aproboPrimerParcial :: (Int, Int) -> Bool
aproboPrimerParcial (nota1, nota2) = not (esNotaBochazo(nota1))

--data NotasTotales = NotasTotales (Int, Int)  (Int, Int) 

notasFinales :: ((Int, Int), (Int, Int)) -> (Int, Int)
notasFinales ((parcial1, parcial2), (recup1, recup2)) = (mejorNota (parcial1, recup1), mejorNota (parcial2, recup2))

mejorNota :: (Int, Int) -> Int
mejorNota (parcial1, recup1)
    | (recup1 == -1) || parcial1 > recup1  = parcial1
    | otherwise = recup1

recursa :: ((Int, Int), (Int, Int)) -> Bool
recursa notas = not (aprobo . notasFinales $ notas)

recuperoPrimerParcial ::  ((Int, Int), (Int, Int)) -> Bool
recuperoPrimerParcial notas = ((fst . snd $ notas) /= (-1))