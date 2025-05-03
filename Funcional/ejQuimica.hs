data Sustancia 
    = Elemento String String Int String 
    | Compuesto String [(Sustancia, Int)]
    deriving (Show, Eq)

hidrogeno = Elemento "Hidrogeno" "H" 1 "NoMetal"
oxigeno = Elemento "Oxigeno" "O" 6 "Gas"

agua = Compuesto "Agua" [(hidrogeno, 2), (oxigeno, 1)]

nombreDeUnion :: Elemento -> String
nombreDeUnion (Elemento nombre _ _ _ _) = (++"uro") . sinVocalesAlFinal(nombre)

sinVocalesAlFinal :: String -> String
sinVocalesAlFinal nombre = reverse . dropWhile esVocal . reverse $ nombre

esVocal = elem "aeiouAEIOU"
