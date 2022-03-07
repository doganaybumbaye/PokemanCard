//
//  CardView.swift
//  PokemonCards
//
//  Created by Doğanay Şahin on 4.03.2022.
//

import Foundation
import UIKit


class CardView : UIView{

    var isFlipped = false

    lazy var contentView: UIView = {
        let view = UIView()
        view.layer.borderWidth = 1.0
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.backgroundColor = .white
        view.layer.cornerRadius = 36
        view.isUserInteractionEnabled = false
        return view
    }()
    
    lazy var loadingView : UILabel = {
        let loading  = UILabel()
        loading.text = "Loading..."
        loading.textAlignment = .center
        loading.font = UIFont.systemFont(ofSize: 24)
        return loading
    }()


    lazy var pokeName : UILabel = {
        let text = createLabel(textLabel: "Poke name", fontSize: 32)
        return text
        }()
    
    lazy var pokeImage : UIImageView = {
       let imageView = UIImageView()
        let image = UIImage(named: "")
        imageView.contentMode = .scaleAspectFit
        
        imageView.isHidden = true
        return imageView
    }()
    
    lazy var pokeHP : UILabel = {
       let hpLabel = createLabel(textLabel: "hp", fontSize: 16)
        hpLabel.textAlignment = .center
        return hpLabel
    }()
    
    lazy var pokeAttackLabel : UILabel = {
       let attackLabel = createLabel(textLabel: "attack", fontSize: 18)
        attackLabel.textAlignment = .center
        return attackLabel
    }()
    
    lazy var pokeDefenseLabel : UILabel = {
       let defenseLabel = createLabel(textLabel: "defense", fontSize: 18)
        defenseLabel.textAlignment = .center
        return defenseLabel
    }()

    lazy var pokeHPValue : UILabel = {
       let hpValue = createLabel(textLabel: "hpval", fontSize: 32, isBold: true)
        hpValue.textAlignment = .center
        return hpValue
    }()
    
    lazy var pokeAttackValue : UILabel = {
       let attackValue = createLabel(textLabel: "attackval", fontSize: 32, isBold: true)
        attackValue.textAlignment = .center
        return attackValue
    }()
    
    lazy var pokeDefenseValue : UILabel = {
       let defenseValue = createLabel(textLabel: "defense", fontSize: 32, isBold: true)
        defenseValue.textAlignment = .center
        return defenseValue
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setUPCardView()
        setUPConstraints()
        
    }
    
    func setUPCardView(){
//        showNextPokemon()
        self.addSubview(contentView)
        contentView.addSubview(pokeName)
        contentView.addSubview(pokeImage)
//        let tap = UITapGestureRecognizer(target: self, action: #selector(showNextPokemon))
//        contentView.addGestureRecognizer(tap)
        self.isUserInteractionEnabled = true
        
        
    }
    
    func setUPConstraints(){
        setupContentViewConstraints()
    }
    
    func setupContentViewConstraints() {
        pokeName.centerX(inView: contentView, topAnchor: contentView.topAnchor, paddingTop: 20)
        pokeImage.anchor(top: pokeName.bottomAnchor, left: contentView.leftAnchor, bottom: contentView.bottomAnchor, right: contentView.rightAnchor, paddingTop: 10, paddingLeft: 20, paddingBottom: 150, paddingRight: 20)

        let stackedHP = UIStackView(arrangedSubviews: [pokeHP, pokeHPValue])
        stackedHP.axis = .vertical
        stackedHP.distribution = .fillProportionally
        contentView.addSubview(stackedHP)

        let stackedAttack = UIStackView(arrangedSubviews: [pokeAttackLabel, pokeAttackValue])
        stackedAttack.axis = .vertical
        stackedAttack.distribution = .fillProportionally
        contentView.addSubview(stackedAttack)

        let stackedDefense = UIStackView(arrangedSubviews: [pokeDefenseLabel, pokeDefenseValue])
        stackedDefense.axis = .vertical
        stackedDefense.distribution = .fillProportionally
        contentView.addSubview(stackedDefense)
   
        let allStack = UIStackView(arrangedSubviews: [stackedHP, stackedAttack, stackedDefense])
        allStack.axis = .horizontal
        allStack.distribution = .fillEqually
        contentView.addSubview(allStack)
        allStack.anchor(top: pokeImage.bottomAnchor, left: contentView.leftAnchor, bottom: contentView.bottomAnchor, right: contentView.rightAnchor, paddingTop: 50, paddingLeft: 20, paddingBottom: 20, paddingRight: 20)
    }
    
    

    
    func flipCard(){
        

        if isFlipped{
            CardView.transition(with: contentView, duration: 0.5, options: UIView.AnimationOptions.transitionFlipFromLeft, animations: nil, completion: nil)
            self.isFlipped = false
        }else{
            CardView.transition(with: contentView, duration: 0.5, options: .transitionFlipFromTop) {
                CardView.animate(withDuration: 0.5, delay: 0.5,
                                      usingSpringWithDamping: 0.5, initialSpringVelocity: 0.0, options: [], animations: {
                   
                    let groupAnimation = CAAnimationGroup()
                    groupAnimation.beginTime = CACurrentMediaTime()
                    groupAnimation.duration = 0.5
                    groupAnimation.fillMode = .backwards
                    
                    let scaleDown = CABasicAnimation(keyPath: "transform.scale")
                    scaleDown.fromValue = 1.0
                    scaleDown.toValue = 1.0
                    
                    let rotate = CABasicAnimation(keyPath: "transform.rotation")
                    rotate.fromValue = .pi / 3.0
                    rotate.toValue = 0.0
                    
                    groupAnimation.animations = [scaleDown, rotate]
                    self.contentView.layer.add(groupAnimation, forKey: nil)

                }, completion: nil)
                
            } completion: { Bool in
                self.isFlipped = true
            }
        }
        
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
