//
//  ListView.swift
//  appFirebaseSwiftUI
//
//  Created by Ivanovicx Nuñez on 10/06/24.
//

import SwiftUI
import Firebase

struct ListView: View {
    
    @EnvironmentObject var dataManager: DataManager
    @State private var showPopup = false
    
    var body: some View {
        NavigationView {
            
            List( dataManager.dogs, id: \.id ) { dog in
                
                HStack {
                    Text( dog.icono )
                    Text( dog.breed )
                    Text( " - " )
                    Text( dog.nombre )
                }
                
            }
            .navigationTitle( "Dogs" )
            .navigationBarItems( trailing: Button( action: {
                // add
                showPopup.toggle()
            }, label: {
                Image( systemName: "plus" )
            } ) )
            .sheet( isPresented: $showPopup ) {
                NewDogView()
            }
            
            
        }
        
        
    }
}

#Preview {
    ListView(  )
        .environmentObject( DataManager() )
}
