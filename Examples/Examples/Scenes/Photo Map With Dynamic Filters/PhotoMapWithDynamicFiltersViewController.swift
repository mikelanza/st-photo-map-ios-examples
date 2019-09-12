//
//  PhotoMapWithDynamicFiltersViewController.swift
//  Examples
//
//  Created by Dimitri Strauneanu on 07/06/2019.
//  Copyright © 2019 Streetography. All rights reserved.
//

import UIKit
import STPhotoMap

class PhotoMapWithDynamicFiltersViewController: UIViewController {
    private weak var photoMapView: STPhotoMapView?
    var filters: [Filter] = []
    
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
        
        self.setupFilters()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func setupFilters() {
        self.filters = [
            Filter(type: .userId, key: .userId, placeholder: "user id"),
            Filter(type: .collectionId, key: .collectionId, placeholder: "collection id")
        ]
    }
}

// MARK: - Filters view controller delegate

extension PhotoMapWithDynamicFiltersViewController: FiltersViewControllerDelegate {
    func filterViewController(controller: FiltersViewController?, shouldUpdateFilters filters: [Filter]) {
        self.filters = filters
        self.filters.forEach { filter in
            if let value = filter.value {
                self.photoMapView?.updateParameter(parameter: (filter.key.rawValue, value))
            }
        }
        self.photoMapView?.setNeedsDisplayTiles()
        self.photoMapView?.reloadCarousel()
        self.photoMapView?.reloadLocationLevel()
    }
}

// MARK: - Actions

extension PhotoMapWithDynamicFiltersViewController {
    @objc func touchUpInsideFiltersButton() {
        let filtersViewController = FiltersViewController(filters: self.filters)
        filtersViewController.delegate = self
        self.present(UINavigationController(rootViewController: filtersViewController), animated: true)
    }
}

// MARK: - Subviews configuration

extension PhotoMapWithDynamicFiltersViewController {
    private func setupSubviews() {
        self.setupView()
        self.setupPhotoMapView()
        self.setupNavigationBar()
        self.setupFiltersButton()
    }
    
    private func setupView() {
        self.view.backgroundColor = UIColor(red: 53/255, green: 61/255, blue: 75/255, alpha: 1)
    }
    
    private func setupPhotoMapView() {
        let photoMapView = STPhotoMapView()
        photoMapView.resetParameters()
        photoMapView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(photoMapView)
        self.photoMapView = photoMapView
    }
    
    private func setupNavigationBar() {
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 53/255, green: 61/255, blue: 75/255, alpha: 1)
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
    
    private func setupFiltersButton() {
        let button = UIBarButtonItem(title: "Filters", style: .plain, target: self, action: #selector(PhotoMapWithDynamicFiltersViewController.touchUpInsideFiltersButton))
        self.navigationItem.setRightBarButton(button, animated: false)
    }
}

// MARK: - Constraints configuration

extension PhotoMapWithDynamicFiltersViewController {
    private func setupSubviewsConstraints() {
        self.setupPhotoMapViewConstraints()
    }
    
    private func setupPhotoMapViewConstraints() {
        self.photoMapView?.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        self.photoMapView?.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        self.photoMapView?.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        self.photoMapView?.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
    }
}
