
esMultiploDeTres :: Int -> Bool
esMultiploDeTres x =  esMultiploDe 3 x

esMultiploDe :: Int -> Int -> Bool
esMultiploDe x y = (mod y x) == 0

cubo :: Float -> Float
cubo x = x * x * x

area :: Float -> Float -> Float
area base altura = base * altura

esBisiesto :: Int -> Bool
esBisiesto año = (esMultiploDe 400 año) || ((esMultiploDe 4 año) && (mod año 100 /= 0))

celsiusToFahr :: Float -> Float
celsiusToFahr c = (c * 9/5) + 32

fahrToCelsius :: Float -> Float
fahrToCelsius f = (f - 32) * 5/9

haceFrioF :: Float -> Bool
haceFrioF f = (fahrToCelsius f < 8)

mcm :: Int -> Int -> Int
mcm a b = gcd a b


