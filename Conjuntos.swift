//Conjunto (Set)
//Conjunto no hay orden como tal

//condicion para agregar elementos
//Que sean ordenables/comparables

var letters = Set<Character>()
letters.count
letters.insert("a")
letters.insert("h")

var favoutiteGames : Set<String> = ["Final Fantasy". "WOW",
"Farcry"]
favoutiteGames.count

is favoutiteGames.isEmpty{
    print("No hay juegos favoritos")
}

favoutiteGames.insert("Metal Gear")

if let removedGame = fav.removedGame("Farcry"){
    print("He eliminado de la lista \(removedGame)")
}

if favoutiteGames.contains("Metal Gear"){
    print("Me gusta este juego")
}
//como los elementos son ordenables se aplica sorted
for vg in favoutiteGames.sorted() {
    print(vg)
}


//Iteraciones y operaciones

let oddDigits: Set = [1,3,5,7,9]
let evenDigits: Set = [0,2,4,6,8]
let primeDigits:  Set = [2,3,5,7]

//A union B
oddDigits.union(evenDigits).sorted()
//A interseccion B
oddDigits.intersection(evenDigits).sorted()
evenDigits.intersection(primeDigits).sorted()
oddDigits.intersection(primeDigits).sorted()

//A - B
oddDigits.substracting(primeDigits).sorted()
//diferencia simetrica
//A + B
oddDigits.symmetricDifference(primeDigits).sorted()

