//
//  SecondViewController.swift
//  nano challenge navigation
//
//  Created by Yoshua Elmaryono on 14/08/18.
//  Copyright © 2018 Yoshua Elmaryono. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var name: String!
    var selectedIngredient: IngredientType?
    var dataBowl: [IngredientType] = [.base, .protein, .supplement, .topping, .dressing]
    @IBOutlet weak var greeting: UILabel!
    @IBOutlet weak var bowlTableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataBowl.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        cell.titleLabel.text = dataBowl[indexPath.row].rawValue
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIngredient = dataBowl[indexPath.row]
        performSegue(withIdentifier: "showMenu", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        greeting.text = "Hi, " + name
        
        bowlTableView.delegate = self
        bowlTableView.dataSource = self
        
        bowlTableView.estimatedRowHeight = 60
        bowlTableView.rowHeight = UITableViewAutomaticDimension
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! MenuViewController
        destination.ingredientType = selectedIngredient
    }

}
