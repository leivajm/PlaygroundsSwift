import UIKit
//STORED PROPERTY
//parte de la instancia de la clase

struct FixedLenghtRange {
    //estas son stored property
    var firstValue : Int
    let length : Int
}

var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)

rangeOfThreeItems.firstValue = 6

//LAZY STORED PROPERTIES
//Se crean aplicando la palabra reservada lazy
//se crean despues

//ejemplo
class DataImporter {
    var filename = "data.txt"
}

class DataManager {
    lazy var importer = DataImporter()
    var data = [String]()
}

let manager = DataManager()
manager.data.append("Datos")
manager.data.append("Más datos")
//hasta esta linea el importer no ha sido creado
manager.importer.filename
//aquí ya ha sido creada (hasta que alguien solicita valor se crea, mientras es nil)


//COMPUTED PROPERTIES
//son computadas/calculadas
//existen getters y setters

struct Point {
    var x = 0.0, y = 0.0
}

struct Size {
    var width = 0.0, height = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
    var center: Point{
        get{
            let CenterX = origin.x + size.width/2
            let CenterY = origin.y + size.height/2
            return Point(x: CenterX, y: CenterY)
        }
        set(newCenter){
            origin.x = newCenter.x - size.width/2
            origin.y = newCenter.y - size.height/2
        }
    }
}
var square = Rect(origin: Point(x: 0, y:0), size: Size(width: 10, height:10))

//COMPUTED PROPERTIES DE SÓLO LECTURA
struct Cuboid{
    var width = 0.0, height = 0.0, depth = 0.0
    //si no tienen get o set son de solo lectura
    var volume: Double{
        return width * height * depth
    }
}
let cuboid = Cuboid(width: 4.0, height: 5.0, depth: 2.0)

//PROPERTY OBSERVERS
//Cuando ocurre un cambio en el interior y necesitamos reaccionar
//willset: futuro, se ejecuta antes de cambiar el valor de la property
//didset: pasado, se ejecuta despues de cambiar el valor de la property

class StepCounter{
    var totalSteps: Int = 0{
        willset(newTotalSteps){
            print("El número de pasos llegará hasta \(newTotalSteps)")
        }
        didset{
            if totalSteps > oldValue{
                print("El número de pasos ha incrementado en \(totalSteps-oldValue)")
            }
        }
    }
}

let stepCounter = StepCounter()

stepCounter.totalSteps = 200

//TYPE PROPERTIES
struct SomeStruct{
    var count = 0
    //indica que solo es comun para la propia estructura
    //es decir no lo podran ver los objetos que hereden de esta
    static var storedProperty = "SOME VALUE"
    static var computedTypeProperty: Int {
        return 1
    }
}

var instanceStr = SomeStruct()

//otro ejemplo
enum SomeEnum{
    static var storedTypeProperty = "SomeValue"
    static var computedTypeProperty: Int{
        return 5
    }
}
//otro ejemplo con clase
class SomeClass{
    static var storedTypeProperty = "some value"
    static var computedTypeProperty: Int{
        return -9
    }
    //está si es sobreescribible
    class var overrideableComputedTypeProperty: Int{
        return 108
    }
}
