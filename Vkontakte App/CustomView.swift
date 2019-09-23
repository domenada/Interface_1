//
//  CustomView.swift
//  Vkontakte App
//
//  Created by Dmitry Andreyanov on 8/9/19.
//  Copyright © 2019 Dmitrii Andreianov. All rights reserved.
//

import UIKit

class CustomView: UIView {
    
    @IBOutlet var shadowView: UIView!
    @IBOutlet var avatarView: UIImageView!

    @IBInspectable var shadowRadius: CGFloat = 8 {
        didSet { setNeedsDisplay() }
    }
    @IBInspectable var shadowColor: UIColor = .black {
        didSet { setNeedsDisplay() }
    }
    @IBInspectable var shadowOpacity: Float = 0.5 {
        didSet { setNeedsDisplay() }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        shadowView.clipsToBounds = false
        shadowView.backgroundColor = .white
        shadowView.layer.shadowColor = shadowColor.cgColor
        shadowView.layer.shadowOpacity = shadowOpacity
        shadowView.layer.shadowOffset = .zero
        shadowView.layer.shadowRadius = shadowRadius
        
        avatarView.clipsToBounds = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        shadowView.layer.cornerRadius = bounds.width/2
        avatarView.layer.cornerRadius = bounds.width/2
    }
}

    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */


