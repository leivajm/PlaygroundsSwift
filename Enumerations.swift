import UIKit

//enumerados, clases vagas
//son clases restringidas

//estructura
enum SomeEnumeration{
    //aquí ira la definición del enumerado
}

//ejemplo
enum CompassPoint {
    case north
    case south
    case east
    case west
}

enum Planet{
    case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
}

var directionToGo = CompassPoint.east
//luego de declarado se puede reasignar asi, xq swift ya conoce el 
//tipo de dato
directionToGo = .north

switch directionToGo {
    case .north:
        print("Hay que ir al norte")
    case .south:
        print("Hay que ir al sur")
    case .east:
        print("Hay que ir al este")
    case .west:
        print("Hay que ir al oeste")
}

let somePlanet = Planet.earth
switch somePlanet {
    case .earth:
        print("La tierra es segura")
    default:
        print("No es seguro ir a este planeta")
}
//CaseIterable protocolo que permite delegar la cualidad de contar
enum Beverage: CaseIterable {
    case cofee, tea, juice, redbull
}
let numberOfChoices = Beverage.allCases.count


//ENUMERATION \"CODIGOS DE BARRAS"

enum barcode {
    case Upc(Int, Int, Int, Int)
    case qrCode(String)
}

var productBarcode = barcode.upc(8,8599,51224,8)
productBarcode = .qrCode("asdfgsdklfjsdljfds")

switch productBarcode {
    case .upc(let numberSystem, let manufacturer, let product, let check):
        print("UPC: \(numberSystem), \(manufacturer), \(product), \(check)")
    case .barcode(let productCode):
        print("QR: \(productCode)")    
}
//optimizando podemos quitar let de cada captura de variable
switch productBarcode {
    case let .upc(numberSystem, manufacturer, product, check):
        print("UPC: \(numberSystem), \(manufacturer), \(product), \(check)")
    case let .barcode(productCode):
        print("QR: \(productCode)")
}

//ENUMERADORES CON RAW VALUES
//Se necesita un simbolo, un numero o un caracter

//ejemplo codigo ASCII
//se puede asociar caracter/numero a cada case
enum ASCIIControlCharacter: Character{
    case tab = "\t"
    case lineFeed = "\n"
    case cariageReturn = "\r"
}

//retorna el valor de la posición
let earthOrder = Planet.earth.rawValue
//convierte el valor extraño a String, al consultar retorna cada caso
enum CompassPoint : String{
    case north
    case south
    case east
    case west
}
//en caso contrario se puede crear asignado el rawValue
let possiblePlanet = Planet(rawValue: 5)
//al ser optional hay que acceder de forma segura

let planetPosition = 11
if let anyPlanet = Planet(rawValue: planetPosition){
    switch anyPlanet {
        case .earth:
            print("La tierra es segura")
        default:
            print("No es seguro ir a este planeta")
    }
}else{
    print("El planeta indicado no existe")
}
