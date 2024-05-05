//
//  main.swift
//  appBasica1
//
//  Created by Jorge on 26/04/24.
//

import Foundation

var n1 = 105
var n2 = 50
print("n1 = ", n1)
print("n1 = \(n1), n2 = \(n2)")

var resul = n1 ^ n2 // XOR ^
print("resultado = \(resul)")

let binarioResul = String(resul, radix: 2)
print("\t\t En Binario \(resul) = \(binarioResul) \n\n")

//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

var num1 = 255
let bin = String(num1, radix: 2)

print("\t Numero: \(num1) = \(bin) en binario")

let hexa = String(num1, radix: 16)
print("\t Numero: \(num1) = \(hexa) en hexadecimal")

let octal = String(num1, radix: 8)
print("\t Numero: \(num1) = \(octal) en octal")

let binario2 = "01100101"

let numHexa = String( Int(binario2, radix: 2)!, radix: 16 )
print("Binario: \(binario2) = \(numHexa) en Hexadecimal \u{1F496}")
//\u{1F30A} \u{1F681} \u{1F30D}

let numHexa2 = "FACE"
let numBinario = String( Int(numHexa2, radix: 16)!, radix: 2 )
print("Hexadecimal \(numHexa2) = \(numBinario) en Binario")

let numDec = String( Int(numHexa2, radix: 16)!, radix: 10 )
print("Hexadecimal \(numHexa2) = \(numDec) en Decimal")

// Rangos
print("Rango Cerrado 🔐")
let rangoCerrado = ...5
print(rangoCerrado.contains(-2147483648))
print(rangoCerrado.contains(4))
print(rangoCerrado.contains(6))

// Manejo de cadenas
var str = "TEC LAGUNA"
var resultado: String = ""
let caracteres = Array(str)
for i in 0..<caracteres.count {
    let car = caracteres[i]
    resultado += car.lowercased()
    print(resultado)
}

print("\(resultado) 👾🤖")

// Funciones
func mayorMenor( array: [Int] ) -> (mayor: Int, menor: Int) {
    var menor = array[0]
    var mayor = array[0]
    
    for valor in array[1..<array.count] {
        if valor < menor {
            menor = valor
        } else if valor > mayor {
            mayor = valor
        }
    }
    
    return (mayor, menor)
}

let funcion = mayorMenor(array: [3,48,91,53,10,9,84,1,29])
print("Valor mayor: \(funcion.mayor), Valor menor: \(funcion.menor)")
