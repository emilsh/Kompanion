//
//  ViewController.swift
//  Kompanion
//
//  Created by Emil Shafigin on 3/4/23.
//

import UIKit
import SnapKit

final class MainScreenVC: UIViewController {

    let viewModel = MainScreenViewModel()
    weak var coordinator: MainCoordinator?
    
    lazy var tableView: UITableView = {
        let tblView = UITableView(frame: .zero)
        tblView.register(StarshipCell.self, forCellReuseIdentifier: "StarshipCell")
        tblView.dataSource = self
        tblView.delegate = self
        view.addSubview(tblView)
        return tblView
        
    }()
    
    lazy var activityIndicator: UIActivityIndicatorView = {
        let actInd = UIActivityIndicatorView(frame: .zero)
        view.addSubview(actInd)
        actInd.style = .medium
        actInd.startAnimating()
        return actInd
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        fetchStarships()
    }
    
    private func fetchStarships() {
        viewModel.fetchStarships { [weak self] success in
            guard let self = self else { return }
            if success {
                self.activityIndicator.stopAnimating()
                self.tableView.reloadData()
            }
        }
    }
    
    private func setupUI() {
        setupConstraints()
        title = "The Star Wars Starships"
    }
    
    private func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
        
        activityIndicator.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
    }
    
}

extension MainScreenVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.starships.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "StarshipCell", for: indexPath) as? StarshipCell else {
            return UITableViewCell()
        }
        
        let starship = viewModel.starships[indexPath.row]
        cell.configureCell(with: starship)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let starship = viewModel.starships[indexPath.row]
        coordinator?.openDetailScreenVC(with: starship)
    }
}
