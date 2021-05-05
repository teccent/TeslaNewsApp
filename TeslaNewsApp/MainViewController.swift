//
//  MainViewController.swift
//  TeslaNewsApp
//
//  Created by Теона Магай on 05.05.2021.
//

import UIKit
import Alamofire

class MainViewController: UITableViewController {
    
    private var articls: [Articl] = []
    private let activityIndicatorView = UIActivityIndicatorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupActivityIndicator(in: tableView)
        tableView.rowHeight = 250
        alamofireGet()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        articls.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ArticlViewCell else {
                fatalError()
            }
            cell.configure(with: articls[indexPath.section])
            return cell
        
    }
    
    private func setupActivityIndicator(in view: UIView) {
        activityIndicatorView.style = .large
        activityIndicatorView.color = .white
        activityIndicatorView.center = view.center
        activityIndicatorView.startAnimating()
        activityIndicatorView.hidesWhenStopped = true
        view.addSubview(activityIndicatorView)
    }
}

extension MainViewController {
    func alamofireGet() {
        AF.request(ApiManager.shared.articles)
            .validate()
            .responseJSON { dataResponse in
                switch dataResponse.result {
                case .success(let data):
                    self.articls = Articl.getArticles(from: data)
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                        self.activityIndicatorView.stopAnimating()
                    }
                case .failure(let error):
                    print(error)
                }
            }
    }
}

