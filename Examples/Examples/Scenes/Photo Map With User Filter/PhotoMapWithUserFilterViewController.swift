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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

// MARK: - Subviews configuration

extension PhotoMapWithUserFilterViewController {
    private func setupSubviews() {
        self.setupView()
        self.setupPhotoMapView()
        self.setupNavigationBar()
    }
    
    private func setupView() {
        self.view.backgroundColor = UIColor(red: 53/255, green: 61/255, blue: 75/255, alpha: 1)
    }
    
    private func setupPhotoMapView() {
        let photoMapView = STPhotoMapView()
        photoMapView.translatesAutoresizingMaskIntoConstraints = false
        photoMapView.resetParameters()
        photoMapView.updateParameter(parameter: ("userId", "TXwEoa15xF"))
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
}

// MARK: - Constraints configuration

extension PhotoMapWithUserFilterViewController {
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




