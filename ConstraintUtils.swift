//
//  ConstraintUtils.swift
//
//  Created by Justin Allen on 8/15/19.
//  Copyright © 2019 Justin Allen. All rights reserved.
//

import UIKit

class Utils {
    public struct Contraints {
        var topAnchor : NSLayoutConstraint? = nil
        var leadingAnchor : NSLayoutConstraint? = nil
        var trailingAnchor : NSLayoutConstraint? = nil
        var bottomAnchor : NSLayoutConstraint? = nil
        //        var heightAnchor : NSLayoutConstraint? = nil
        //        var widthAnchor : NSLayoutConstraint? = nil
    }
    
    // TODO: height and wwidth optional constraints
    
    public static func SetupContrains(
        child : UIView, parent: UILayoutGuide,
        top: Bool = true, topConstant: CGFloat? = nil, topTarget: NSLayoutAnchor<NSLayoutYAxisAnchor>? = nil,
        leading:Bool = true, leadingConstant: CGFloat? = nil, leadingTarget: NSLayoutAnchor<NSLayoutXAxisAnchor>? = nil,
        trailing:Bool = true, trailingConstant: CGFloat? = nil, trailingTarget: NSLayoutAnchor<NSLayoutXAxisAnchor>? = nil,
        bottom:Bool = true, bottomConstant: CGFloat? = nil, bottomTarget: NSLayoutAnchor<NSLayoutYAxisAnchor>? = nil
    ) -> Contraints {
        child.translatesAutoresizingMaskIntoConstraints = false
        var constraints : Contraints = Contraints()
        
        if top {
            let target = topTarget ?? parent.topAnchor
            if let constant = topConstant {
                constraints.topAnchor = child.topAnchor.constraint(equalTo: target, constant: constant)
            } else {
                constraints.topAnchor = child.topAnchor.constraint(equalTo: target)
            }
            constraints.topAnchor?.isActive = true
        }
        
        if leading {
            let target = leadingTarget ?? parent.leadingAnchor
            if let constant = leadingConstant {
                constraints.leadingAnchor = child.leadingAnchor.constraint(equalTo: target, constant: constant)
            } else {
                constraints.leadingAnchor = child.leadingAnchor.constraint(equalTo: target)
            }
            constraints.leadingAnchor?.isActive = true
        }
        
        if trailing {
            let target = trailingTarget ?? parent.trailingAnchor
            if let constant = trailingConstant {
                constraints.trailingAnchor = child.trailingAnchor.constraint(equalTo: target, constant: constant)
            } else {
                constraints.trailingAnchor = child.trailingAnchor.constraint(equalTo: target)
            }
            constraints.trailingAnchor?.isActive = true
        }
        
        if bottom {
            let target = bottomTarget ?? parent.bottomAnchor
            if let constant = bottomConstant {
                constraints.bottomAnchor = child.bottomAnchor.constraint(equalTo: target, constant: constant)
            } else {
                constraints.bottomAnchor = child.bottomAnchor.constraint(equalTo: target)
            }
            constraints.bottomAnchor?.isActive = true
        }
        return constraints
    }
}
