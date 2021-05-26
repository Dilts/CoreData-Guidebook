//
//  PlaceTableViewCell.swift
//  GuidebookCoreData
//
//  Created by Brian Dilts on 5/26/21.
//

import UIKit

class PlaceTableViewCell: UITableViewCell {

    // MARK: - Properties
    
    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var placeImageView: UIImageView!
    @IBOutlet weak var placeNameLabel: UILabel!
    
    // MARK: - Lifecycle
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        // Stule the cell background
        cardView.layer.cornerRadius = 5
        shadowView.layer.cornerRadius = 5
        shadowView.layer.shadowColor = CGColor(srgbRed: 0, green: 0, blue: 0, alpha: 0.5)
        shadowView.layer.shadowOpacity = 1
        shadowView.layer.shadowOffset = .zero
        shadowView.layer.shadowRadius = 5
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK: - Methods
    
    func setCell (_ p:Place) {
        
        if p.imageName != nil {
            // Set the image
            self.placeImageView.image = UIImage(named: p.imageName!)
        }
        // Set the label
        self.placeNameLabel.text = p.name
        
    }
    
    
}
