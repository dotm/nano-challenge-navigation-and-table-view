//
//  MenuViewController.swift
//  nano challenge navigation
//
//  Created by Yoshua Elmaryono on 14/08/18.
//  Copyright © 2018 Yoshua Elmaryono. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var ingredientType: IngredientType?
    var ingredientData = IngredientData()
    var menu: [String] = []
    @IBOutlet weak var menuTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        menuTable.delegate = self
        menuTable.dataSource = self
        
        menuTable.estimatedRowHeight = 60
        menuTable.rowHeight = UITableViewAutomaticDimension
        
        switch ingredientType! {
        case .base:
            menu = ingredientData.bases
        case .protein:
            menu = ingredientData.proteins
        case .supplement:
            menu = ingredientData.supplemets
        case .topping:
            menu = ingredientData.toppings
        case .dressing:
            menu = ingredientData.dressings
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menu.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath) as! MenuTableViewCell
        cell.menuImage.image = UIImage(named: menu[indexPath.row])
        cell.menuLabel.text = menu[indexPath.row]
        return cell
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
