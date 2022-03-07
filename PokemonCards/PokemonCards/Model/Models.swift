//
//  Models.swift
//  PokemonCards
//
//  Created by Doğanay Şahin on 4.03.2022.
//

import Foundation

struct Pokemons : Codable {
    var results : [PokemonEntry]
}

struct PokemonEntry : Codable {
    let name : String
    let url : String
}

struct Pokemon : Decodable ,Hashable, Identifiable{
    let id : Int
    var name : String
    let stats : [Stats]
    let sprites : sprites
}
struct Stats : Decodable ,Hashable{
    let base_stat: Int
}
struct sprites : Decodable ,Hashable{
    let front_default: String
}
