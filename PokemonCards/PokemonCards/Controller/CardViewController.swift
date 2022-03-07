//
//  ViewController.swift
//  PokemonCards
//
//  Created by Doğanay Şahin on 3.03.2022.
//

import UIKit

class CardViewController: UIViewController {

    var cardView : CardView = CardView()
    private var pokeURLs = [String]()
    private var index = 0
    
    private var pokeNames : Pokemon? {
        didSet{
            guard let pokeNames = pokeNames else {
                return
            }
            cardView.pokeName.text = pokeNames.name.capitalized
            cardView.pokeImage.setURLImage(pokeNames.sprites.front_default)
            cardView.pokeHPValue.text = String(pokeNames.stats[0].base_stat)
            cardView.pokeAttackValue.text = String(pokeNames.stats[1].base_stat)
            cardView.pokeDefenseValue.text = String(pokeNames.stats[0].base_stat)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .rgb(red: 172, green: 158, blue: 255)
        createUI()
        showNextPokemon()
        Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { (timer) in
            self.cardView.loadingView.removeFromSuperview()
            self.cardView.contentView.isUserInteractionEnabled = true
            
            self.setView(view: self.cardView.pokeName, hidden: false)
            self.setView(view: self.cardView.pokeImage, hidden: false)
            self.setView(view: self.cardView.pokeHP, hidden: false)
            self.setView(view: self.cardView.pokeHPValue, hidden: false)
            self.setView(view: self.cardView.pokeAttackValue, hidden: false)
            self.setView(view: self.cardView.pokeAttackLabel, hidden: false)
            self.setView(view: self.cardView.pokeDefenseLabel, hidden: false)
            self.setView(view: self.cardView.pokeDefenseValue, hidden: false)
        }
        
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        getAllPokeURLs()
        
    }

    func createUI(){
        
        loading()
        view.addSubview(cardView.contentView)
        cardView.contentView.center(inView: view)
        cardView.contentView.anchor(left: view.leftAnchor, paddingLeft: view.frame.width * 0.1, width: 300, height: 480)
       
        let tap = UITapGestureRecognizer(target: self, action: #selector(showNextPokemon))
        cardView.contentView.addGestureRecognizer(tap)
    }
    
    func loading(){
        cardView.contentView.addSubview(cardView.loadingView)
        cardView.loadingView.center(inView: cardView.contentView)
    }

    func getAllPokeURLs(){
        NetworkManager.shared.getAllPokemons { pokemonEntries in
            for entry in pokemonEntries {
                self.pokeURLs.append(entry.url)
                }
            }
       
        }
    
    @objc func showNextPokemon(){
        index += 1
        NetworkManager.shared.getPokemon(withURL: String(self.index)) { pokeman in
            DispatchQueue.main.async {
                self.pokeNames = pokeman

            }
        }
        cardView.flipCard()
    }
}
