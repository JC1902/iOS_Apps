//
//  ContentView.swift
//  appSwiftUI1
//
//  Created by Jorge Cisneros on 06/06/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            Image(systemName: "globe").imageScale(.large).foregroundColor(.blue)
            Text("Hola mundo")
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
