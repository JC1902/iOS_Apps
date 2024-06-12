//
//  main.swift
//  appLinkedListaSwift
//
//  Created by Jorge on 08/05/24.
//

import Foundation

//import Foundation

class Node<T> { // clase para los nodos
  internal var data: T
  internal var next: Node<T>?
  init(data: T) {
    self.data = data
    self.next = nil
  }
}

class ProductoNode {
    internal var nombreProducto: String
    internal var precioProducto: Double
    internal var cantidadProducto: Int
    internal var next: ProductoNode?
    
    init(nombre: String, precio: Double, cantidad: Int) {
        self.nombreProducto = nombre
        self.precioProducto = precio
        self.cantidadProducto = cantidad
        self.next = nil
    }
}

class SinglyLinkedList<T: Equatable> { // Clase encargada de crear la lista con las caracteristicas de un nodo usadas para las distintas funciones
  internal var head: Node<T>?
  internal var count: Int = 0
    
  public init() {}
  
    init(first: Node<T>) {
    self.head = first
  }
    

    public func isEmpty() -> Bool { // si la lista esta vacia regresa 0
        return count == 0
      }
    
    
    public func imprimir() -> String {
        var salida = ""
        var actual = head // actual se inicia con la cabecera
        while actual != nil {
            salida += "\(actual!.data) -> "
            actual = actual?.next // el actual se pone como el siguiente
        }
        salida += "nil" // Marca el final de la lista
        return salida
    }
    
    public func imprimir2() -> String {
        
        var text = ""
        var node = head
        
        while node != nil {
            text += "\(node!.data)"
            node = node!.next
            
            if node != nil {
                text += " ➡️ "
            }
            
        }
        
        return text + " ➡️ nil"
        
    }
    
      public func size() -> Int { // regresa el tamaño de la lista
        
        return count
      }
    
      // adds an element at the beginning of the list
    
      public func add(element: T) { // añade un elemento
        let node = Node<T>(data: element)
        node.next = head
        head = node
        count += 1
      }

      // removes and returns an element from the beginning of the list
   
      public func remove() -> T? { // elimina el ultimo elemento que se agrego a la lista
        // Check if list is empty
       
        if isEmpty() {
          return nil
        }
        // get the data from the head
        
        let item = self.head?.data
        // move the head
       
        self.head = self.head?.next
        // decrease the count
        
        count -= 1
        return item
      }
    
    public func eliminarNodo(valor: T) {
        var actual = head
        var previo: Node<T>? = nil

        // Busca el nodo con el valor especificado
        while actual != nil && actual!.data != valor {
            previo = actual
            actual = actual?.next
        }

        // Si se encontró el nodo, se elimina
        if actual != nil {
            if previo != nil {
                previo?.next = actual?.next
            } else {
                head = actual?.next
            }
            count -= 1
        }
    }
    
    public func peek() -> T? { // muestra el ultimo valor agregado a la lista
      // if list is empty, return nil
      
      if isEmpty() {
        return nil
      }
      // otherwise return the data stored in head
        
      return head?.data
    }
}


// instantiate a singly linked list to store integers

var singlyLinkedList = SinglyLinkedList<String>()
// add elements to it
singlyLinkedList.add(element: "22")
singlyLinkedList.add(element: "31")
singlyLinkedList.add(element: "11")
singlyLinkedList.add(element: "57")
singlyLinkedList.add(element: "64")

singlyLinkedList.add(element: "Marcos")
singlyLinkedList.add(element: "Carlos")
singlyLinkedList.add(element: "Juan")

print("LISTA ENLAZADA")

// print the size and the head element

print("Size is \(singlyLinkedList.size())")


print("Head is \(singlyLinkedList.peek()!)")
// remove the first element
//singlyLinkedList.remove()
var eliminar = singlyLinkedList.remove()
//print("VALOR ELIMINADO : \(String(describing: eliminar))")
print("Valor eliminado : ",eliminar!)
// peek into the list again
// prints "New Head is 2"
print("New Head is \(singlyLinkedList.peek()!)")


//  EVALUACION:
//DOCUMENTE LA CLASE INDICANDO SU FUNCIONAMIENTO
//IMPLEMENTAR EL METODO IMPRIMIR
print("Impresión de la lista", singlyLinkedList.imprimir())
print("Impresión de la lista", singlyLinkedList.imprimir2())

singlyLinkedList.eliminarNodo(valor: "64")

print("Lista despues de borrar 64: ", singlyLinkedList.imprimir())

singlyLinkedList.eliminarNodo(valor: "Carlos")

print("Lista despues de borrar Carlos: ", singlyLinkedList.imprimir())

