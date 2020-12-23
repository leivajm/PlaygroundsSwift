import UIKit

//INHERITENCE - HERENCIA

clase Vehicle{
    //palabra reservada que se utiliza para evitar que el
    //metodo o prop sea sobreescrito por las clases hijo
    //final var currentSpeed = 0.0
    var currentSpeed = 0.0
    var description: String{
        return "Viajando a \(currentSpeed) km/h"   
    }
    func makeNoise(){

    }
}

let someVehicule = Vehicle()
print(someVehicule.description)

//heredando de clase padre
class Bicycle : Vehicule {
    var hasBasket = false
}

let bicicly = Bicycle()
bicicly.hasBasket = true
bicicly.currentSpeed = 15.0
print(bicicly.description)

class Tandem: Bicycle{
    var currenNumberOfPassengers = 0
}
let tandem = Tandem()
tandem.hasBasket = true
tandem.currenNumberOfPassengers = 2
tandem.currentSpeed=22.0
print(tandem.description)

//SOBREESCRIBIR VARIABLES Y METODOS
//sobre escritura de metodo
class train : Vehicle{
    var numberOfWagons = 0
    override func makeNoise(){
        print("ruido")
    }
}
let train = train()
train.makeNoise()

//lo mismo funciona con properties
class Car : Vehicle{
    var gear = 1
    override var description: String{
        //super para invocar la description de la clase padre
        return super.description + " en la marcha \(gear)"
    }
}

let car = Car()
car.currentSpeed = 55
car.gear = 3
print(car.description)
print(tandem.description)

class AutomaticCar : Car{
    override var currentSpeed: Double{
        
        didSet {
            gear = Int(currentSpeed/ 15.0) + 1
        }
        
    }
}

let automatic = AutomaticCar()
automatic.currentSpeed = 65
print(automatic.description)
