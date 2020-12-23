import UIKit

//ARRAY
//Declarar arrays

//Primera forma
var someInts = [Int]()
someInts.count
someInts.append(31)
someInts.count
//forma corta
someInts = []
someInts.count

//Segunda forma
//inicializar un array con el mismo valor en cada 
//posicion
var someDoubles = Array(repeating: 3.141592, count: 7)
someDoubles.count
//Tercera forma
//declarar un array uniendo 2 arrays

var moreDoubles = Array(repeating: 2.5, count: 4)
var aLotOfDoubles = someDoubles + moreDoubles
aLotOfDoubles.count

//Cuarta forma
var shoppingList : [String] = ["Papas","Tortillas","Cerdo"]
shoppingList.count

//Acceder y modificar elementos de un Array

if shoppingList.isEmpty {
    print("La lista de la compra está vacía")
} else{
    print("si hay elementos en la lista")
}

shoppingList.append("Coca-Cola")
shoppingList.count

shoppingList += ["Nachos","Aguacates"]
shoppingList.count

//consultar elemento
var firsElement = shoppingList[0]
//asignar elemento
shoppingList[0] = "Huevos"
//consultar rangos
shoppingList[4..6]
shoppingList[4..6] = ["Naranja","Melon","Mango"]


//borrar elementos
let pepper = shoppingList.remove(at:1)
let _ = shoppingList.removeLast()

//Iterando Arrays
for item in shoppingList{
    print(item)
}
for (idx, item) in shoppingList.enumerated{
    print("Item \(idx-1): \(item) ")
}
