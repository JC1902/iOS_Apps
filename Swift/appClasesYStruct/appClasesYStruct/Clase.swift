//
//  Clase.swift
//  appClasesYStruct
//
//  Created by Jorge on 30/04/24.
//

import Foundation

//class Clase {
//    var a : Int
//    var b : Int
//    static var cont : Int = 0
//
//    init(a : Int, b : Int) {
//        self.a = a
//        self.b = b
//        Clase.cont = Clase.cont + 1 //+= 1
//    }
//
//    func imprimir() {
//        print("Valor a = \(a)")
//        print("Valor b = ", b)
//        print("Valor cont = \(Clase.cont)")
//    }
//
//}

struct Clase {
    var a : Int
    var b : Int
    static var cont : Int = 0
    
    init(a : Int, b : Int) {
        self.a = a
        self.b = b
        Clase.cont = Clase.cont + 1 //+= 1
    }

    func imprimir() {
        print("Valor a = \(a)")
        print("Valor b = ", b)
        print("Valor cont = \(Clase.cont)")
    }
}
