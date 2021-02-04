//
//  MainVC.swift
//  jokebook
//
//  Created by Muhammad Riaz on 03/02/2021.
//

import UIKit

class JokeMainVC: UIViewController {
    
    
    @IBOutlet weak var JokerImgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        UIView.animate(
            withDuration: 1, delay: 1, usingSpringWithDamping: 0.47, initialSpringVelocity: 3,
            options: .curveEaseOut, animations: {
                self.JokerImgView.center = self.view.center
        })
    }
    
    
    @IBAction func goToCategoryBtnAction(_ sender: UIButton) {
        self.performSegue(withIdentifier: "categoryVC", sender: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //Nothing to pass
    }
}
