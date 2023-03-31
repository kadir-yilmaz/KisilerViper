//
//  KisiTableViewCell.swift
//  KisilerViper
//
//  Created by Kadir Yılmaz on 22.03.2023.
//

import UIKit

class KisiTableViewCell: UITableViewCell {

    @IBOutlet weak var kisiAdLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
