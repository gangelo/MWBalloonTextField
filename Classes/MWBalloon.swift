//
//  MWBalloon.swift
//  Accumoo
//
//  Created by Gene M. Angelo  Jr. on 12/10/16.
//  Copyright © 2016 Mohojo Werks LLC. All rights reserved.
//

import UIKit
import Foundation

class MWBalloon: UIView, MWBalloonProfileProtocol {
   fileprivate var _profile:MWBalloonProfileProtocol
   
   init(frame: CGRect, profile:MWBalloonProfileProtocol) {
      self._profile = profile
      super.init(frame: frame)
      self.backgroundColor = self._profile.backgroundColor
   }
   
   override init(frame: CGRect) {
      self._profile = MWDefaultBalloonProfile()
      super.init(frame: frame)
      self.backgroundColor = self._profile.backgroundColor
   }
   
   required init?(coder aDecoder: NSCoder) {
      self._profile = MWDefaultBalloonProfile()
      super.init(coder: aDecoder)
      self.backgroundColor = self._profile.backgroundColor
   }
   
   func setProfile(profile:MWBalloonProfileProtocol) {
      self._profile = profile
   }
   
   // GMA func setFrame(balloonTextField:MWBalloonTextField) {
   func setFrame(balloonTextField:UIView) {
      let arrowSize = self._profile.arrowSize
      
      let newFrame = CGRect(x: balloonTextField.frame.origin.x, y: balloonTextField.frame.origin.y + balloonTextField.frame.height + 1, width: balloonTextField.frame.width, height: balloonTextField.frame.height + arrowSize.height)
      self.frame = newFrame
   }
   
   // This function amends the working rect to exclude the portion of the
   // normal rect needed to display the balloon arrow. We need to know this 
   // so that we know how to center our message text vertically inside the balloon.
   fileprivate func getAdjustedBorderRect(rect: CGRect) -> CGRect {
      var adjustedRect = CGRect(origin: CGPoint(x: rect.origin.x, y: rect.origin.y), size: CGSize(width: rect.width, height: rect.height))
      
      let borderWidth = self._profile.borderWidth
      let arrowSize = self._profile.arrowSize
      
      adjustedRect.origin.x = borderWidth
      adjustedRect.origin.y = borderWidth + arrowSize.height
      adjustedRect.size.width = (frame.size.width - (borderWidth * 2))
      adjustedRect.size.height = (frame.size.height - (borderWidth * 2)) - arrowSize.height
      
      return adjustedRect
   }
   
   override func draw(_ rect: CGRect) {
      let adjustedRect = getAdjustedBorderRect(rect: rect)
      
      print(rect)
      print(adjustedRect)
      
      // Box
      self._profile.borderColor.setStroke()
      self._profile.balloonBackgroundColor.setFill()
      
      let cornerRadius = self._profile.cornerRadius
      let borderWidth = self._profile.borderWidth
      
      let path = UIBezierPath(roundedRect: adjustedRect, byRoundingCorners: .allCorners, cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
      path.lineWidth = borderWidth
      path.fill()
      path.stroke()
      
      // Arrow
      self.drawArrow(adjustedRect: adjustedRect)
   }
   
   fileprivate func drawArrow(adjustedRect:CGRect) {
      self._profile.borderColor.setStroke()
      self._profile.balloonBackgroundColor.setFill()
      
      let x = self._profile.arrowPosition
      //let x = self.frame.width / 2
      let arrowSize = self._profile.arrowSize
      
      let path = UIBezierPath()
      path.move(to: CGPoint(x: x - (arrowSize.width / 2), y: adjustedRect.origin.y))
      path.addLine(to: CGPoint(x: x, y: adjustedRect.origin.y - arrowSize.height))
      path.addLine(to: CGPoint(x: x + (arrowSize.width / 2), y: adjustedRect.origin.y))
      
      path.close()
      path.lineWidth = self._profile.borderWidth
      path.stroke()
      path.fill()
      
   }
   
   func resizeToFitSubviews() {
      let balloonLabel = self.subviews.first as! MWBalloonLabel
      let balloonLabelHeight: CGFloat = balloonLabel.frame.height
      
      let newBalloonHeight = balloonLabelHeight + (self._profile.arrowSize.height + self.layoutMargins.top + self.layoutMargins.bottom)
      
      self.frame = CGRect(x: self.frame.origin.x, y: self.frame.origin.y, width: self.frame.width, height: newBalloonHeight)
      
      repositionBalloonLabel(balloonLabel: balloonLabel)
      
      self.setNeedsDisplay()
   }
   
   fileprivate func repositionBalloonLabel(balloonLabel: MWBalloonLabel) {
      let newCenterY = self.frame.height / 2 - (balloonLabel.frame.height / 2)
      balloonLabel.frame.origin.y = newCenterY
   }
   
   var textColor:UIColor {
      get {
         return self._profile.textColor
      }
      set {
         self._profile.textColor = newValue
      }
   }
   
   var fontSize:CGFloat {
      get {
         return self._profile.fontSize
      }
      set {
         self._profile.fontSize = newValue
      }
   }
   
   override var backgroundColor: UIColor? {
      get {
         return self._profile.backgroundColor
      }
      set {
         self._profile.backgroundColor = newValue
         super.backgroundColor = newValue
      }
   }
   
   var balloonBackgroundColor: UIColor {
      get {
         return self._profile.balloonBackgroundColor
      }
      set {
         self._profile.balloonBackgroundColor = newValue
      }
   }
   
   var cornerRadius:Int {
      get {
         return self._profile.cornerRadius
      }
      set {
         self._profile.cornerRadius = newValue
      }
   }
   
   var borderWidth:CGFloat {
      get {
         return self._profile.borderWidth
      }
      set {
         self._profile.borderWidth = newValue
      }
   }
   
   var borderColor:UIColor {
      get {
         return self._profile.borderColor
      }
      set {
         self._profile.borderColor = newValue
      }
   }
   
   var arrowSize:CGSize {
      get {
         return self._profile.arrowSize
      }
      set {
         self._profile.arrowSize = newValue
      }
   }
   
   var arrowPosition:CGFloat {
      get {
         return self._profile.arrowPosition
      }
      set {
         self._profile.arrowPosition = newValue
      }
   }
}

