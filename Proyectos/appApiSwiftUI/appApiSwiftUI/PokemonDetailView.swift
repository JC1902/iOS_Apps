//
//  PokemonDetailView.swift
//  appApiSwiftUI
//
//  Created by Jorge Cisneros on 11/06/24.
//

import SwiftUI

struct PokemonDetailView: View {
    
    @State private var isAnimating = false
    
    let pokemon: PokemonModel
    
    
    var body: some View {
        VStack {
            AsyncImage( url: URL( string: pokemon.imageUrl ) ) { image in
                image
                    .resizable()
                    .aspectRatio( contentMode: .fit )
            } placeholder: {
                ProgressView()
            }
            .frame( maxHeight: 250 )
            .shadow( radius: 12 )
            .scaleEffect( isAnimating ? 1.2 : 0.7 )
            
            Text(pokemon.description)
                .font(.system(size: 28))
                .lineLimit(4)
            
            VStack {
                Text("Type: \(pokemon.type)")
                    .font(.title2)
                
                HStack {
                    Text("Attack: \(pokemon.attack)")
                        .foregroundColor(.red)
                    
                    Text("Defense: \(pokemon.defense)")
                        .foregroundColor(.green)
                } // hsTACK
                .font(.title2)
                .bold()
            } // VStack
            
        } // Vstack
        .onAppear {
            DispatchQueue.main.asyncAfter( deadline: .now() + 0.3) {
                withAnimation {
                    isAnimating = true 
                }
            }
        }
        .padding( 15 )
        .navigationTitle( pokemon.name )
    }
}

struct PokemonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailView( pokemon: MockData.pokemon )
    }
}
