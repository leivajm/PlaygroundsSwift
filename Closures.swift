import UIKit

//1. Global functions
//2. Nested functions
//3. Closure

let names = ["Juan", "Pedro", "Maria"]

func backward( _ s1: String, _ s2: String) -> Bool {
    return s1 > s2
}

backward("Juan", "Pedro")

var reversedNames = names.sorted(by: backward)

/*
    { (params) -> return type in
        //Código del closure
    }
*/

reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool
    in
    return s1 > s2
})
//reduciendolo a una linea
//se quitan los tipos String y Bool porque la func espera eso
//se quitan los parentesis y el parametro de retorno
reversedNames = names.sorted(by: { s1, s2 in return s1 > s2})

//se quita la pablara return porque ya sabemos que devolvemos un bool
reversedNames = names.sorted(by: { s1, s2 in s1 > s2})

//como nos interesan solo 2 string, solo indicamos la posición
//no hay necesidad de nombrar los parametro nuevamente
reversedNames = names.sorted(by: { $0 > $1 } )

//como solo nos interesa el mayor, solo le podemos pasar >
//y el hace el trabajo
reversedNames = names.sorted(by: > )

//TRAILING CLOSURES
//Un Closure que se escribe despues de una funcion entre ()
//equivalente a map, filter, reduce

func someFunctionThatTakesAClosure(closure: () -> void){
    //Aquí ira el cuerpo de la función
}
someFunctionThatTakesAClosure(closure: {
    //Aquí ira el cuerpo del closure
})

someFunctionThatTakesAClosure {
    //Añadir el closure aquí
}
reversedNames = names.sorted{$0>$1}

let digitNames = [0:"Cero", 1:"Uno",2:"Dos",3:"Tres"]
let numbers = [16,58,510]
//**recordar todos los params son constantes
let numberStrings = numbers.map { (number) -> String in
    var number = number
    var output = ""
    repeat {
        output = digitNames[number%10]! + output
        number /= 10
    } while number > 0
    return output
}


//CAPTURING CLOSURE
//capturan los valores que le rodea
//en este caso hereda los valores de la func superior
//cada llamada crea sus propias variables internas
func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}

let incrementByTen = makeIncrementer(forIncrement: 10)
incrementByTen()
incrementByTen()
let incrementBySeven = makeIncrementer(forIncrement: 7)
incrementBySeven()
incrementBySeven()


//SCAPING CLOSURES
//No se ejecutan necesariamente al momento de crearlo
//se ejecuta en el futuro

var completionHandlers: [() - void] = []

func someFunctionWithScapingClosure(completionHandler: @escaping () -> void){
    completionHandlers.append(completionHandler)   
}

func someFunctionWithNoneScapingClosure(closure: () -> void{
    closure()
}

class someClass{
    var x=10
    func doSomething(){
        someFunctionWithScapingClosure{
    //se coloca self para indicar donde puede encontrar la var despues
            self.x = 100
        }
        someFunctionWithNoneScapingClosure{
            x = 200
        }
    }
}

let instance = someClass()
print(instance.x)
instance.doSomething()
print(instance.x)
//ejecutamos el handler postergado
//el signo ? porque en definición es optional
//los parentesis xq no recibe params y no hay return
completionHandler.first?()
print(instance.x)
