//
//  Network.swift
//  PokemonCards
//
//  Created by Doğanay Şahin on 4.03.2022.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    
    let baseURL = URL(string: "https://pokeapi.co/api/v2/pokemon/")!
    var pokemon: Pokemon?
    
    
    func getPokemon(withURL urlCount : String, completion : @escaping (Pokemon) -> ()){
        let requestURL = baseURL.appendingPathComponent(urlCount)
        let request = URLRequest(url: requestURL)
        URLSession.shared.dataTask(with: request) { (data, _, error) in
            if let error = error {
                print("Error fetching pokemon: \(error)")
                return
            }
            
            guard let data = data else { return }
            do {
                let pokemon = try JSONDecoder().decode(Pokemon.self, from: data)
                self.pokemon = pokemon
                completion(pokemon)
                            
            } catch {
                print("Error decoding Pokemon: \(error)")
                return
            }
        }.resume()
}
   
    
    func getAllPokemons(completion : @escaping ([PokemonEntry]) -> ()){
        URLSession.shared.dataTask(with: baseURL) { (data, response, error) in
            guard let data = data else {
                return
            }
            
            let pokeList = try! JSONDecoder().decode(Pokemons.self, from : data)
            completion(pokeList.results)
            
        }.resume()
}
}
