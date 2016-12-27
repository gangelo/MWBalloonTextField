//
//  MWBalloonTextField.swift
//
//  Created by Gene M. Angelo  Jr. on 9/11/16.
//  Copyright © 2016 Mohojo Werks LLC. All rights reserved.
//
import UIKit

@IBDesignable public class MWBalloonTextField: UITextField {
   fileprivate var _imageView:UIView?
   
   @IBInspectable var successImage:UIImage? = nil
   @IBInspectable var errorImage:UIImage? = nil
   
   override init(frame: CGRect) {
      super.init(frame: frame)
      self.initialize()
   }

   required public init(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)!
      self.initialize()
   }
   
   func initialize() {
      if successImage == nil {
         self.attachDefaultSuccessImage()
      }
      
      if errorImage == nil {
         self.attachDefaultErrorImage()
      }
   }
   
   fileprivate func getGetImageInBundle(named:String) -> UIImage? {
      let bundle = Bundle(for: type(of: self))
      return UIImage(named: named, in: bundle, compatibleWith: nil)
   }
   
   fileprivate func attachDefaultErrorImage() {
      self.errorImage = self.getGetImageInBundle(named: "error")
   }
   
   fileprivate func attachDefaultSuccessImage() {
      self.successImage = self.getGetImageInBundle(named: "success")
   }
   
   
   public func setWaiting() {
      self.clear()
      
      let imageView:UIImageView = UIImageView()
      imageView.animationImages = [
         self.getGetImageInBundle(named: "waiting_0")!,
         self.getGetImageInBundle(named: "waiting_1")!,
         self.getGetImageInBundle(named: "waiting_2")!,
         self.getGetImageInBundle(named: "waiting_3")!,
         self.getGetImageInBundle(named: "waiting_4")!,
         self.getGetImageInBundle(named: "waiting_5")!,
         self.getGetImageInBundle(named: "waiting_6")!,
         self.getGetImageInBundle(named: "waiting_7")!,
         self.getGetImageInBundle(named: "waiting_8")!,
         self.getGetImageInBundle(named: "waiting_9")!,
         self.getGetImageInBundle(named: "waiting_10")!,
         self.getGetImageInBundle(named: "waiting_11")!]
      imageView.animationDuration = 1.0;
      imageView.animationRepeatCount = 0;
      
      self.setImage(imageView: imageView)
      
      imageView.startAnimating()
   }
   
   public func setSuccess() {
      self.clear()
      self.setImage(image: successImage)
   }
   
   public func setError(error:String) {
      self.clear()
      
      self.setImage(image: errorImage)
      
      // Create the error balloon for displaying errors.
      let errorBalloon = UIErrorBalloon(frame: self.frame)
      errorBalloon.setFrame(balloonTextField: self)
      errorBalloon.balloonArrowPosition = getBalloonArrowPosition()
      
      if let imageContainer = self._imageView {
         if let image = imageContainer.subviews.first {
            
            let imageViewPos = CGFloat((image.frame.width / 2) / 2)
            let imageViewContainerPos = CGFloat(imageContainer.frame.width / 2)
            
            errorBalloon.balloonArrowPosition = self.frame.width - (imageViewPos + imageViewContainerPos)
         }
      }
      
      // This sets the color behind the balloon, so that the actuall balloon can be seen propoerly against the control background. 
      // errorBalloon.backgroundColor = self.superview?.backgroundColor
      errorBalloon.backgroundColor = UIColor.clear
      
      // Add the error balloon to the superview.
      self.superview?.addSubview(errorBalloon)
      
      // Create the error label that is used to display the error message inside
      // the balloon.
      var labelFrame = self.frame.offsetBy(dx: 0, dy: self.frame.height)
      labelFrame.origin.y = labelFrame.origin.y + errorBalloon.balloonArrowSize.height

      let errorLabel = MWBalloonLabel(frame: labelFrame, textColor: errorBalloon.balloonTextColor, fontSize: errorBalloon.balloonFontSize)
      errorBalloon.addSubview(errorLabel)
      setErrorLabelConstraints(errorLabel: errorLabel, errorBalloon: errorBalloon)
      
      // Set text after adding it to the balloon so that the balloon resizes properly
      errorLabel.text = error
   }
   
   fileprivate func setImage(image:UIImage?) {
      if (image == nil) {
         return
      }
      
      let imageView = UIImageView(image: image)
      self.setImage(imageView: imageView)
   }
   
   fileprivate func setImage(imageView:UIImageView) {
      imageView.frame = CGRect(x: 0, y: 0, width: 12, height: 12)
      attachTapGesture(imageView: imageView)
      self._imageView = UIView()
      self._imageView?.addSubview(imageView)
      self._imageView?.frame = CGRect(x: 0, y: 0, width: 18, height: 12)
      
      self.rightView = self._imageView
      self.rightViewMode = .always
   }
   
   func setErrorLabelConstraints(errorLabel:MWBalloonLabel, errorBalloon:UIErrorBalloon) {
      // Leading...
      let leading = NSLayoutConstraint(item: errorLabel, attribute: .leftMargin, relatedBy: .equal, toItem: errorBalloon, attribute: .leftMargin, multiplier: 1, constant: errorBalloon.layoutMargins.left)
      
      // Trailing...
      let trailing = NSLayoutConstraint(item: errorLabel, attribute: .rightMargin, relatedBy: .equal, toItem: errorBalloon, attribute: .rightMargin, multiplier: 1, constant: errorBalloon.layoutMargins.right)
      
      // Top...
      let top = NSLayoutConstraint(item: errorLabel, attribute: .topMargin, relatedBy: .equal, toItem: errorBalloon, attribute: .topMargin, multiplier: 1, constant: errorBalloon.layoutMargins.top + errorBalloon.balloonArrowSize.height)
      
      errorLabel.translatesAutoresizingMaskIntoConstraints = false
      NSLayoutConstraint.activate([leading, trailing, top])
   }
   
   public func clear() {
      // Remove any previous error balloons that have been displayed.
      if let balloon = self.superview?.subviews.filter({ $0 is MWBalloonBase }) {
         balloon.first?.removeFromSuperview()
      }
      
      // Remove the image attached to the textfield
      if let imageView = self._imageView {
         imageView.subviews.first?.removeFromSuperview()
      }
   }
   
   func attachTapGesture(imageView:UIImageView) {
      let tap = UITapGestureRecognizer(target: self, action: #selector(tap(_:)))
      tap.numberOfTapsRequired = 1
      imageView.isUserInteractionEnabled = true
      imageView.addGestureRecognizer(tap)
   }
   
   func tap(_ gestureRecognizer: UITapGestureRecognizer) {
      self.clear()
   }
   
   override public func draw(_ rect: CGRect) {
      super.draw(rect)
   }
   
   // Returns the value of where the balloon's arrow should be positioned.
   fileprivate func getBalloonArrowPosition() -> CGFloat {
      if let imageContainer = self._imageView {
         if let image = imageContainer.subviews.first {
            
            let imageViewPos = CGFloat((image.frame.width / 2) / 2)
            let imageViewContainerPos = CGFloat(imageContainer.frame.width / 2)
            
            return self.frame.width - (imageViewPos + imageViewContainerPos)
         }
      }
      
      // Default is center
      return self.frame.width / 2
   }
}


