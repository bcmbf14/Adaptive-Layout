//
//  RightMessageTableViewCell.swift
//  Adaptive Layout
//
//  Created by jc.kim on 2/22/21.
//

import UIKit

class RightMessageTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "RightMessageTableViewCell"
    
    @IBOutlet weak var chatLabel: UILabel!
    @IBOutlet weak var profileButton: UIButton!
    
    var callback: (()-> Void)?

    @IBAction func profileButtonDidTap(_ sender: Any) {
        callback?()
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        profileButton.backgroundColor = .clear
        profileButton.imageView?.tintColor = .systemBlue
        profileButton.setImage(UIImage(systemName: "person.circle.fill", withConfiguration: UIImage.SymbolConfiguration(textStyle: .largeTitle)), for: .normal)
    }


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
