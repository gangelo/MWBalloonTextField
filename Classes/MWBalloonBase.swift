//
//  MWBalloonBase.swift
//  Accumoo
//
//  Created by Gene M. Angelo  Jr. on 12/10/16.
//  Copyright © 2016 Mohojo Werks LLC. All rights reserved.
//

import UIKit
import Foundation

class MWBalloonBase: UIView, MWBalloonProtocol {
   fileprivate var _balloonTextColor:UIColor = UIColor.black
   fileprivate var _balloonFontSize:CGFloat = 10.0
   fileprivate var _balloonBackgroundColor:UIColor = UIColor.clear
   fileprivate var _balloonCornerRadius:Int = 0
   fileprivate var _balloonBorderWidth:CGFloat = 1
   fileprivate var _balloonBorderColor:UIColor = UIColor.black
   fileprivate var _balloonArrowSize:CGSize = CGSize(width: 0, height: 0)
   fileprivate var _balloonArrowPosition:CGFloat = 0
   
   override init(frame: CGRect) {
      super.init(frame: frame)
      self.initialize()
   }
   
   required init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
      self.initialize()
   }
   
   func setFrame(balloonTextField:MWBalloonTextField) {
      let newFrame = CGRect(x: balloonTextField.frame.origin.x, y: balloonTextField.frame.origin.y + balloonTextField.frame.height + 1, width: balloonTextField.frame.width, height: balloonTextField.frame.height + self.balloonArrowSize.height)
      self.frame = newFrame
   }
   
   internal func initialize() {
   }
   
   // MARK: - BalloonProtocol - start
   
   var balloonTextColor:UIColor {
      get {
         return self._balloonTextColor
      }
      set {
         self._balloonTextColor = newValue
      }
   }
   
   var balloonFontSize: CGFloat {
      get {
         return self._balloonFontSize
      }
      set {
         self._balloonFontSize = newValue
      }
   }
   
   var balloonBackgroundColor:UIColor {
      get {
         return self._balloonBackgroundColor
      }
      set {
         self._balloonBackgroundColor = newValue
      }
   }
   
   var balloonCornerRadius:Int {
      get {
         return self._balloonCornerRadius
      }
      set {
         self._balloonCornerRadius = newValue
      }
   }
   
   var balloonBorderWidth:CGFloat {
      get {
         return self._balloonBorderWidth
      }
      set {
         self._balloonBorderWidth = newValue
      }
   }
   
   var balloonBorderColor:UIColor {
      get {
         return self._balloonBorderColor
      }
      set {
         self._balloonBorderColor = newValue
      }
   }
   
   var balloonArrowSize:CGSize {
      get {
         return self._balloonArrowSize
      }
      set {
         self._balloonArrowSize = newValue
      }
   }
   
   var balloonArrowPosition:CGFloat {
      get {
         return self._balloonArrowPosition
      }
      set {
         self._balloonArrowPosition = newValue
      }
   }
   
   // BalloonProtocol - end
   
   // This function amends the working rect to exclude the portion of the
   // normal rect needed to display the balloon arrow. We need to know this 
   // so that we know how to center our message text vertically inside the balloon.
   fileprivate func getAdjustedBorderRect(rect: CGRect) -> CGRect {
      var adjustedRect = CGRect(origin: CGPoint(x: rect.origin.x, y: rect.origin.y), size: CGSize(width: rect.width, height: rect.height))
      
      adjustedRect.origin.x = self._balloonBorderWidth
      adjustedRect.origin.y = self._balloonBorderWidth + self._balloonArrowSize.height
      adjustedRect.size.width = (frame.size.width - (self._balloonBorderWidth * 2))
      adjustedRect.size.height = (frame.size.height - (self._balloonBorderWidth * 2)) - self._balloonArrowSize.height
      
      return adjustedRect
   }
   
   override func draw(_ rect: CGRect) {
      let adjustedRect = getAdjustedBorderRect(rect: rect)
      
      print(rect)
      print(adjustedRect)
      
      // Box
      self.balloonBorderColor.setStroke()
      self.balloonBackgroundColor.setFill()
      
      let path = UIBezierPath(roundedRect: adjustedRect, byRoundingCorners: .allCorners, cornerRadii: CGSize(width: self.balloonCornerRadius, height: self.balloonCornerRadius))
      path.lineWidth = self.balloonBorderWidth
      path.fill()
      path.stroke()
      
      // Arrow
      self.drawArrow(adjustedRect: adjustedRect)
   }
   
   fileprivate func drawArrow(adjustedRect:CGRect) {
      self.balloonBorderColor.setStroke()
      self.balloonBackgroundColor.setFill()
      
      let x = self.balloonArrowPosition
      
      let path = UIBezierPath()
      path.move(to: CGPoint(x: x - (self.balloonArrowSize.width / 2), y: adjustedRect.origin.y))
      path.addLine(to: CGPoint(x: x, y: adjustedRect.origin.y - self.balloonArrowSize.height))
      path.addLine(to: CGPoint(x: x + (self.balloonArrowSize.width / 2), y: adjustedRect.origin.y))
      
      path.close()
      path.lineWidth = self.balloonBorderWidth
      path.stroke()
      path.fill()
      
   }
   
   fileprivate func _drawArrow(adjustedRect:CGRect) {
      self.balloonBorderColor.setStroke()
      self.balloonBackgroundColor.setFill()
      
      let path = UIBezierPath()
      path.move(to: CGPoint(x: (adjustedRect.size.width / 2) - (self.balloonArrowSize.width / 2), y: adjustedRect.origin.y))
      path.addLine(to: CGPoint(x: (adjustedRect.size.width / 2), y: adjustedRect.origin.y - self.balloonArrowSize.height))
      path.addLine(to: CGPoint(x: (adjustedRect.size.width / 2) + (self.balloonArrowSize.width / 2), y: adjustedRect.origin.y))
      
      path.close()
      path.lineWidth = self.balloonBorderWidth
      path.stroke()
      path.fill()
  
   }
   
   func resizeToFitSubviews() {
      let balloonLabel = self.subviews.first as! MWBalloonLabel
      let balloonLabelHeight: CGFloat = balloonLabel.frame.height
      
      let newBalloonHeight = balloonLabelHeight + (self.balloonArrowSize.height + self.layoutMargins.top + self.layoutMargins.bottom)
      
      self.frame = CGRect(x: self.frame.origin.x, y: self.frame.origin.y, width: self.frame.width, height: newBalloonHeight)
      
      repositionBalloonLabel(balloonLabel: balloonLabel)
      
      self.setNeedsDisplay()
   }
   
   fileprivate func repositionBalloonLabel(balloonLabel: MWBalloonLabel) {
      let newCenterY = self.frame.height / 2 - (balloonLabel.frame.height / 2)
      balloonLabel.frame.origin.y = newCenterY
   }
}

