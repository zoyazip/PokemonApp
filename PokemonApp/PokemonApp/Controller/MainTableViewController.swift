//
//  MainTableViewController.swift
//  PokemonApp
//
//  Created by d.chernov on 24/04/2023.
//

import UIKit

class MainTableViewController: UITableViewController {

    var pokey: [Card] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getPokemonData()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    func getPokemonData(){
        let jsonUrl = "https://api.pokemontcg.io/v1/cards"
                
                guard let url = URL(string: jsonUrl) else { return }
                
                var request = URLRequest(url: url)
                request.httpMethod = "GET"
                
                let config = URLSessionConfiguration.default
                config.waitsForConnectivity = true
                
                URLSession(configuration: config).dataTask(with: request) { data, response, error in
                    if error != nil {
                        print((error?.localizedDescription)!)
                    }
                    
                    guard let data = data else {
                        print(String(describing: error))
                        return
                    }
                    
                    do {
                        let jsonData = try JSONDecoder().decode(Pokemon.self, from: data)
                        dump(jsonData)
                        self.pokey = jsonData.cards
                        
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                        }
                        
                    }catch{
                        print("error:::::" , error)
                    }
                    
                    
                }.resume()
                
            
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return pokey.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "pokemonCell", for: indexPath) as? CellTableViewCell else {
                    return UITableViewCell()
                }
        let poke = pokey[indexPath.row]
        cell.setupUI(withDataFrom: poke)
        if(poke.supertype == "Trainer"){
            cell.backgroundColor = UIColor(red: 227/255, green: 253/255, blue: 213/255, alpha: 1)
        }
        

        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

     
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "pokemonDetailSegue" {
                    guard let destinationVC = segue.destination as? PokemonDetailViewController, let row = tableView.indexPathForSelectedRow?.row else { return
                    }
                    destinationVC.pokemon = pokey[row]
                    
                }
    }
    

}
