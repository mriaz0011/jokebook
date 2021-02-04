//
//  JokeListVCExtension.swift
//  jokebook
//
//  Created by Muhammad Riaz on 04/02/2021.
//

import Foundation
import UIKit

extension JokeListVC: UITableViewDelegate, UITableViewDataSource{

    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        90.0
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.jokeItems.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if let cell = itemListTblView.dequeueReusableCell(withIdentifier: JokeListCell.reuseIdentifier, for: indexPath) as? JokeListCell {
            let data = jokeItems[indexPath.row]
            cell.jokeItemLbl.text = data?.setup
            
            switch category {
            case .general:
                cell.detailItemImg.image = #imageLiteral(resourceName: "button_next_general")
            case .knockknock:
                cell.detailItemImg.image = #imageLiteral(resourceName: "button_next_knock-knock")
            case .programming:
                cell.detailItemImg.image = #imageLiteral(resourceName: "button_next_programming")
            default:
                fatalError()
            }
            
            cell.selectionStyle = .none
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let data = jokeItems[indexPath.row]
        selectedSetup = data?.setup
        selectedPunchline = data?.punchline
        self.performSegue(withIdentifier: "itemDetailsVC", sender: nil)
    }
}
