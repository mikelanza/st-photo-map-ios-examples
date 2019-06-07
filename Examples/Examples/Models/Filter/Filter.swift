//
//  Filter.swift
//  Examples
//
//  Created by Dimitri Strauneanu on 07/06/2019.
//  Copyright © 2019 Streetography. All rights reserved.
//

import Foundation

class Filter {
    var type: FilterType
    var key: FilterKey
    var value: String?
    var placeholder: String?
    
    init(type: FilterType, key: FilterKey, value: String? = nil, placeholder: String? = nil) {
        self.type = type
        self.key = key
        self.value = value
        self.placeholder = placeholder
    }
}

extension Filter {
    func clone() -> Filter {
        return Filter(type: self.type, key: self.key, value: self.value, placeholder: self.placeholder)
    }
}
