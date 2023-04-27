//
//  PokemonDetailViewController.swift
//  PokemonApp
//
//  Created by d.chernov on 25/04/2023.
//

import UIKit
import SDWebImage

class PokemonDetailViewController: UIViewController {
    
    var pokemon: Card?

    @IBOutlet weak var pokemonName: UILabel!
    @IBOutlet weak var pokemonImage: UIImageView!
    @IBOutlet weak var pokemonId: UILabel!
    @IBOutlet weak var pokemonType: UILabel!
    @IBOutlet weak var pokemonHP: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        pokemonImage.sd_setImage(with: URL(string: pokemon!.imageURL))
        pokemonName.text = pokemon?.name
        pokemonId.text = pokemon?.id
        pokemonType.text = pokemon?.supertype
        pokemonHP.text = pokemon?.hp
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
