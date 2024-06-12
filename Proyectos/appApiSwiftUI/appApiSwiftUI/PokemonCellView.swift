//
//  PokemonCellView.swift
//  appApiSwiftUI
//
//  Created by Jorge Cisneros on 11/06/24.
//

import Foundation
import SwiftUI

struct PokemonCellView: View {
    
    let pokemon: PokemonModel
    let viewModel: PokemonViewModel
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor( viewModel.getColorBaseOnType(type: pokemon.type) )
                .cornerRadius( 25.0 )
            
            VStack {
                AsyncImage( url: URL( string: pokemon.imageUrl ) ) { image in
                    image
                        .resizable()
                        .aspectRatio( contentMode: .fill )
                } placeholder: {
                    ProgressView()
                }
                .frame( width: 100, height: 100 )
                .shadow( radius: 12 )
                
                Text(pokemon.name)
                    .font(.body)
                    .foregroundColor(.white)
            }
        }
    }
}
