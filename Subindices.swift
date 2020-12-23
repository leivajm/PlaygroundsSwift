import UIKit
//los subindices ya vienen implementados en
//diccionarios, struct y arrays


struct TimesTable{
    let multiplier: Int
    
    subscript(index: Int) -> Int {
        return multiplier * index
    }
}

let trheeTimesTable = TimesTable(multiplier: 3)
//forma especial de obtener el return de metodo subscript
print("6*3 = \(trheeTimesTable[6])")

for idx in 0...10 {
    print("\(idx) x 3 = \(trheeTimesTable[idx])")
}


enum Planet: Int{
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
    
    static subscript(n: Int) -> Planet {
        return Planet(rawValue: n)!
    }
}

let mars = Planet[4]


struct Matrix {
    ler rows : Int, columns : Int
    var grid : [Double]

    init(rows: Int, columns: Int){
        self.rows = rows
        self.columns = columns
        grid = Array(repeating: 0.0, count: rows*columns)
    }
    
    func indexIsValid(row: Int, column: Int) -> Bool{
        return row >=0 && column >= 0 && row < rows && column < columns
    }

    
    subscript(row: Int, column: Int) -> Double {
        get {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            return grid[(row*column)+column]
        }
        set{
            assert(indexIsValid(row: row, column: column), "Index out of range")
            grid[(row*column)+column] = newValue
        }
    }   
}
matrix[0,1]=1.5
matrix[1,0]=2.5
matrix

//imprimiendo matriz
for row in 0..<matrix.rows {
    for col in 0..<matrix.columns {
        print(matrix[row, col], separator = "", terminator = " ")
    }
    print("")
}

