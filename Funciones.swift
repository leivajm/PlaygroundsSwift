import UIKit

//func nombre_funcion (parametros de entrada) -> parametro salida
func saludo(person: String) -> String {
    let greet = "Hola, \(person)!"
    return greet
}
//invocar funcion, se tiene que indicar parametro y el valor
saludo(person: "Juan")


//Párametros de entrada
//sin parametros
func sayHelloWorld() -> String {
    return "Hello World"
}
//multiples parametros
fun greeting(person: String, isMale : Bool) -> String {
    if isMale{
        return "Bienvenido caballero \(person)"
    } else{
        return "Bienvenida señorita \(person)"
    }
}

//VALORES DE RETORNO, OPTIONALS Y PÁRAMETROS DE SALIDA
func greet2(person:String){
    print("Hola \(person)")
}

greet2(person:"Juan")
//párametro de retorno
func printAndCount(string : String) -> Int {
    print(string)
    return string.count
}
printAndCount(string: "Hola que tal")

//retornando tupla

func minMax(array:[Int]) -> (min : Int, max : Int){
    var currentMin = array[0]
    var currentMax = array[0]

    for value in array[1..<array.count]{
        if(value < currentMin){
            currentMin = value
        }else if value>currentMax{
            currentMax = value
        }
    }
}

let bounds = minMax(array: [6,3,-8,3,1,9,5,15,-9])
print("Los valores se encuentran entre \(bounds.min) y \(bounds.max)")

//cuando recibimos un array vacio, utilizamos valores optinal
func minMax(array:[Int]) -> (min : Int, max : Int)?{
    if array.isEmpty { return nil }

    var currentMin = array[0]
    var currentMax = array[0]

    for value in array[1..<array.count]{
        if(value < currentMin){
            currentMin = value
        }else if value>currentMax{
            currentMax = value
        }
    }
}

let bounds = minMax(array: [])
//obligamos a castear (force unwrapping)
print("Los valores se encuentran entre \(bounds!.min) y \(bounds!.max)")


//ETIQUETAS DE PARAMS Y VARIADICS

func someFunction(f1 firstParamName : Int, f2 secondParamName: Int){
    //firstParamName variable de tipo Int
    //secondParamName variable de tipo Int
}
//asi se puede llamar
someFunction(firstParamName : 5, secondParamName: 1)
//optimizando utilizando alias
someFunction(f1: 5, f2: 1)

func greeting(person: String, from hometown: String) -> String{
    return "Hola \(person) que bueno que nos visites desde \(hometown)"
}
greeting(person: "Juan", from : "Mallorca")
//podemos colocar guion bajo y no habrá necesidad de llamar 
//al parametro por nombre
func greeting(_ person: String, from hometown: String) -> String{
    return "Hola \(person) que bueno que nos visites desde \(hometown)"
}
greeting("Juan", from : "Mallorca")


//parametros por defecto
//segundo parametro seteado a 6
func someFunction(f1 firstParamName : Int, f2 secondParamName: Int=6){
    //firstParamName variable de tipo Int
    //secondParamName variable de tipo Int
}
someFunction(f1: 5)

//VARIADICO multiples parametros del mismo tipo
func mean(_ numbers: Double...) -> Double {
    var total : Double = 0;
    for number in numbers{
        total += number
    }
    return total / Double(numbers.count)
}

mean(1,2,3,4,5)
mean(1.5,8)
mean(8,87)



//PARÁMETROS INOUT para que no los tome 
//como parametros constantes (solo lectura)
func swapTwoInts(_ a: inout Int, _ b : inout Int){
    var tempA = a
    a = b
    b = tempA
}

var someInt = 3
var otherInt = 7
//se pasan los valores como referencia
//swapTwoInts(a:&Int, b: &Int)
swapTwoInts(&someInt, &otherInt)


//FUNCTIONS TYPES
//funciones que se tratan como un valor
//funciones como tipos de datos

func addTwoInts(_ a: Int, _ b: Int) -> Int {
    return a+b
}//este seria su tipo de dato: (Int, Int) -> Int
func multiplyTwoInts(_ a: Int, _ b: Int) -> Int {
    return a*b
}//este seria su tipo de dato: (Int, Int) -> Int
fun printHW(){
    print("Hello World!")
}//este seria su tipo de dato () -> void

//se crea la variable de tipo de dato funcion addTwoInts
var mathFuction : (Int, Int) -> Int = addTwoInts
mathFuction(4,5) //resultado 9

var mathFuction : (Int, Int) -> Int = multiplyTwoInts
mathFuction(4,5) //resultado 20


//pasando una funcion como parametro
func printMathResult(_ mathFunc: (Int, Int) -> Int, _ a : Int, _ b: Int){
    print("Resultado: \(mathFunc(a,b))")
}
printMathResult(multiplyTwoInts,5,9)
printMathResult(addTwoInts,5,9)

//retornando una funcion

func stepForward(_ input: Int) -> Int {
    return input + 1
}
func stepBackward(_ input: Int) -> Int {
    return input - 1
}
func chooseStepFunction(backward: Bool) -> (Int) -> Int {
    return backward ? stepBackward : stepForward
}
var value = 7
let moveNearerZero = chooseStepFunction(backward: value > 0)
while value != 0 {
    print("\(value)...")
    value = moveNearerZero(value)
}
print("Cerooo!!!")


//NESTED FUNCTIONS (funciones anidadas)
//ofuscamos las funciones por que solo son utilizadas
//en ese scope


func chooseStepFunction(backward: Bool) -> (Int) -> Int {
    func stepForward(_ input: Int) -> Int {
        return input + 1
    }

    func stepBackward(_ input: Int) -> Int {
        return input - 1
    }
    
    return backward ? stepBackward : stepForward
}

