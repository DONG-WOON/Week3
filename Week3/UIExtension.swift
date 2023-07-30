//
//  UIExtension.swift
//  Week3
//
//  Created by 서동운 on 7/29/23.
//

import UIKit

extension UIView {
    func rounded(cornerRadius: CGFloat, isShadowBackground: Bool = false) {
        self.layer.cornerRadius = cornerRadius
        if isShadowBackground {
            self.layer.shadowColor = UIColor.black.cgColor
            self.layer.shadowOffset = CGSize(width: 4, height: 4)
            self.layer.shadowRadius = 5
            self.layer.shadowOpacity = 0.5
        }
    }
}
