//
//  main.swift
//  appMultiplicacionDeMatrices
//
//  Created by Jorge on 10/05/24.
//

import Foundation

//func multiplyMatrices(_ matrix1: [[Int]], _ matrix2: [[Int]]) -> [[Int]]? {
//    guard !matrix1.isEmpty, !matrix2.isEmpty, matrix1[0].count == matrix2.count else {
//        // Las matrices no tienen dimensiones compatibles
//        return nil
//    }
//
//    let numRows = matrix1.count
//    let numCols = matrix2[0].count
//    var result = Array(repeating: Array(repeating: 0, count: numCols), count: numRows)
//
//    for i in 0..<numRows {
//        for j in 0..<numCols {
//            var sum = 0
//            for k in 0..<matrix1[0].count {
//                sum += matrix1[i][k] * matrix2[k][j]
//            }
//            result[i][j] = sum
//        }
//    }
//
//    return result
//}
//
//// Ejemplo de uso
//let matrix1 = [[1, 2, 3],
//               [4, 5, 6]]
//
//let matrix2 = [[7, 8],
//               [9, 10],
//               [11, 12]]
//
//if let result = multiplyMatrices(matrix1, matrix2) {
//    for row in result {
//        print(row)
//    }
//} else {
//    print("Las matrices no tienen dimensiones compatibles para la multiplicación.")
//}

func main() -> () {
    print("Multiplicación de matrices")
    print()
    
    let matrizA =
        [
        [1, 2, 3],
        [4, 5, 6],
        [7, 8, 9],
        [1, 2, 3],
        [7, 8, 9],
        [7, 8, 9],
        [7, 8, 9]
        ]
    
    let matrizB =
        [
        [1, 2, 3, 1],
        [4, 5, 6, 2],
        [7, 8, 9, 3]
        ]
    
    print("Matriz A:")
    imprimirMatrix( matrizA )
    
    print()
    
    print("Matriz B:")
    imprimirMatrix( matrizB )
    
    print()
    
    let mAXmB = multiplicarMatrices( matrizA, matrizB )
    print("Matriz A X Matriz B")
    imprimirMatrix( mAXmB )
    
    func imprimirMatrix ( _ matrix: [[Int]] ) {
        
        for arreglo in matrix{
            print(arreglo)
        }
        
    }
    
    func multiplicarMatrices ( _ matrixA: [[Int]], _ matrixB: [[Int]] ) -> [[Int]] {
        if matrixA[0].count != matrixB.count {
            print("ERROR, NUMERO DE COLUMNAS DE MATRIZ A = NUMERO DE RENGLONES DE MATRIZ B")
            return [[]]
        }
        
        let tam = matrixA.count
        let col = matrixB[0].count
        var resultado: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: col), count: tam)
        
        imprimirMatrix(resultado)
        
        for i in 0..<matrixA.count{
            for j in 0..<matrixB[0].count {
                for k in 0..<matrixA[0].count {
                    resultado[i][j] += matrixA[i][k] * matrixB[k][j]
                }
            }
        }
        
        return resultado
        
    }
    
}


main()
