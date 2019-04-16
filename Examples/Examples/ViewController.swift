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
    
    var photoMapView: STPhotoMapView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupSubviews()
        self.setupSubviewsConstraints()
    }
}

// MARK: - STPhotoMapView datasource

extension ViewController: STPhotoMapViewDataSource {
    func photoMapView(_ view: STPhotoMapView?, photoTileOverlayModelForUrl url: String, parameters: [KeyValue]?) -> STPhotoTileOverlay.Model {
        return STPhotoTileOverlay.Model(url: url, parameters: parameters)
    }
}

// MARK: - Subviews configuration

extension ViewController {
    private func setupSubviews() {
        self.setupPhotoMapView()
    }
    
    private func setupPhotoMapView() {
        let photoMapView = STPhotoMapView(dataSource: self)
        photoMapView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(photoMapView)
        self.photoMapView = photoMapView
    }
}

// MARK: - Constraints configuration

extension ViewController {
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


