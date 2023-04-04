//
//  DetailScreenVC.swift
//  Kompanion
//
//  Created by Emil Shafigin on 3/4/23.
//

import UIKit
import SnapKit

final class DetailScreenVC: UIViewController {
    
    var starship: Starship?
    
    weak var coordinator: MainCoordinator?
    
    let labelFont = UIFont.systemFont(ofSize: 14)
    
    lazy var nameLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = labelFont
        label.text = "nameLabel"
        view.addSubview(label)
        return label
    }()
    
    lazy var manufacturerLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = labelFont
        label.text = "manufacturerLabel"
        view.addSubview(label)
        return label
    }()
    
    lazy var starshipClassLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = labelFont
        label.text = "starshipClassLabel"
        view.addSubview(label)
        return label
    }()
    
    lazy var lengthLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = labelFont
        label.text = "lengthLabel"
        view.addSubview(label)
        return label
    }()
    
    lazy var atmoshereSpeedLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = labelFont
        label.text = "atmoshereSpeedLabel"
        view.addSubview(label)
        return label
    }()
    
    lazy var passengersLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = labelFont
        label.text = "passengersLabel"
        view.addSubview(label)
        return label
    }()
    
    lazy var hyperdriveRatingLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = labelFont
        label.text = "HyperdriveRatingLabel"
        view.addSubview(label)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupConstraints()
        configureLabels()
    }
    
    private func setupConstraints() {
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(24)
            make.leading.equalToSuperview().inset(12)
        }
        
        manufacturerLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(24)
            make.leading.equalToSuperview().inset(12)
        }
        
        starshipClassLabel.snp.makeConstraints { make in
            make.top.equalTo(manufacturerLabel.snp.bottom).offset(24)
            make.leading.equalToSuperview().inset(12)
        }
        
        lengthLabel.snp.makeConstraints { make in
            make.top.equalTo(starshipClassLabel.snp.bottom).offset(24)
            make.leading.equalToSuperview().inset(12)
        }
        
        atmoshereSpeedLabel.snp.makeConstraints { make in
            make.top.equalTo(lengthLabel.snp.bottom).offset(24)
            make.leading.equalToSuperview().inset(12)
        }
        
        passengersLabel.snp.makeConstraints { make in
            make.top.equalTo(atmoshereSpeedLabel.snp.bottom).offset(24)
            make.leading.equalToSuperview().inset(12)
        }
        
        hyperdriveRatingLabel.snp.makeConstraints { make in
            make.top.equalTo(passengersLabel.snp.bottom).offset(24)
            make.leading.equalToSuperview().inset(12)
        }
    }
    
    private func configureLabels() {
        guard let starship = starship else { return }
        title = starship.name
        nameLabel.text = "Name of starship: \(starship.name)"
        manufacturerLabel.text = "Manufacturer: \(starship.manufacturer)"
        starshipClassLabel.text = "Class: \(starship.starshipClass)"
        lengthLabel.text = "Length: \(starship.length)"
        atmoshereSpeedLabel.text = "Atmosphering Speed: \(starship.maxAtmospheringSpeed)"
        passengersLabel.text = "Passengers: \(starship.passengers)"
        hyperdriveRatingLabel.text = "Hyperdrive Rating: \(starship.hyperdriveRating)"
    }

}
