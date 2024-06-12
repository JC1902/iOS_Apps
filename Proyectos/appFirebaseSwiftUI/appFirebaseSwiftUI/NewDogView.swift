//
//  NewDogView.swift
//  appFirebaseSwiftUI
//
//  Created by Ivanovicx Nuñez on 10/06/24.
//

import SwiftUI

struct NewDogView: View {
    
    @EnvironmentObject var dataManger: DataManager
    
    @State private var newDog = ""
    @State private var nameDog = ""
    @State private var perrito = 0
    
    let emojis = [ "🦄", "🐶", "⛄️", "🌈", "🍭", "🎮", "🎨", "🧸", "👹", "🤡", "👾" ]
    
    var body: some View {
        
        VStack( spacing: 20 ) {
            TextField( "", text: $newDog )
                .placeholder(when: newDog.isEmpty ) {
                    Text( "Ingrese una raza de perros" )
                        .foregroundColor( .gray )
                        .bold()
                }
            
            Rectangle()
                .frame( width: 350, height: 1 )
                .foregroundColor( .black )
            
            TextField( "", text: $nameDog )
                .placeholder(when: nameDog.isEmpty ) {
                    Text( "Ingrese el nombre del 🐶" )
                        .foregroundColor( .gray )
                        .bold()
                }
            
            Rectangle()
                .frame( width: 350, height: 1 )
                .foregroundColor( .black )
            
            Picker( "Selecciona un emoji:", selection: $perrito ) {
                
                ForEach( 0..<emojis.count ) {
                    Text( self.emojis[ $0 ] )
                }
                
            }
            .pickerStyle( SegmentedPickerStyle() )
            
            Text( "\(emojis [perrito])" )
            
            Button {
                // add dog
                let newDog = Dog(id: UUID().uuidString, icono: emojis[perrito], breed: newDog, nombre: nameDog)
                dataManger.addDog( dog: newDog )
            } label: {
                
                Text("Save")
                
            }
        }
        .padding()
        
    }
}

#Preview {
    NewDogView()
}
