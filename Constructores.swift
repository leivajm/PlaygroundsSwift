import UIKit

struct Fahrenheit{
    var temperatura: Double
    init(){
        self.temperatura = 32
    }
}

var f1 = Fahrenheit()

struct Celcius{
    var temperatura: Double
    init(fromFahrenheit fahrenheit: Double){
        self.temperatura = (fahrenheit - 32 ) / 1.8
    }

    init(fromKelvin kelvin: Double){
        self.temperatura = kelvin - 273.15
    }
}

let boilingPointOfWater = Celcius(fromFahrenheit: 212)
let freezingPointOfWater = Celcius(fromKelvin: 273.15)

//NOMBRE, ETIQUETAS Y OPTIONALS
//las etiquetas nos ayudan a no escribir los nombres
struct Color{
    let red, green, blue: Double
    init(red: Double, green: Double, blue: Double){
        self.red = red
        self.green = green
        self.blue = blue
    }
    init(white: Double){
        self.red = white
        self.green = white
        self.blue = white
    }
}

let magenta = Color(red:1, green:0, blue:1)
let halfGrey = Color(white: 0.5)
let green = Color(red:0,green:1,blue:0)
//ejemplo de etiqueta
struct Celcius{
    var temperatura: Double
    init(fromFahrenheit fahrenheit: Double){
        self.temperatura = (fahrenheit - 32 ) / 1.8
    }

    init(fromKelvin kelvin: Double){
        self.temperatura = kelvin - 273.15
    }
    //agregamos otro constructor
    init(_ Celcius: Double){
        self.temperatura = Celcius
    }
}

let bodyTemperature = Celcius(37)

//PARAMETROS OPTIONALS
class SurveyQuestion {
    let text: String
    //? = variable optional
    var response: String?
    //no es necesario agregar los optionals al init
    init(text: String){
        self.text = text
    }
    func ask(){
        print(text)
    }
}

let q1= SurveyQuestion(text: "Pregunta 1?")
q1.ask()
q1.response = "Respuesta"

//INICIALIZADORES DENTRO DE CLASES Y SUBCLASES
//Existen dos tipos: los Designados y de por Conveniencia

//Tres reglas a seguir:
//Origen:       destino
//Designado: -> Designado super clase
//Conveniencia: -> Otro init de la misma clase
//El último init en llamase debe ser designado

class Vehicule{
    var numberOfWheels = 0
    var description: String{
        return "\(numberOfWheels) ruedas"
    }
}

let vehicule = Vehicule()
vehicule.description

class Bicycle: Vehicule{
    //sobreescribe la clase padre (Vehicule)
    //Este es un init Designado
    override init(){
        //cuando es el caso, hay que llamar el init del padre
        //"Se delega al init Padre"
        super.init()
        //este crea espacio en memoria para la var y las podremos
        //utilizar
        numberOfWheels = 2
    }
}

let bicycle = Bicycle()
bicycle.description

class Hoverboard: Vehicule{
    var color: String
    //Este es un init por conveniencia
    //porque se ha creada para inicializar una var
    //que solo existe en este scope, es decir, en el hijo
    init(color: String){
        self.color = color
        //aqui se llama implicitamente a super.init()
    }
    override var description: String{
        return "\(super.description) en el color \(self.color)"
    }
}

let hoverboard = Hoverboard(color: "Silver")
hoverboard.description


//FAILABLE INITIALIZER
//Este es el caso de un optional que tiene el valor de nil

enum TemperatureUnit{
    case kelvin, celsius, fahrenheit
    //? = quiere decir que pueda tener valor o no
    init?(symbol: character){
        switch symbol {
            case "K":
                self = .kelvin
            case "C":
                self = .celsius
            case "F":
                self = .fahrenheit
        default:
            return nil
        }
    }
}

let someUnit = TemperatureUnit(symbol: "K")
//estamos obligados a hacer un forceUnwrapping o casting seguro

class Product{
    let name:String
    init(name: String){
        if name.isEmpty{
            return nil
        }
        self.name = name
    }
}

class CartItem: Product{
    let quantity: init
    init?(name: String, quantity: Int){
        if quantity < 1{
            return nil
        }
        self.quantity = quantity
        super.init(name: name)
    }
}

if let someSocks = CartItem(name: "Socks", quantity: 2){
    print("\(someSocks.name) - \(someSocks.quantity)")
}

if let someSocks = CartItem(name: "", quantity: -1){
    print("\(someSocks.name) - \(someSocks.quantity)")
}

//DESTRUCTOR DE OBJETOS CON DEINIT

class Bank{
    static var coinsInBank = 2_000
    static func distribute(coins numberOfCoinsRequested: Int) -> Int {
        let numberOfCoinsToVend = min(numberOfCoinsRequested, coinsInBank)
        coinsInBank -= numberOfCoinsToVend
        return numberOfCoinsToVend
    }
    static func receive(coins: Int){
        coinsInBank += coins
    }
}

class Player{
    var coinsInPurse: Int
    init(coins: Int){
        self.coinsInPurse = Bank.distribute(coins: coins)
    }
    func win(coins: Int){
        coinsInPurse += Bank.distribute(coins: coins)
    }

    //destructor, en este ejemplo si el player muere
    //retorna las monedas al banco
    deinit {
        Bank.receive(coins: coinsInPurse)
    }
}
//se crea la variable playerOne, de tipo Player
//con ? porque es optional
//y se inicializa con valores del mismo tipo de objeto
let playerOne: Player? = Player(coins: 100)
Bank.coinsInBank
playerOne!.win(coins: 2_000)

Bank.coinsInBank
//aqui se destruye el objeto
playerOne = nil
//y el banco recupera todas la monedas
Bank.coinsInBank
