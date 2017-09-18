//
//  MWBalloonViewContainer.swift
//  MWBalloonTextField
//
//  Created by Gene M. Angelo  Jr. on 1/19/17.
//  Copyright © 2017 Mohojo Werks LLC. All rights reserved.
//

import UIKit

public class MWBalloonViewContainer: UIView {
 fileprivate var _textFieldProfile:MWBalloonImagesProtocol = MWDefaultBalloonTextFieldErrorProfile()
   fileprivate var _balloonProfile:MWBalloonProfileProtocol = MWDefaultBalloonErrorProfile()
   fileprivate var _imageView:UIView?
   
   override init(frame: CGRect) {
      super.init(frame: frame)
   }
   
   required public init(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)!
   }
   
   // Attaches a profile to this text field.
   open func attach(balloonProfile:MWBalloonProfileProtocol) {
      self._balloonProfile = balloonProfile
   }

   public func setWaiting() {
      self.clear()
      let imageView = self._textFieldProfile.waitingImageView
      self.setImage(imageView: imageView)
      imageView.startAnimating()
   }
   
   public func setSuccess() {
      self.clear()
      self.setImage(image: self._textFieldProfile.successImage)
   }
   
   public func setError(error:String) {
      self.clear()
      
      self.setImage(image: self._textFieldProfile.errorImage)
      
      // Create the error balloon for displaying errors.
      let errorBalloon = MWBalloon(frame: self.frame, profile: self._balloonProfile)
      errorBalloon.setFrame(balloonTextField: self)
      
      if let imageContainer = self._imageView {
         if let image = imageContainer.subviews.first {
            
            let imageViewPos = CGFloat((image.frame.width / 2) / 2)
            let imageViewContainerPos = CGFloat(imageContainer.frame.width / 2)
            
            errorBalloon.arrowPosition = self.frame.width - (imageViewPos + imageViewContainerPos)
         }
      }
      
      // This sets the color behind the balloon, so that the actual balloon can be seen propoerly against the control background.
      errorBalloon.backgroundColor = UIColor.clear
      
      // Add the error balloon to the superview.
      self.superview?.addSubview(errorBalloon)
      
      // Create the error label that is used to display the error message inside
      // the balloon.
      var labelFrame = self.frame.offsetBy(dx: 0, dy: self.frame.height)
      labelFrame.origin.y = labelFrame.origin.y + errorBalloon.arrowSize.height
      
      let errorLabel = MWBalloonLabel(frame: labelFrame, textColor: errorBalloon.textColor, fontSize: errorBalloon.fontSize)
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
      
      //self.rightView = self._imageView
      //self.rightViewMode = .always
   }
   
   func setErrorLabelConstraints(errorLabel:MWBalloonLabel, errorBalloon:MWBalloon) {
      // Leading...
      let leading = NSLayoutConstraint(item: errorLabel, attribute: .leftMargin, relatedBy: .equal, toItem: errorBalloon, attribute: .leftMargin, multiplier: 1, constant: errorBalloon.layoutMargins.left)
      
      // Trailing...
      let trailing = NSLayoutConstraint(item: errorLabel, attribute: .rightMargin, relatedBy: .equal, toItem: errorBalloon, attribute: .rightMargin, multiplier: 1, constant: 0)
      
      // Top...
      let top = NSLayoutConstraint(item: errorLabel, attribute: .topMargin, relatedBy: .equal, toItem: errorBalloon, attribute: .topMargin, multiplier: 1, constant: errorBalloon.layoutMargins.top + self._balloonProfile.arrowSize.height)
      
      errorLabel.translatesAutoresizingMaskIntoConstraints = false
      NSLayoutConstraint.activate([leading, trailing, top])
   }
   
   public func clear() {
      // Remove any previous error balloons that have been displayed.
      if let balloon = self.superview?.subviews.filter({ $0 is MWBalloon }) {
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
