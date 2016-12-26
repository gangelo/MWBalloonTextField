//
//  MWBalloonProfile.swift
//  MWBalloonTextField
//
//  Created by Gene M. Angelo  Jr. on 12/21/16.
//  Copyright © 2016 Mohojo Werks LLC. All rights reserved.
//

import UIKit
import Foundation

class MWBalloonProfile: MWBalloonProtocol {
   fileprivate var _balloonTextColor:UIColor
   fileprivate var _balloonFontSize:CGFloat
   fileprivate var _balloonBackgroundColor:UIColor
   fileprivate var _balloonCornerRadius:Int
   fileprivate var _balloonBorderWidth:CGFloat
   fileprivate var _balloonBorderColor:UIColor
   fileprivate var _balloonArrowSize:CGSize
   fileprivate var _balloonArrowPosition:CGFloat
   
   convenience init() {
      self.init(balloonTextColor: UIColor.black, balloonFontSize: 10.0, balloonBackgroundColor: UIColor.clear, balloonCornerRadius: 5, balloonBorderWidth: 0.5, balloonBorderColor: UIColor.black, balloonArrowSize:CGSize(width: 8, height: 8), balloonArrowPosition: 0)
   }
   
   init(balloonTextColor:UIColor, balloonFontSize:CGFloat, balloonBackgroundColor:UIColor, balloonCornerRadius:Int, balloonBorderWidth:CGFloat, balloonBorderColor:UIColor, balloonArrowSize:CGSize, balloonArrowPosition:CGFloat) {
      
      self._balloonTextColor = balloonTextColor
      self._balloonFontSize = balloonFontSize
      self._balloonBackgroundColor = balloonBackgroundColor
      self._balloonCornerRadius = balloonCornerRadius
      self._balloonBorderWidth = balloonBorderWidth
      self._balloonBorderColor = balloonBorderColor
      self._balloonArrowSize = balloonArrowSize
      self._balloonArrowPosition = balloonArrowPosition
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
}
