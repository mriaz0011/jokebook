//
//  JokeListCell.swift
//  jokebook
//
//  Created by Muhammad Riaz on 04/02/2021.
//

import UIKit

class JokeListCell: UITableViewCell {

    class var reuseIdentifier: String {
        return "JokeListCell"
    }
    
    @IBOutlet weak var jokeItemLbl: UILabel!
    @IBOutlet weak var itemBgView: UIView!{
        didSet{
            itemBgView.layer.cornerRadius = 12.0
        }
    }
    @IBOutlet weak var detailItemImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
