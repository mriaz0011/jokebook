//
//  JokeItemDetailsVC.swift
//  jokebook
//
//  Created by Muhammad Riaz on 04/02/2021.
//

import UIKit

class JokeItemDetailsVC: UIViewController {
    
    var setup: String?
    var punchline: String?
    var category: JokeCategory?
    
    @IBOutlet weak var jokeSetupLbl: UILabel!
    @IBOutlet weak var jokePunchlineLbl: UILabel!
    @IBOutlet weak var jokeItemBoxImgView: UIImageView!
    @IBOutlet weak var categoryNameLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if setup != nil && punchline != nil {
            jokeSetupLbl.text = setup
            jokePunchlineLbl.text = punchline
            
            switch category {
            case .general:
                categoryNameLbl.text = "General"
                jokeItemBoxImgView.image = #imageLiteral(resourceName: "box_general")
            case .knockknock:
                categoryNameLbl.text = "Knock-Knock"
                jokeItemBoxImgView.image = #imageLiteral(resourceName: "box_knock-knock")
            case .programming:
                categoryNameLbl.text = "Programming"
                jokeItemBoxImgView.image = #imageLiteral(resourceName: "box_programming")
            default:
                fatalError()
            }
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func backBtnAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
