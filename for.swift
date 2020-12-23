import UIKit

//recorrido de array
let names = ["Juan", "Pedro", "Edgar"]

for name in names{
    print("Hola \(name)")
}

//recorrido de tupla
let numberOfLegs = ["spider":8, "ant":6, "dog":4]

for (animalName, lengcount) in numberOfLegs{
    print("Animal: \(animalName), número de patas: \(legCount)")
}

//for con rangos
for idx in 1...5{
    print("\(idx) x 3 = \(idx * 3)")
}

let base = 2
let power = 10
let answer = 1
//el guion bajo cuando no queremos declarar una variable
for _ in 0..<power{
    answer *= base
    print(answer)
}

//con intervalos
var hour = 9
let minutes = 60
let minuteInterval = 5
for tickMark in strid(from: 0, to: minutes, by: minuteInterval){
    print("\(Hour) : \(tickMark)")
}


