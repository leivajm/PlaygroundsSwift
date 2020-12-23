import UIKit

//continue
//break
//fallthrough
//return
//throw
//Version de API

let sentence = "Las mentes grandes piensan igual"
var filtro = ""
let caracteresEliminar = ["a","e","i","o","u"]
for ch in sentence {
    if caracteresEliminar.contains(ch)
    {
        //lanza a la siguiente iteración
        continue
    }   
    filtro.append(ch) 
    if ch == "d"{
        //break rompe definitivamente las iteraciones
        break
    }
}

//Fallthrough, continua hacia adelante
//permite evaluar el siguiente caso
let entero = 5
var descripcion = "El número \(entero) es: "

switch entero {
    case 2,3,5,7,9,11,13,17,19:
        descripcion += "un número primo y"
        fallthrough
    default:
        descripcion += "un número entero"
}
//swift permite hacer el casting para diccionarios
//en este caso claves String y valores Any (String, int, bool)
var people = ["name":"Jose", "age":33, "isMale": true] as [String : any]
//asi se haria para validar si existe una llave dentro del set
if let surname = people["surname"]{
    print(surname)
}

// como se hace para prevenir en swift
//guard previene que se ejecute lo que viene despues si se encuentra un nil
guard let surname = people["surname"] else {
    //colocar sentencia en caso de no existir
}
//el guard permite continuar porque el elemento si se puede trabajar
//es decir, nos protege de posibles errores
//continua aqui porque si existe surname
//el guard permite controlar hasta donde quiero que se ejecute un metodo
print(surname)

//si fuera una funcion, validamos y si no existe, retornamos nada
func test(){
    guard let surname = people["surname"] else {
        return
    }
    //aqui existe surname
    print(surname)
}

//si fuera una funcion con parametros, validamos y si no existe, retornamos nada
func testUserValidation(person:[String : any]){
    guard let surname = person["surname"] else {
        print("El apellido es desconocido")
        return
    }
    //aqui existe surname
    print(surname)
    //validamos si existe tambien la edad
    guard let age = person["age"] else {
        print("La edad es desconocida")
        return
    }
    print("La edad de la persona es \(age)")
}

//llamada de funcion
//people["surname"]="perez" //si funcionaria
testUserValidation(person: people)

//validador de version para saber si puedo ejecutar codigo
if #available(iOS 12, MacOS 10.12,*){
    //Ejecutar las acciones iguales o posteriores
}else{
    //ejecutar codigo viejo
}