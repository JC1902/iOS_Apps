//
//  main.swift
//  appArregloOrdenamiento
//
//  Created by Jorge on 03/05/24.
//

import Foundation

func burbuja( arrayN : Array<Int> ) -> Array<Int> {
    return []
}

var aleatorios : Int
var arrNumeros : [Int] = []

for _ in 1...10 {
    aleatorios = Int(arc4random())
    arrNumeros.append(Int.random(in: 10...99))
}

print(arrNumeros)

for i in 1...9 {
    aleatorios = Int.random(in: 10...99)
    arrNumeros[i] = aleatorios
}

print(arrNumeros)

// opcion para asignar con indexador


