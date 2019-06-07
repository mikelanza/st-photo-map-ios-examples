//
//  PhotoMapWithUserFilterViewController.swift
//  Examples
//
//  Created by Crasneanu Cristian on 16/04/2019.
//  Copyright © 2019 Streetography. All rights reserved.
//

import UIKit
import STPhotoMap

class PhotoMapWithUserFilterViewController: UIViewController {
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

// MARK: - STPhotoMapView datasource

extension PhotoMapWithUserFilterViewController: STPhotoMapViewDataSource {
    func photoMapView(_ view: STPhotoMapView?, photoTileOverlayModelForUrl url: String, parameters: [KeyValue]?) -> STPhotoTileOverlay.Model {
        var newParameters = parameters
        newParameters?.append(("userId", "z5YglYLZ55"))
        return STPhotoTileOverlay.Model(url: url, parameters: newParameters)
    }
}

// MARK: - Subviews configuration

extension PhotoMapWithUserFilterViewController {
    private func setupSubviews() {
        self.setupPhotoMapView()
        self.setupNavigationBar()
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
}

// MARK: - Constraints configuration

extension PhotoMapWithUserFilterViewController {
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




