//
//  CocktailViewController.swift
//  CocktailApp
//
//  Created by user235857 on 4/19/24.
//

import UIKit

class CocktailViewController: UIViewController {

    
    var id: String = ""
    
    
    
    @IBOutlet weak var cocktailImage: UIImageView!
    
    @IBOutlet weak var drinkName: UILabel!
    
    
    @IBOutlet weak var drinkCategory: UILabel!
    
    
    @IBOutlet weak var strAlcoholic: UILabel!
    
    @IBOutlet weak var instructions: UILabel!
    
    
    
    @IBOutlet weak var instructionsES: UILabel!
    
    
    
    @IBOutlet weak var instructionsDE: UILabel!
    
    
    
    var cocktails: [Cocktail] = []

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        drinkService.shared.getCocktailDetails(searchId:id) { cocktail in
            
            self.cocktails = cocktail.drinks!
            // Update cocktails array with the fetched data
            DispatchQueue.main.async {
                self.drinkName.text = self.cocktails[0].strDrink
                self.drinkCategory.text = self.cocktails[0].strCategory
                self.strAlcoholic.text = self.cocktails[0].strAlcoholic
                self.instructions.text = self.cocktails[0].strInstructions
                self.instructionsDE.text = self.cocktails[0].strInstructionsDE
                self.instructionsES.text = self.cocktails[0].strInstructionsES
                
                self.loadImage(from: self.cocktails[0].strDrinkThumb!,into: self.cocktailImage)                // do the UI update
                
                
            }
        }
        
        
        
        
        
        
        
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
