//
//  main.swift
//  appArregloOrdenamiento
//
//  Created by Jorge on 03/05/24.
//

import Foundation

func ordenamiento_burbuja ( array : Array<Int> ) -> Array<Int> {
    let n = array.count
    var newArray = array
    var temp = 0
    
    for i in 0..<n {
        for j in (i+1)..<n {
            if newArray[i] < newArray[j] {
                temp = newArray[i]
                newArray[i] = newArray[j]
                newArray[j] = temp
            }
        }
    }


    return newArray
}

func burbuja2 ( array : Array<Int> ) -> Array<Int> {
    
    var arrayAux : [Int] = []
    var aux = 0
    
    if array.isEmpty {
        return arrayAux
    }
    
    arrayAux = array
    
    for _ in 0..<array.count-1 {
        for j in 0..<array.count-1 {
            if arrayAux[j] > arrayAux[j + 1] {
                aux = arrayAux[j]
                arrayAux[j] = arrayAux[j+1]
                arrayAux[j+1] = aux
            }
        }
    }
    
    return arrayAux
    
}

func burbuja_referencia ( array : inout [Int] ) {
    let n = array.count
    
    for i in 0..<n {
        for j in (i+1)..<n {
            if array[i] < array[j] {
                let temp = array[i]
                array[i] = array[j]
                array[j] = temp
            }
        }
    }
}

func burbujaReferencia2 ( vec : inout Array<Int> ) {
    var aux = 0
    
    for _ in 0..<vec.count-1 {
        for j in 0..<vec.count-1 {
            if vec[j] > vec[j + 1] {
                aux = vec[j]
                vec[j] = vec[j+1]
                vec[j+1] = aux
            }
        }
    }
    
}


var aleatorios : Int
var arrNumeros : [Int] = []

for _ in 0..<10 {
    aleatorios = Int(arc4random())
    arrNumeros.append(Int.random(in: 10...99))
}

print("Datos generados aleatoriamente 1:")
print(arrNumeros)

for i in 0..<10 {
    aleatorios = Int.random(in: 10...99)
    arrNumeros[i] = aleatorios
}

print("Datos generados aleatoriamente 2:")
print(arrNumeros)

var arrOrdenado = ordenamiento_burbuja( array: arrNumeros )

print("Datos ordenados: ", arrOrdenado)

arrOrdenado.removeAll()
print(arrOrdenado)
print("Capacity: ",arrOrdenado.capacity)

print("Datos ordenados por Burbuja por referencia")
burbujaReferencia2(vec: &arrNumeros)
print(arrNumeros)

let ordenInv1 = Array(arrNumeros.reversed())

print("Orden inverso: ", ordenInv1)

let ordenInv2 = arrNumeros.sorted{ $0 < $1 }
print( "Orden inverso 2: ", ordenInv2 )


