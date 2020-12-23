//Diccionarios [k1:v1, k2:v2,...]
//No hay posiciones
//Se accede por clave
//par clave:valor

//diccionario vacio
var namesOfnteger = [Int: String]()
namesOfnteger[15] = "quince"
//vaciar diccionario
namesOfnteger = [:]

var airports: [String : String] = ["YYZ":"Toronto",
    "LAX" : "Los angeles",
    "DUB" : "Dublin"
]
//si se agrega otro con la misma clave se sustituye el anterior

airports.count
airports.isEmpty

//add elementos
airports["LHR"] = "London City Airport"
airports
airports["LH"] = "London Heathrown"
airports

//sobreescribir el valor y recuperar el anterior
if let oldValue =  airports.updateValue("Dublin Airport",
    forKey: "DUB"){
        print("El aeropuerto se llamaba \(oldValue)")
}
//buscar valor
if let airportName = airports["DUB"]{
    print("El aeropuerto de DUB es: \(airportName)")
}
//eliminar elementos
airports["PMI"] = nil
airports.removeValue(forKey: "DUB")

//bucles sobre diccionarios

for (key, value) in airports{
    print("\(key) \(value)")
}

for airportKey in airports.key{
    print(airportKey)
}
for airportName in airports.values{
    print(airportName)
}

//casteo de array
//**no respeta orden
let airportsKeys = [String](airports.key)
let airportsNames = [String](airports.values)
