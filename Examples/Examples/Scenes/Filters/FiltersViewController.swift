//
//  FiltersViewController.swift
//  Examples
//
//  Created by Dimitri Strauneanu on 07/06/2019.
//  Copyright © 2019 Streetography. All rights reserved.
//

import UIKit

protocol FiltersViewControllerDelegate: NSObjectProtocol {
    func filterViewController(controller: FiltersViewController?, shouldUpdateFilters filters: [Filter])
}

class FiltersViewController: UIViewController {
    private weak var tableView: UITableView?
    private var filters: [Filter] = []
    
    weak var delegate: FiltersViewControllerDelegate?
    
    init(filters: [Filter]) {
        super.init(nibName: nil, bundle: nil)
        self.filters = filters.map({ $0.clone() })
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupSubviews()
        self.setupSubviewsConstraints()
    }
}

// MARK: - Table view data source

extension FiltersViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.filters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let filter = self.filters[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "FilterTextFieldCell", for: indexPath) as? FilterTextFieldCell ?? FilterTextFieldCell()
        cell.filter = filter
        cell.title = filter.type.rawValue
        cell.textFieldText = filter.value
        cell.textFieldPlaceholder = filter.placeholder
        return cell
    }
}

// MARK: - Actions

extension FiltersViewController {
    @objc func touchUpInsideCancelButton() {
        self.dismiss(animated: true)
    }
    
    @objc func touchUpInsideDoneButton() {
        self.delegate?.filterViewController(controller: self, shouldUpdateFilters: self.filters)
        self.dismiss(animated: true)
    }
}

// MARK: - Subviews configuration

extension FiltersViewController {
    private func setupSubviews() {
        self.setupTableView()
        self.setupCancelButton()
        self.setupDoneButton()
    }
    
    private func setupTableView() {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(FilterTextFieldCell.self, forCellReuseIdentifier: "FilterTextFieldCell")
        tableView.dataSource = self
        tableView.allowsSelection = false
        self.view.addSubview(tableView)
        self.tableView = tableView
    }
    
    private func setupCancelButton() {
        let button = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(FiltersViewController.touchUpInsideCancelButton))
        self.navigationItem.setLeftBarButton(button, animated: false)
    }
    
    private func setupDoneButton() {
        let button = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(FiltersViewController.touchUpInsideDoneButton))
        self.navigationItem.setRightBarButton(button, animated: false)
    }
}

// MARK: - Constraints configuration

extension FiltersViewController {
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
