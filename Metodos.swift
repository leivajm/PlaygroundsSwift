import UIKit
//los metodos son funciones dentro de la clase
//si los metodos no tienen la palabra reservada static
//se pueden heredar al momento de instanciar

class Counter {
    var count = 0
    //para hacer uso de una propiedad dentro del metodo
    //se recomiendo utilizar la palabra reservada self.

    func increment(){
        //ejemplo de llamada a propiedad de clase
        //normal:
        //count += 1
        //self:
        self.count += 1
    }

    func increment(by amount:Int) {
        count += amount
    }
    func reset(){
        count = 0
    }   
}

let counter = Counter()
counter.increment()
counter.increment(by: 8)

struct Point{
    var x = 0.0, y = 0.0
    func isToTheRight(of x: Double) -> Bool {
        //self.x propiedad de clase
        //x parametro de la funcion
        return self.x > x
    }
}

let somePoint = Point(x: 4, y: 5)
somePoint.isToTheRight(of: 1)


//MUTATING METHODS
//que permite modificar propiedades

struct Point{
    var x = 0.0, y = 0.0
    func isToTheRight(of x: Double) -> Bool {
        return self.x > x
    }
    //mutating: que podra cambiar propiedades de la struct o enum
    mutating func moveBy(x deltaX:Double, y DeltaY: Double) {
        //esta funcion no puede cambiar datos de una struct o enum
        //a menos que la nombremos mutating
        self.x += deltaX
        self.y += DeltaY

        //para sobreescribir todo el valor de la struct
        self = Point(x: self.x + deltaX, y: self.y + DeltaY)
    }
}

//tiene que ser var para poder utilizar metodos mutating
var somePoint = Point(x: 4, y: 5)
somePoint.moveBy(x: 2,y: -3)

//otro ejemplo con enum

enum DifferentStateSwitch{
    case off, low, high
    mutating fuc next(){
        switch  self {
            case .off:
                self = .low
            case .low:
                self = .high
            case .high:
                self = .off        
        }
    }
}

var controllerStatus = DifferentStateSwitch.off
controllerStatus.next()
controllerStatus.next()

//METODOS DE CLASE


class someClass{
    //se usa palabra class para que permita heredar este method
    //si no, se utiliza static
    class func someMethod(){
        print("Hola")
    }
}
someClass.someMethod()

//ejemplo con struct

struct LevelTracker{
    static var highestUnlockedLevel = 1
    var currentLevel = 1

    static func unlock(_ level:Int){
        if level > highestUnlockedLevel{
            highestUnlockedLevel = level
        }
    }

    static func isUnlocked(_ level: Int) -> Bool{
        return level <= highestUnlockedLevel
    }

    mutating func advance(to level:Int) -> Bool {
        //los metodos staticos y mutating no se puede mezclar
        //por eso accedemos al metodo desde el nombre de la struct
        //en este caso LevelTracker
        if LevelTracker.isUnlocked(level){
            currentLevel = level
            return true
        }else{
            return false
        }
    }
}

class Player{
    var tracker = LevelTracker()
    let playerName:String
    func complete(level: Int){
        LevelTracker.unlock(level + 1)
        tracker.advance(to: level + 1)
    }

    init(name: String) {
        self.playerName = name
    }
}

var player = Player(name: "Jose")
player.complete(level: 1)
player

if player.tracker.advance(to: 7){
    print("Podemos avanzar hasta el nivel 7")
}else{
    print("El nivel 7 sigue bloqueado por ahora")
}


