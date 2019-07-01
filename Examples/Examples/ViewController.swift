//
//  ViewController.swift
//  Examples
//
//  Created by Crasneanu Cristian on 16/04/2019.
//  Copyright © 2019 Streetography. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    private var examples = [Example]()
    
    enum Example: String {
        case photoMapWithoutFilters = "Photo Map Without Filters"
        case photoMapWithDynamicFilters = "Photo Map With Dynamic Filters"
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
        self.setupExamples()
        self.clearsSelectionOnViewWillAppear = true
    }
    
    func setupExamples() {
        self.examples = [.photoMapWithoutFilters, .photoMapWithDynamicFilters, .photoMapWithUserFilter, .photoMapWithCollectionFilter]
    }
}

// MARK: - Table view delegate

extension ViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewControllerToPush: UIViewController
        
        let example = self.examples[indexPath.row]
        switch example {
            case .photoMapWithoutFilters:
                viewControllerToPush = PhotoMapWithoutFiltersViewController()
                break
            case .photoMapWithDynamicFilters:
                viewControllerToPush = PhotoMapWithDynamicFiltersViewController()
                break
            case .photoMapWithUserFilter:
                viewControllerToPush = PhotoMapWithUserFilterViewController()
                break
            case .photoMapWithCollectionFilter:
                viewControllerToPush = PhotoMapWithCollectionFilterViewController()
                break
        }
        
        self.navigationController?.pushViewController(viewControllerToPush, animated: true)
    }
}

// MARK: - Table view data source

extension ViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.examples.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
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
        self.tableView?.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
    }
}
