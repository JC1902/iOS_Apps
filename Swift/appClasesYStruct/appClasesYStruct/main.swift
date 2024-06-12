//
//  main.swift
//  appClasesYStruct
//
//  Created by Jorge on 30/04/24.
//

import Foundation

// Las clases son reference types
// Las estructuras son value types

let objeto = Clase(a: 70, b: 60)
objeto.imprimir()

var objetoAux = Clase(a: 1000, b: 2000) //objeto
objetoAux.imprimir()

/*
print("Direccion de Objeto: \(Unmanaged.passUnretained(objeto).toOpaque())")
print("Direccion de ObjetoAux: \(Unmanaged.passUnretained(objetoAux).toOpaque())")

print("Valor de a = \(objeto.a)")
*/

objetoAux.a = 1550

print("Valor de a = \(objeto.a)")
