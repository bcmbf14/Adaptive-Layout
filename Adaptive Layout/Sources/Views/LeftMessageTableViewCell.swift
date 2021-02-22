//
//  LeftMessageTableViewCell.swift
//  Adaptive Layout
//
//  Created by jc.kim on 2/22/21.
//

import UIKit

class LeftMessageTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "LeftMessageTableViewCell"
    
    @IBOutlet weak var profileButton: UIButton!
    @IBOutlet weak var chatLabel: UILabel!
    
    var callback: (()-> Void)?
    
    @IBAction func profileButtonDidTap(_ sender: Any) {
        callback?()
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        profileButton.backgroundColor = .clear
        profileButton.imageView?.tintColor = .systemGray
        profileButton.setImage(UIImage(systemName: "person.circle.fill", withConfiguration: UIImage.SymbolConfiguration(textStyle: .largeTitle)), for: .normal)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
