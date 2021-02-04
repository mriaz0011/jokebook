//
//  JokeCategoryVC.swift
//  jokebook
//
//  Created by Muhammad Riaz on 04/02/2021.
//

import UIKit

class JokeCategoryVC: UIViewController {
    
    private var selectedCategory: JokeCategory?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backBtnAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func categoryListBtnAction(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            selectedCategory = .general
            self.performSegue(withIdentifier: "categoryListVC", sender: nil)
        case 1:
            selectedCategory = .knockknock
            self.performSegue(withIdentifier: "categoryListVC", sender: nil)
        case 2:
            selectedCategory = .programming
            self.performSegue(withIdentifier: "categoryListVC", sender: nil)
        default:
            fatalError()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "categoryListVC" {
            if let destination = segue.destination as? JokeListVC {
                destination.category = selectedCategory
            }
        }
    }
}
