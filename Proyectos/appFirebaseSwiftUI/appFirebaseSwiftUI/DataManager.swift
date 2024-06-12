//
//  DataManager.swift
//  appFirebaseSwiftUI
//
//  Created by Ivanovicx Nuñez on 10/06/24.
//

import SwiftUI
import Firebase

class DataManager: ObservableObject {
    
    @Published var dogs: [Dog] = []
    
    init() {
        fetchDogs()
    }
    
    func fetchDogs() {
        
        dogs.removeAll()
        let db = Firestore.firestore()
        let ref = db.collection( "Dogs" )
        ref.getDocuments { snapshot, error in
                
            guard error == nil else {
                
                print( error!.localizedDescription )
                return
                
            }
            
            if let snapshot = snapshot {
                
                for document in snapshot.documents {
                    
                    let data = document.data()
                    
                    let id = data["id"] as? String ?? ""
                    let breed = data["breed"] as? String ?? ""
                    let nombre = data["nombre"] as? String ?? ""
                    let icono = data["icono"] as? String ?? ""
                    
                    let dog = Dog( id: id, icono: icono, breed: breed, nombre: nombre )
                    self.dogs.append( dog )
                    
                }
                
            }
            
        }
        
    }
    
    func addDog( dog: Dog ) {
        
        let db = Firestore.firestore()
        let ref = db.collection( "Dogs" ).document( dog.id )
        
        ref.setData( ["breed": dog.breed, "id": dog.id, "nombre": dog.nombre, "icono": dog.icono] ) { error in
            if let error = error {
                print( error.localizedDescription )
            }
        }
        
    }
    
}
