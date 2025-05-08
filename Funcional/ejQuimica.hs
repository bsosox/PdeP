data Sustancia = Elemento String String Int Grupo | Compuesto String [(Sustancia, Int)]
    deriving (Show, Eq)

data Grupo
    = Metal
    | NoMetal
    | Gas
    | Halogeno
    deriving (Show, Eq)

data Medio = Calor | Electricidad deriving (Show, Eq)

hidrogeno = Elemento "Hidrogeno" "H" 1 NoMetal
oxigeno = Elemento "Oxigeno" "O" 6 Gas

agua = Compuesto "Agua" [(hidrogeno, 2), (oxigeno, 1)]

--nombreDeUnion :: Elemento -> String
nombreDeUnion elemento = sinVocalesAlFinal(nombre elemento) ++ "uro" 

sinVocalesAlFinal :: String -> String
sinVocalesAlFinal nombre = reverse . (dropWhile esVocal) . reverse $ nombre

esVocal letra = elem letra  "aeiouAEIOU"

nombre :: Sustancia -> String
nombre (Elemento nombre _ _ _) = nombre 

conduceBien :: Sustancia -> Medio -> Bool
conduceBien sust Calor = conduceBienCalor sust
--conduceBien sust Electricidad = conduceBienElectricidad sust

conduceBienCalor (Elemento _ _ _ grupo) = grupo == Metal

combinarDosNombres :: Sustancia -> Sustancia -> String
combinarDosNombres elemento1 (Elemento nombre2 _ _ _) = (nombreDeUnion elemento1) ++ " de " ++ nombre2
