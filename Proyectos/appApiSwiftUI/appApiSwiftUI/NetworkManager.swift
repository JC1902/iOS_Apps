//
//  NetworkManager.swift
//  appApiSwiftUI
//
//  Created by Jorge Cisneros on 11/06/24.
//

import Foundation

enum APError: Error {
    case invalidURL
    case unableToComplete
    case invalidResponse
    case invalidData
    case decodingError
}

class NetworkManager {
    
    static let shared = NetworkManager()
    static let baseURL = "https://pokedex-bb36f.firebaseio.com/pokemon.json"
    
    init() {
        
    }
    
    func getListOfPokemon ( completed: @escaping (Result<[PokemonModel], APError>) -> Void ) {
        guard let url = URL( string: NetworkManager.baseURL ) else {
            completed( .failure( .invalidURL ) )
            return
        }
        
        let task = URLSession.shared.dataTask( with: url ) { data, _, error in
            guard let data = data?.parseData( removeString: "null," ) else {
                completed( .failure( .decodingError ) )
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decoderResponse = try decoder.decode( [PokemonModel].self, from: data )
                completed( .success( decoderResponse ) )
            } catch {
                completed( .failure( .decodingError ) )
            }
            
        }
        
        task.resume()
        
    } // getlistofpokemin
    
} // class Networkmanager

extension Data {
    func parseData( removeString word: String ) -> Data? {
        let dataAsString = String( data: self, encoding: .utf8 )
        let parseDataString = dataAsString?.replacingOccurrences( of: word, with: "" )
        
        guard let data = parseDataString?.data( using: .utf8 ) else { return nil }
        
        return data
    }
}

struct MockData {
    static let pokemon = PokemonModel( id: 123, attack: 99, defense: 99, description: "Almost incapable of moving, this Pokemon can only fharden its shell to protect itself from predators.", name: "Eve", imageUrl: "https://firebasesstorage.googleapis.com/v0/b/pokedex-bb36f.appspot.com/o/pokemon_images%2F2CF15848-AAF9-49C0-90E4-28DC78F60A78?alt=media&token=15ecd49b-89ff-46d6-be0f-1812c948e334", type: "poison" )
}
