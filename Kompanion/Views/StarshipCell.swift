//
//  StoryCell.swift
//  Kompanion
//
//  Created by Emil Shafigin on 3/4/23.
//

import UIKit

final class StarshipCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var lengthLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureCell(with starship: Starship) {
        nameLabel.text = starship.name
        lengthLabel.text = starship.length
    }

}
