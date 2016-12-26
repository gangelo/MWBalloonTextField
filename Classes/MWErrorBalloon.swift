//
//  UIErrorBalloon.swift
//  Accumoo
//
//  Created by Gene M. Angelo  Jr. on 12/10/16.
//  Copyright © 2016 Mohojo Werks LLC. All rights reserved.
//

import UIKit
import Foundation

class UIErrorBalloon: MWBalloonDefault {
   
   override init(frame: CGRect) {
      super.init(frame: frame)
      
      self.initialize()
   }
   
   required init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
      
      self.initialize()
   }
   
   internal override func initialize() {
      super.initialize()
      
      let red = UIColor(hex: 0xcc0000)
      
      self.balloonBorderColor = red
      self.balloonTextColor = UIColor(hex: 0xfefefe)
      self.balloonBackgroundColor = red
      self.balloonBorderColor = red
      self.balloonArrowPosition = 0
   }
}
