//
//  main.swift
//  appMatematicas
//
//  Created by Jorge on 02/05/24.
//

import Foundation

class Matematicas {
    
    // FACTORIAL RECURSIVO
    static func factorial_recursivo( n : Int ) -> Int {
        let fact = 1
        
        if n == 0 || n == 1 {
            return fact
        } else {
            return n * factorial_recursivo(n: n - 1)
        }
        
    }
    
    // FACTORIAL ITERATIVO
    static func factorial_iterativo( n : Double ) -> Double {
        var fact : Double = 1.0
        
        if n == 0 || n == 1 {
            return fact;
        }
        
        for i in 1...Int(n) {
            fact *= Double(i)
        }
        
        return fact
        
    }
    
    static func es_primo( n : Int ) -> Bool {
        
        var esPrimo = true
        var div : Int = 2
        
        if n <= 1 {
            return false
        }
        
        while div <= n {
            if n % div == 0 {
                esPrimo = false
            }
            
            div += 1
        }
        
        
        return esPrimo
        
    }
    
    // diseñe metodo para resolver la serie que resuelve la cte de euler
    // utilizando la serie: e = 1 + 1/1! + 1/2! ... 2.718
    
    static func constEuler() -> Double {
        
        var cant : Double = 1.0
        var cont = 1.0
        
        while cant < exp(1.0) {
            cant = cant + 1/factorial_iterativo(n: cont)
            
            cont += 1
        }
        
        return cant
    }
    
    static func anoBisiesto( ano : Int ) -> Bool {
        
        return ( ano % 4 == 0 && ano % 100 == 0  || ano % 400 == 0) ? true : false
        
    }
    
}


print("Número: ", terminator: "")
//var num : String = readLine() ?? String( 5 )
//var num : String = readLine()!
var num = readLine()
var numero: Int? = Int( num! )

print("\t Dato capturado \( numero! )")

var fact = Matematicas.factorial_iterativo(n: Double(numero!))

print("Factorial de \(numero!) = \(fact)")

var esprimo = Matematicas.es_primo(n: numero!)

//var mensaje = esprimo ? "No es primo" : "Si es primo"
//
//print(mensaje)


let result = esprimo ? "Es Primo" : "No es primo"

print( esprimo ? "\(numero!) Es primo" : "\(numero!) No es primo" )

print(exp(1.0))

let euler = Matematicas.constEuler()
print(euler)


var ano = 2024
print(Matematicas.anoBisiesto(ano: ano))
