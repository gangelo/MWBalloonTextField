//
//  MWDefaultBalloonProfile.swift
//  MWBalloonTextField
//
//  Created by Gene M. Angelo  Jr. on 12/21/16.
//  Copyright © 2016 Mohojo Werks LLC. All rights reserved.
//

import UIKit
import Foundation

public class MWDefaultBalloonProfile: MWBalloonProfileProtocol {
   fileprivate var _textColor:UIColor
   fileprivate var _fontSize:CGFloat
   fileprivate var _backgroundColor:UIColor?
   fileprivate var _balloonBackgroundColor:UIColor
   fileprivate var _cornerRadius:Int
   fileprivate var _borderWidth:CGFloat
   fileprivate var _borderColor:UIColor
   fileprivate var _arrowSize:CGSize
   fileprivate var _arrowPosition:CGFloat
   
   public convenience init() {
      self.init(textColor: UIColor.black, fontSize: 10.0, backgroundColor: UIColor.clear, balloonBackgroundColor:UIColor.white, cornerRadius: 5, borderWidth: 0.5, borderColor: UIColor.black, arrowSize:CGSize(width: 8, height: 8), arrowPosition: 0)
   }
   
   public init(textColor:UIColor, fontSize:CGFloat, backgroundColor:UIColor, balloonBackgroundColor:UIColor, cornerRadius:Int, borderWidth:CGFloat, borderColor:UIColor, arrowSize:CGSize, arrowPosition:CGFloat) {
      
      self._textColor = textColor
      self._fontSize = fontSize
      self._backgroundColor = backgroundColor
      self._balloonBackgroundColor = balloonBackgroundColor
      self._cornerRadius = cornerRadius
      self._borderWidth = borderWidth
      self._borderColor = borderColor
      self._arrowSize = arrowSize
      self._arrowPosition = arrowPosition
   }
   
   // MARK: - MWBalloonProfileProtocol - start
   
   public var textColor:UIColor {
      get {
         return self._textColor
      }
      set {
         self._textColor = newValue
      }
   }
   
   public var fontSize: CGFloat {
      get {
         return self._fontSize
      }
      set {
         self._fontSize = newValue
      }
   }
   
   public var backgroundColor:UIColor? {
      get {
         return self._backgroundColor
      }
      set {
         self._backgroundColor = newValue
      }
   }
   
   public var balloonBackgroundColor:UIColor {
      get {
         return self._balloonBackgroundColor
      }
      set {
         self._balloonBackgroundColor = newValue
      }
   }
   
   public var cornerRadius:Int {
      get {
         return self._cornerRadius
      }
      set {
         self._cornerRadius = newValue
      }
   }
   
   public var borderWidth:CGFloat {
      get {
         return self._borderWidth
      }
      set {
         self._borderWidth = newValue
      }
   }
   
   public var borderColor:UIColor {
      get {
         return self._borderColor
      }
      set {
         self._borderColor = newValue
      }
   }
   
   public var arrowSize:CGSize {
      get {
         return self._arrowSize
      }
      set {
         self._arrowSize = newValue
      }
   }
   
   public var arrowPosition:CGFloat {
      get {
         return self._arrowPosition
      }
      set {
         self._arrowPosition = newValue
      }
   }

   // MWBalloonProfileProtocol - end

}
