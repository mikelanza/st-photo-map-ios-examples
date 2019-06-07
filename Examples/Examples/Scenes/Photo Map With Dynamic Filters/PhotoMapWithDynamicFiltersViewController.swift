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
    
    func setupFilters() {
        self.filters = [
            Filter(type: .userId, key: .userId, placeholder: "user id"),
            Filter(type: .collectionId, key: .collectionId, placeholder: "collection id")
        ]
    }
}

// MARK: - STPhotoMapView datasource

extension PhotoMapWithDynamicFiltersViewController: STPhotoMapViewDataSource {
    func photoMapView(_ view: STPhotoMapView?, photoTileOverlayModelForUrl url: String, parameters: [KeyValue]?) -> STPhotoTileOverlay.Model {
        return STPhotoTileOverlay.Model(url: url, parameters: parameters)
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
        self.photoMapView?.reloadTiles()
        self.photoMapView?.reloadCarouselOverlays()
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
        self.setupPhotoMapView()
        self.setupNavigationBar()
        self.setupFiltersButton()
    }
    
    private func setupPhotoMapView() {
        let photoMapView = STPhotoMapView(dataSource: self)
        photoMapView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(photoMapView)
        self.photoMapView = photoMapView
    }
    
    private func setupNavigationBar() {
        self.navigationController?.navigationBar.isTranslucent = false
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
        self.photoMapView?.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        self.photoMapView?.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        self.photoMapView?.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.photoMapView?.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
    }
}
