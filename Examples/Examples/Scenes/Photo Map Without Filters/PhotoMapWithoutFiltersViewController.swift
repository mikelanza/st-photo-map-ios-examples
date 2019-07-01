//
//  PhotoMapWithoutFiltersViewController.swift
//  Examples
//
//  Created by Crasneanu Cristian on 16/04/2019.
//  Copyright © 2019 Streetography. All rights reserved.
//

import UIKit
import STPhotoMap

class PhotoMapWithoutFiltersViewController: UIViewController {
    private weak var photoMapView: STPhotoMapView?
    
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
    }
}

// MARK: - Subviews configuration

extension PhotoMapWithoutFiltersViewController {
    private func setupSubviews() {
        self.setupPhotoMapView()
        self.setupNavigationBar()
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
    }
}

// MARK: - Constraints configuration

extension PhotoMapWithoutFiltersViewController {
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



