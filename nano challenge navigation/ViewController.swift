//
//  ViewController.swift
//  nano challenge navigation
//
//  Created by Yoshua Elmaryono on 14/08/18.
//  Copyright © 2018 Yoshua Elmaryono. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var name: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func order(_ sender: UIButton) {
        if let text = name.text, !text.isEmpty {
            performSegue(withIdentifier: "goToOrderPage", sender: self)
        }else{
            return
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as? SecondViewController
        destination?.name = self.name.text
    }

}

