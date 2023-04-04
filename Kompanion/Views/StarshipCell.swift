//
//  StoryCell.swift
//  Kompanion
//
//  Created by Emil Shafigin on 3/4/23.
//

import UIKit
import SnapKit

final class StarshipCell: UITableViewCell {
    
    lazy var nameLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.systemFont(ofSize: 15)
        addSubview(label)
        return label
    }()
    
    lazy var lengthLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.systemFont(ofSize: 15)
        label.textAlignment = .right
        addSubview(label)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        accessoryType = .disclosureIndicator
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        nameLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().inset(12)
            make.trailing.equalTo(lengthLabel.snp.leading).inset(12)
        }
        
        lengthLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(44)
            make.width.equalTo(60)
        }
    }
    
    func configureCell(with starship: Starship) {
        nameLabel.text = starship.name
        lengthLabel.text = starship.length
    }

}
