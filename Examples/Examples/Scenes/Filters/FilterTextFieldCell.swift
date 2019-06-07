//
//  FilterTextFieldCell.swift
//  Examples
//
//  Created by Dimitri Strauneanu on 07/06/2019.
//  Copyright © 2019 Streetography. All rights reserved.
//

import UIKit

class FilterTextFieldCell: UITableViewCell {
    var title: String? {
        didSet {
            self.titleLabel?.text = self.title
        }
    }
    
    var textFieldText: String? {
        didSet {
            self.textField?.text = self.textFieldText
        }
    }
    
    var textFieldPlaceholder: String? {
        didSet {
            self.textField?.placeholder = self.textFieldPlaceholder
        }
    }
    
    var filter: Filter?
    
    private weak var titleLabel: UILabel!
    private weak var textField: UITextField!
    private weak var bottomSeparatorView: UIView!
    
    // MARK: - Object life cycle
    
    convenience init() {
        self.init(style: .default, reuseIdentifier: "FilterTextFieldCell")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupCell()
        self.setupSubviews()
        self.setupSubviewsConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Textfield editing changed
    
    @objc func textFieldEditingChanged(textField: UITextField) {
        self.filter?.value = textField.text
    }
    
    // MARK: - Subviews configuration
    
    private func setupCell() {
        self.selectionStyle = .none
        self.backgroundColor = UIColor.white
    }
    
    private func setupSubviews() {
        self.setupTitleLabel()
        self.setupTextField()
        self.setupBottomSeparatorView()
    }
    
    private func setupTitleLabel() {
        let label = UILabel()
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = self.title
        self.contentView.addSubview(label)
        self.titleLabel = label
    }
    
    func setupTextField() {
        let textField = UITextField()
        textField.clearButtonMode = .whileEditing
        textField.borderStyle = .none
        textField.delegate = self
        textField.setContentHuggingPriority(UILayoutPriority.defaultLow, for: NSLayoutConstraint.Axis.horizontal)
        textField.setContentCompressionResistancePriority(UILayoutPriority.required, for: NSLayoutConstraint.Axis.horizontal)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.addTarget(self, action: #selector(FilterTextFieldCell.textFieldEditingChanged(textField:)), for: UIControl.Event.editingChanged)
        textField.textColor = UIColor.darkGray
        textField.placeholder = self.textFieldPlaceholder
        textField.clearButtonMode = .always
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        self.contentView.addSubview(textField)
        self.textField = textField
    }
    
    private func setupBottomSeparatorView() {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 179/255, green: 187/255, blue: 206/255, alpha: 0.5)
        self.contentView.addSubview(view)
        self.bottomSeparatorView = view
    }
    
    // MARK: - Constraints configuration
    
    private func setupSubviewsConstraints() {
        self.setupTitleLabelConstraints()
        self.setupTextFieldConstraints()
        self.setupBottomSeparatorViewConstraints()
    }
    
    private func setupTitleLabelConstraints() {
        self.titleLabel?.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 14).isActive = true
        self.titleLabel?.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 14).isActive = true
        self.titleLabel?.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -14).isActive = true
    }
    
    private func setupTextFieldConstraints() {
        self.textField?.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 180).isActive = true
        self.textField?.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -14).isActive = true
        self.textField?.topAnchor.constraint(equalTo: self.contentView.topAnchor).isActive = true
        self.textField?.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor).isActive = true
    }
    
    private func setupBottomSeparatorViewConstraints() {
        self.bottomSeparatorView?.heightAnchor.constraint(equalToConstant: 1 / UIScreen.main.scale).isActive = true
        self.bottomSeparatorView?.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor).isActive = true
        self.bottomSeparatorView?.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor).isActive = true
        self.bottomSeparatorView?.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor).isActive = true
    }
}

extension FilterTextFieldCell: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true
    }
}
