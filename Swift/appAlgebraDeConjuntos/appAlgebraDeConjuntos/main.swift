//  main.swift
//  appAlgebraDeConjuntos
//
//  Created by Jorge Cisneros on 16/05/24.

// appConjuntosConsola
//
// Created by Martin O Valdes on 10/05/24.

import Foundation
// CONSTRUCTOR TIPO 1
let conjuntoVacio1:Set<Int> = []
print(conjuntoVacio1)

let conjuntoVacio2:Set<Int> = Set()
print(conjuntoVacio2)
var conjuntoA: Set = [1,5,3,9]
print(conjuntoA)
for val in conjuntoA
{
print(val, terminator: " | ")
}
print()
print("Valor a ELIMINAR :")
var num = Int(readLine()!)
if let valor = conjuntoA.remove(num!)
{

print("Valor Eliminado : \(valor)")
print(conjuntoA)
}
else
{
print("ELEMENTO NO ENCONTRADO ")
}

conjuntoA.insert(9)
print(conjuntoA)

var conjuntoB:Set<Int> = []
for _ in 1...5
{
conjuntoB.insert(Int(arc4random_uniform(100)))
}
print("Conjunto B ")
print(conjuntoB)
//UNION
var unionAB = conjuntoA.union(conjuntoB)
print(" A: \(conjuntoA) U B:\(conjuntoB) = \(unionAB)")

//UNIR DATOS ORDENADOS
let unionAB_ = conjuntoA.union(conjuntoB).sorted()
print("Datos ordenados A: \(conjuntoA) U B:\(conjuntoB) = \(unionAB_)")

// APLICAR: INTERSECCION, DIFERENCIA, DIFERENCIA SIMETRICA
let interAB_ = conjuntoA.intersection(conjuntoB)
print("Intersección de A: \(conjuntoA) ⋂ B: \(conjuntoB) = \(interAB_)")

let diffAB_ = conjuntoA.subtracting(conjuntoB)
print("Diferencia de A: \(conjuntoA) - B: \(conjuntoB) = \(diffAB_)")

let difSimetricaAB_ = conjuntoA.symmetricDifference(conjuntoB)
print("Diferencia simetrica de A y B")
print("\(conjuntoA) diff simetrica \(conjuntoB) = \(difSimetricaAB_)")

// DETERMINAR SI ES DISJUNTO, SUBCONJUNTO, SUPERCONJUNTO
print("A es DISJUNTO de B: \(conjuntoA.isDisjoint(with: conjuntoB))")

print("A es SUBCONJUNTO de B: \(conjuntoA.isSubset(of: conjuntoB))")

print("A es SUPERCONJUNTO de B: \(conjuntoA.isSuperset(of: conjuntoB))")

let frutas:Set = ["🍏", "🍐", "🍊", "🍋", "🍌", "🍅", "🍇", "🍉"]
let frutasyVerduras : Set = ["🥦", "🌶", "🍅", "🥔", "🍠"]

print("Frutas: ", frutas)
print("Frutas y verduras: \(frutasyVerduras)")

if frutas.isSuperset(of: frutasyVerduras) {
    print("Frutas ES SUPERCONJUNTO de Frutas y Verduras")
} else {
    print("Frutas NO ES SUPERCONJUNTO de Frutas y Verduras")
}

if frutasyVerduras.isSuperset(of: frutas) {
    print("Frutas y verduras ES SUPERCONJUNTO de Frutas")
} else {
    print("Frutas y verduras NO ES SUPERCONJUNTO de Frutas")
}

if frutas.isSubset(of: frutasyVerduras) {
    print("Frutas ES SUBCONJUNTO de Frutas y verduras")
} else {
    print("Frutas NO ES SUBCONJUBTO de Frutas y verduras")
}

if frutas.isDisjoint(with: frutasyVerduras) {
    print("Frutas ES DISCONJUNTO de Frutas y verduras")
} else {
    print("Frutas NO ES DISCONJUBTO de Frutas y verduras")
}

let interFrutasVerduras = frutas.intersection(frutasyVerduras)

//------------------------------------------------------------

let animales : Set = ["🐶","🐱","🦉","🐧","🐟","🐙","🦜","🐿"]
print("Animales: \(animales)")

print("Frutas es disjunto de Animales ", frutas.isDisjoint(with: animales))

print("\(frutas) U \(frutasyVerduras) = \(frutas.union(frutasyVerduras))")

//UNIR DATOS ORDENADOS
print(" \(frutas) U \(frutasyVerduras) = \(frutas.union(frutasyVerduras).sorted())")

// APLICAR: INTERSECCION, DIFERENCIA, DIFERENCIA SIMETRICA
print("\(frutas) ⋂ \(frutasyVerduras) = \(frutas.intersection(frutasyVerduras))")

print("\(frutas) - \(frutasyVerduras) = \(frutas.subtracting(frutasyVerduras))")

print("Diferencia simetrica de frutas y verduras")
print("\(frutas) diff simetrica \(frutasyVerduras) = \(frutas.symmetricDifference(frutasyVerduras))")
