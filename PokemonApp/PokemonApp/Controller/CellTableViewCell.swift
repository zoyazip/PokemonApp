//
//  CellTableViewCell.swift
//  PokemonApp
//
//  Created by d.chernov on 24/04/2023.
//

import UIKit
import SDWebImage

class CellTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var pokemonImage: UIImageView!
    @IBOutlet weak var pokemonRarity: UILabel!
    @IBOutlet weak var healthPoints: UILabel!
    @IBOutlet weak var pokemonType: UILabel!
    @IBOutlet weak var pokemonName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    func setupUI(withDataFrom: Card){
        
        pokemonName.text = "Name: " + withDataFrom.name
        pokemonRarity.text = "Rarity: " + (withDataFrom.rarity ?? "0")
        healthPoints.text = "HP: " + (withDataFrom.hp ?? "")
        pokemonImage.sd_setImage(with: URL(string: withDataFrom.imageURL))
        pokemonType.text = "Type: " + (withDataFrom.supertype ?? "")
        
        
        
//#warning("paint Trainer cell to different color")
    }
}
