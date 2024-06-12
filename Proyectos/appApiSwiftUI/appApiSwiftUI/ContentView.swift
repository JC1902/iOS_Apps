//
//  ContentView.swift
//  appApiSwiftUI
//
//  Created by Jorge Cisneros on 11/06/24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = PokemonViewModel()
    @State private var pokemonToSearch = ""
    
    private let numberOfColumns = [
        GridItem( .flexible() ),
        GridItem( .flexible() ),
        GridItem( .flexible() ),
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid( columns: numberOfColumns ) {
                    ForEach( viewModel.filteredPokemon, id: \.self ) { pokemon in
                        NavigationLink( destination: PokemonDetailView(pokemon: pokemon) ) {
                            PokemonCellView( pokemon: pokemon, viewModel: viewModel )
                        }
                    }
                }.padding(20)
            } // scrollview
            .searchable( text: $pokemonToSearch, prompt: "Search pokemon" )
            .onChange( of: pokemonToSearch, perform: { newValue in
                withAnimation {
                    viewModel.filterPokemon( name: newValue )
                }
            } )
        }
        .navigationBarTitle("Pokedex", displayMode: .inline)// navigationStack
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
