//
//  ViewController.swift
//  Kompanion
//
//  Created by Emil Shafigin on 3/4/23.
//

import UIKit

final class MainScreenVC: UIViewController {

    let viewModel = MainScreenViewModel()
    var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()

        viewModel.fetchStarships { [weak self] success in
            guard let self = self else { return }
            if success {
                self.activityIndicator.stopAnimating()
                self.tableView.reloadData()
            }
        }
    }
    
    private func setupUI() {
        setupTableView()
        setupActivityIndicator()
    }
    
    private func setupActivityIndicator() {
        activityIndicator = UIActivityIndicatorView(frame: CGRect(origin: .zero, size: CGSize(width: 50, height: 50)))
        view.addSubview(activityIndicator)
        activityIndicator.center = view.center
        activityIndicator.style = .medium
        activityIndicator.startAnimating()
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetailsSegue" {
            guard let vc = segue.destination as? DetailScreenVC,
                  let cell = sender as? UITableViewCell,
                  let indexPath = tableView.indexPath(for: cell) else { return }
            let starship = viewModel.starships[indexPath.row]
            vc.starship = starship
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
    }
    
}
