//
//  PokemonModel.swift
//  appApiSwiftUI
//
//  Created by Jorge Cisneros on 11/06/24.
//

import Foundation

struct PokemonModel: Codable, Hashable {
    
    let id: Int
    let attack: Int
    let defense: Int
    let description: String
    let name: String
    let imageUrl: String
    let type: String
    
}
