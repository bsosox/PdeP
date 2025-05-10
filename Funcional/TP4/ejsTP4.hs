plegar f vb [] = vb
plegar f vb (x:xs) = f x (plegar f vb xs) 

--sumatoria :: Num a => [a] -> a
sumatoria [] = 0
sumatoria (x:xs) = (+) x (sumatoria xs)

longitud [] = 0
longitud (x:xs) = 1 + longitud(xs)

frecuenciaCardiaca :: [Int]
frecuenciaCardiaca = [80, 100, 120, 128, 130, 123, 125]

--promedioFrecuenciaCardiaca :: (Foldable t, Fractional a) => t a -> a Esto por alguna razon rompia todooo
promedioFrecuenciaCardiaca listaFrecuencias = sumatoria(listaFrecuencias) / longitud(listaFrecuencias)

frecuenciaCardiacaMinuto min = frecuenciaCardiaca !! (buscarFrecuencia min)

buscarFrecuencia min 
    | min == 0 = 0
    | min == 10 = 1
    | min == 20 = 2
    | min == 30 = 3
    | min == 40 = 4
    | min == 50 = 5
    | min == 60 = 6

frecuenciaHastaMomento :: Int -> [Int]
frecuenciaHastaMomento min = primerasNFrecuencias (buscarFrecuencia min) frecuenciaCardiaca 

primerasNFrecuencias n lista = take (n+1) frecuenciaCardiaca