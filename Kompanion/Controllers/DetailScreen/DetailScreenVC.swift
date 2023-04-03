//
//  DetailScreenVC.swift
//  Kompanion
//
//  Created by Emil Shafigin on 3/4/23.
//

import UIKit

final class DetailScreenVC: UITableViewController {
    
    var starship: Starship?
    
    //MARK: - IBOutlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var manufacturerLabel: UILabel!
    @IBOutlet weak var starshipClassLabel: UILabel!
    @IBOutlet weak var lengthLabel: UILabel!
    @IBOutlet weak var atmoshereSpeedLabel: UILabel!
    @IBOutlet weak var passengersLabel: UILabel!
    @IBOutlet weak var hyperdriveRatingLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureLabels()
    }
    
    private func configureLabels() {
        guard let starship = starship else { return }
        
        nameLabel.text = starship.name
        manufacturerLabel.text = starship.manufacturer
        starshipClassLabel.text = starship.starshipClass
        lengthLabel.text = starship.length
        atmoshereSpeedLabel.text = starship.maxAtmospheringSpeed
        passengersLabel.text = starship.passengers
        hyperdriveRatingLabel.text = starship.hyperdriveRating
    }

}
