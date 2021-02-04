//
//  JokeListVC.swift
//  jokebook
//
//  Created by Muhammad Riaz on 04/02/2021.
//

import UIKit
import Network

class JokeListVC: UIViewController {

    var jokeItems: [JokeItems?] = []
    private var categoryName: String?
    var category: JokeCategory?
    private var resource: JokeItemResourceProtocol = JokeItemResource()
    var selectedSetup: String?
    var selectedPunchline: String?
    
    //To Check Internet Connectivity
    let monitor = NWPathMonitor()
    let queue = DispatchQueue(label: "InternetConnectionMonitor")
    
    @IBOutlet weak var categoryTitleLbl: UILabel!
    @IBOutlet weak var itemListTblView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        internetConnectionStatus()
        
        // Do any additional setup after loading the view.
        if(category != nil) {
            switch category {
            case .general:
                categoryName = "general"
                categoryTitleLbl.text = "General"
            case .knockknock:
                categoryName = "knock-knock"
                categoryTitleLbl.text = "Knock-Knock"
            case .programming:
                categoryName = "programming"
                categoryTitleLbl.text = "Programming"
            default:
                fatalError()
            }
            
            resource.getJokeItems(category: categoryName!) { (response) in
                self.jokeItems = response
                DispatchQueue.main.async {
                        self.itemListTblView.reloadData()
                }
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    func internetConnectionStatus() {
        let alert = UIAlertController(title: "Internet Connection?", message: "There is no internet connection", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        monitor.pathUpdateHandler = { pathUpdateHandler in
            if pathUpdateHandler.status == .satisfied {
                print("Internet connection is on.")
            } else {
                self.present(alert, animated: true)
            }
        }
        monitor.start(queue: queue)
    }
    
    @IBAction func backBtnAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "itemDetailsVC" {
            if let destination = segue.destination as? JokeItemDetailsVC {
                destination.setup = selectedSetup
                destination.punchline = selectedPunchline
                destination.category = category
            }
        }
    }
}
