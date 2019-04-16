//
//  ViewController.swift
//  Examples
//
//  Created by Crasneanu Cristian on 16/04/2019.
//  Copyright © 2019 Streetography. All rights reserved.
//

import UIKit
import STPhotoMap

class ViewController: UIViewController {
    
    private weak var tableView: UITableView?
    private var examples = [Example]()
    
    enum Example: String {
        case photoMapWithoutFilters = "Photo Map Without Filters"
        case photoMapWithUserFilter = "Photo Map With User Filter"
        case photoMapWithCollectionFilter = "Photo Map With Collection Filter"
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupSubviews()
        self.setupSubviewsConstraints()
        
        self.setupExamples()
    }
    
    func setupExamples() {
        self.examples = [.photoMapWithoutFilters, .photoMapWithUserFilter, .photoMapWithCollectionFilter]
    }
}

// MARK: - Table view delegate

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let example = self.examples[indexPath.row]
        switch example {
            case .photoMapWithoutFilters:
                let viewController = PhotoMapWithoutFiltersViewController()
                self.navigationController?.pushViewController(viewController, animated: true)
                break
            case .photoMapWithUserFilter:
                let viewController = PhotoMapWithUserFilterViewController()
                self.navigationController?.pushViewController(viewController, animated: true)
                break
            case .photoMapWithCollectionFilter:
                let viewController = PhotoMapWithCollectionFilterViewController()
                self.navigationController?.pushViewController(viewController, animated: true)
                break
        }
    }
}

// MARK: - Table view data source

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.examples.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let example = self.examples[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        cell.textLabel?.text = example.rawValue
        return cell
    }
}

// MARK: - Subviews configuration

extension ViewController {
    private func setupSubviews() {
        self.setupTableView()
    }
    
    private func setupTableView() {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        tableView.dataSource = self
        tableView.delegate = self
        self.view.addSubview(tableView)
        self.tableView = tableView
    }
}

// MARK: - Constraints configuration

extension ViewController {
    private func setupSubviewsConstraints() {
        self.setupTableViewConstraints()
    }
    
    private func setupTableViewConstraints() {
        self.tableView?.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        self.tableView?.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        self.tableView?.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.tableView?.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
    }
}


