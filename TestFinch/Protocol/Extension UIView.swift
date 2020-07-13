//
//  Extension UIView.swift
//  TestFinch
//
//  Created by Александр  Бровков  on 11.07.2020.
//  Copyright © 2020 Александр  Бровков . All rights reserved.
//

import UIKit

extension UIView {
    
    func systemBackground(defaultColor: UIColor? = nil) {
        if #available(iOS 13.0, *) {
            self.backgroundColor = .systemBackground
        } else {
            self.backgroundColor = defaultColor ?? .white
        }
    }
}
