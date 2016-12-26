//
//  MWBalloonDefault.swift
//  MWBalloonTextField
//
//  Created by Gene M. Angelo  Jr. on 12/21/16.
//  Copyright © 2016 Mohojo Werks LLC. All rights reserved.
//

import UIKit

class MWBalloonDefault: MWBalloonBase {
   
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
      
      self.balloonTextColor = UIColor.black
      self.balloonFontSize = 10.0
      self.balloonBackgroundColor = UIColor.white
      self.balloonCornerRadius = 5
      self.balloonBorderWidth = 0.5
      self.balloonBorderColor = UIColor.black
      self.balloonArrowSize = CGSize(width: 8, height: 8)
      self.balloonArrowPosition = 0

   }
}
