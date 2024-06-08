//
//  ContentView.swift
//  appPickerSwiftUI
//
//  Created by Jorge Cisneros on 07/06/24.
//

import SwiftUI

enum sabor: String, CaseIterable, Identifiable {
    case chocolate
    case vanilla
    case fresa
    
    var id: String {self.rawValue}
}

struct VentadDeHelados : View {
    @State private var saborSeleccionado = sabor.chocolate
    
    var body: some View {
        Picker("Sabor", selection: $saborSeleccionado) {
            
            Text("Chocolate 🍫").tag(sabor.chocolate)
            Text("Vainilla 🍨").tag(sabor.vanilla)
            Text("Fresa 🍓").tag(sabor.fresa)
            
        } // Picker
        
        VStack {
            Image(systemName: "moon.circle.fill")
                .imageScale(.large)
                .foregroundColor(.blue)
            Text( "Sabor seleccionado: \(saborSeleccionado.rawValue)" )
        }
        .padding() // VStack
        
    } // body
}

//struct ContentView: View {
//    var body: some View {
//        VStack{
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundColor(.blue)
//            Text("Hello, world!")
//        }
//        .padding()
//    }
//}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        //ContentView()
        VentadDeHelados()
    }
}
