//
//  Animation.swift
//  FaceMagic
//
//  Created by QiFeng on 9/1/15.
//  Copyright (c) 2015 ArthurJiang. All rights reserved.
//

import Foundation

class Animation {
    
    class func showLable(theme : Theme, parentView : UIViewController, center : CGPoint) {
        let lable = UILabel(frame: CGRectMake(0, 0, 200, 50))
        lable.center = center
        lable.text = theme.simpleDesp()
        lable.textColor = UIColor.whiteColor()
        lable.textAlignment = NSTextAlignment.Center
        lable.alpha = 0
        parentView.view.addSubview(lable)
        
        UIView.animateWithDuration(1.25, animations: { () -> Void in
            let transform = CGAffineTransformMakeScale(1.2, 1.2)
            lable.layer.setAffineTransform(transform)
            lable.alpha = 1
            }, completion: {(value: Bool) -> Void in
                UIView.animateWithDuration(1.2, animations: {
                    lable.alpha = 0
                    }, completion: {(value: Bool) -> Void in
                        lable.removeFromSuperview()
                })
        })
        
    }
    
    class func shakeImage(image: UIImageView) {
        let animation: CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        animation.duration = 0.3
        animation.fromValue = -M_1_PI / 2
        animation.toValue = M_1_PI / 2
        animation.repeatCount = 1
        animation.autoreverses = true
        image.layer.anchorPoint = CGPointMake(0.5, 0.5)
        image.layer.addAnimation(animation, forKey: "rotation")
    }
    
    class func translateEyes(image: UIImageView, length: CGFloat) {
        let animation: CABasicAnimation = CABasicAnimation(keyPath: "transform.translation.y")
        animation.duration = 0.3
        animation.fromValue = 0
        animation.toValue = length
        animation.autoreverses = true
        image.layer.anchorPoint = CGPointMake(0.5, 0.5)
        image.layer.addAnimation(animation, forKey: "translation")
    }
    
    class func graduallyBlush(blush : UIImageView) {
        UIView.animateWithDuration(1.25, animations: { () -> Void in
            blush.alpha = 1
            }, completion: {(value: Bool) -> Void in
                UIView.animateWithDuration(1.2, animations: {
                    blush.alpha = 0.4
                    }, completion: {(value: Bool) -> Void in
                })
        })
    }

    //filter lable animation with CAlayer , do not stuck main thread
    // Usage example: Animation.scale(lable, time: 1, from: 2.0, to: 1.5)
    //                Animation.vanish(lable, time: 1.15)
    class func scale(target: UIView, time: CFTimeInterval, from: CGFloat, to: CGFloat) {
        let animation: CABasicAnimation = CABasicAnimation(keyPath: "transform.scale")
        animation.duration  = CFTimeInterval(time)
        animation.fromValue = from
        animation.toValue   = to
        animation.autoreverses = false
        target.layer.anchorPoint = CGPointMake(0.5, 0.5)
        target.layer.addAnimation(animation, forKey: "scale")
    }
    
    class func vanish(target: UIView, time: CFTimeInterval) {
        let animation: CABasicAnimation = CABasicAnimation(keyPath: "opacity")
        animation.fromValue = 1.0
        animation.toValue = 0.0
        animation.duration = CFTimeInterval(time)
        target.layer.addAnimation(animation, forKey: "Image-opacity")
        target.alpha = 0
    }
}