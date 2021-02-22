//
//  ProfileViewController.swift
//  Adaptive Layout
//
//  Created by jc.kim on 2/22/21.
//

import UIKit

class ProfileViewController: UIViewController {
    
    
 
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailButton: UIButton!
    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBAction func popAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
       super.willTransition(to: newCollection, with: coordinator)
       
       if newCollection.verticalSizeClass == .compact {
          nameLabel.textAlignment = .left
       } else {
          nameLabel.textAlignment = .center
       }
    }
    
    override func viewDidLoad() {
       super.viewDidLoad()
       
       emailButton.layer.cornerRadius = 3
       emailButton.layer.borderColor = UIColor.lightGray.cgColor
       emailButton.layer.borderWidth = 1
       
       profileImageView.layer.cornerRadius = profileImageView.bounds.width * 0.5
    }
 }
