//
//  myTableViewCell.swift
//  ArticleApp
//
//  Created by Team M on 11/25/21.
//

import UIKit

class myTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabelCell: UILabel!
    @IBOutlet weak var categoryLabelCell: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
