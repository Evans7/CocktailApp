//
//  ViewController.swift
//  CocktailApp
//
//  Created by user235857 on 4/19/24.
//

import UIKit

class ViewController: UIViewController,UISearchBarDelegate,UITableViewDelegate,UITableViewDataSource {

    var cocktails: [Cocktail] = []
    @IBOutlet weak var cocktailTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    @IBOutlet weak var searchBar: UISearchBar!
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (cocktails.count)
       }
       
       func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
                  // Return custom height for each row
                  return 150 // Change this to your desired height
              }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? DrinkMinimalTableViewCell
           cell?.drinkName.text=cocktails[indexPath.row].strDrink;
           loadImage(from: cocktails[indexPath.row].strDrinkThumb!,into: cell!.drinkImage)
            return cell!
           
       }
    
    func loadImage(from urlString: String,into imageView: UIImageView) {
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else { return }
            
            DispatchQueue.main.async {
                imageView.image = UIImage(data: data)
            }
        }.resume()
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
            {
                performSegue(withIdentifier: "cocktail", sender: indexPath)
            }
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
                     if segue.identifier == "cocktail" {
                         
                         if let indexPath = sender as? IndexPath {
                             let cocktail = segue.destination as? CocktailViewController
                             cocktail!.id = cocktails[indexPath.row].idDrink
                             
                         }
                     }
                 }
    
    
    
    
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String){
        if searchText.count > 2 {
                drinkService.shared.getListOfCocktails(searchText: searchText) { listOfCocktails in
                    // Check if the response list is not empty
                    if let drinks = listOfCocktails.drinks, !drinks.isEmpty {
                        // Update cocktails array with the fetched data
                        self.cocktails = drinks
                        // Reload table view on the main thread
                        DispatchQueue.main.async {
                            self.cocktailTable.reloadData()
                        }
                    } else {
                        
                        print("No cocktails found for the search query")
                        
                    }
                }
            } else if searchText.isEmpty {
                
                self.cocktails = []
              
                DispatchQueue.main.async {
                    self.cocktailTable.reloadData()
                }
            }        }
}

