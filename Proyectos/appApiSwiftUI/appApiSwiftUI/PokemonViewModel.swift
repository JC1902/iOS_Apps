//
//  PokemonViewModel.swift
//  appApiSwiftUI
//
//  Created by Jorge Cisneros on 11/06/24.
//

import Foundation
import SwiftUI

class PokemonViewModel: ObservableObject {
    
    @Published var listPokemon = [PokemonModel]()
    @Published var filteredPokemon = [PokemonModel]()
    
    init() {
        
        getListPokemon()
        
    }
    
    func getListPokemon() {
        
        NetworkManager.shared.getListOfPokemon { result in
            DispatchQueue.main.async {
                switch result {
                case .success( let listPokemon ):
                    print("listPokemon: \(listPokemon.count)")
                    self.listPokemon = listPokemon
                    self.filteredPokemon = listPokemon
                    
                case .failure( let error ):
                    print("Error: \(error.localizedDescription)")
                }
            }
        }
        
    } // getlistpokemon
    
    func filterPokemon( name: String ) {
        
        if name.isEmpty {
            filteredPokemon = listPokemon
        } else {
            filteredPokemon = listPokemon.filter ( { pokemon in
                pokemon.name.lowercased().contains( name.lowercased() )
            })
        }
        
    }
    
    func getColorBaseOnType( type: String ) -> Color {
        switch type {
        case "poison":
            return .purple
        case "fire":
            return .red
        case "water":
            return .blue
        case "bug":
            return Color( uiColor: #colorLiteral(red: 0.6397841959, green: 1, blue: 0.3083150965, alpha: 1) )
        case "grass":
            return .green
        case "flying":
            return .mint
        case "normal":
            return Color( uiColor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1) )
        case "electric":
            return .yellow
        case "ground":
            return .brown
        case "fairy":
            return Color( uiColor: #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1) )
        case "psychic":
            return Color( uiColor: #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1) )
        case "dragon":
            return Color( uiColor: #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1) )
        case "fighting":
            return Color( uiColor: #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1) )
        case "ice":
            return .teal
        case "steel":
            return Color( uiColor: #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1) )
        default:
            return .white
        }
    }
    
} //pokemonviewmodel

extension Color {
    init(uiColor: UIColor) {
        self.init(UIColor(cgColor: uiColor.cgColor))
    }
}
