import UIKit

//si no se coloca default da error
//debe ser exahustivo y cubrir todos los casos posibles
let letra: Character = "z"
switch value {
    case "a":
        print("Es la primera letra del alfabeto")
    case "z"
        print("Es la última letra del alfabeto")
    default:
        print("Es alguna otra letra")
}

//switch usando rangos

let moons = 62
let phrase = " lunas en Saturno"
let naturalCount : String
switch moons {
    case 0:
        naturalCount = "No hay"
    case 1..<5:
        naturalCount = "Hay unas pocas"
    case 5..<12:
        naturalCount = "Hay bastantes"
    case 12..<100:
        naturalCount = "Hay decenas de"
    case 100..<1000:
        naturalCount = "Hay centenares de"
    default:
        naturalCount = "Hay muchisimas"
}
print("\(naturalCount) \(phrase)")

//Switch con tuplas
let somePoint = (1,1)
switch somePoint {
    case (0,0):
        print("El punto \(somePoint) es el origen de las coordenadas")
    //no toma en cuenta el primer valor
    case (_,0):
        print("El punto \(somePoint) se encuentra sobre el eje x")
    case (0,_):
        print("El punto \(somePoint) se encuentra sobre el eje y")
    //con rangos en ambos puntos
    case(-2...2,-2...2):
        print("El punto \(somePoint) se encuentra en el interior de lado 4")
    default:
        print("El punto \(somePoint) esta en otro lugar")
}
//recuperando un valor y evaluando el otro
let anotherPoint = (2,0)
switch anotherPoint {
    case (let x, 0):
        print("Sobre el eje de las x, con valor de \(x)")
    case (0, let y):
        print("Sobre el eje de las y, con valor de \(y)")
    //recupera ambos valores y compara si son iguales
    case let (x,y) where x == y:
        print("El punto se encuentra sobre la recta x = y")
    case let (x,y) where x == -y:
        print("El punto se encuentra sobre la recta x = -y")
    //unico caso en el que el default no es necesario
    case let (x,y):
        print("En algún lugar del plano, en \(x), \(y)")
}

//Switch con casos compuestos
let someCharacter = "a"
switch someCharacter {
    case "a", "e", "i", "o", "u":
        print("Se trata de una vocal")
    case "b", "c", "d": //..."z"
        print("Se trata de una consonante")
    default:
        print("Se trata de un caracter no vocal ni consonante (minúscula)")
}

//recupera variables con caso compuesto
let stillAnotherPoint = (9,0)
switch stillAnotherPoint {
case (let distance, 0), (0, let distance):
    print("Se encuentra sobre el eje, a distancia \(distance) del origen")
default:
    print("No está sobre el eje")
}