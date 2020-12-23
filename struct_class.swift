import UIKit

//Struct vs Class
//una estructura no puede cambiar sus valores/props
//es inmutable
struct SomeStruct{
    //La definición de la estructura aquí
}
//una clase reserva la sección de memoria y si es mutable
class SomeClass{
    //La definicón de la clase aquí
}

struct Resolution{
    var height = 100
    var width = 100
}

class VideoMode{
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?   
}

let someResolution = Resolution()
let someVideoMode = VideoMode()

//para acceder
print(someResolution.width)

//cambiar valores
someVideoMode.resolution.width=1280
print(someVideoMode.resolution)

let vga = Resolution(width: 640, height: 480)
vga.width
vga.height

let hd = Resolution(width: 1920, height: 1080)
var cinema = hd

print("\(cinema.width) x \(cinema.height)")

//las estructuras no tienen referencias de donde vienen (memoria)
//igual que los enum

//CLASES DATOS REFERENCIADOS
//en las clases si cambia la copia, cambia el padre
//los objetos de una clase se comparan con 3 = ===
let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0

let alsoTenEighty = tenEighty
alsoTenEighty.frameRate = 30.0

if tenEighty === alsoTenEighty{
    print("Son el mismo objeto")
}else{
    print("Son diferentes")
}

