//
//  MWBalloonLabel.swift
//  Accumoo
//
//  Created by Gene M. Angelo  Jr. on 12/11/16.
//  Copyright © 2016 Mohojo Werks LLC. All rights reserved.
//

import UIKit

class MWBalloonLabel: UILabel {
   
   override init(frame: CGRect) {
      super.init(frame: frame)
      
      self.initialize()
   }
   
   required init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
      
      self.initialize()
   }
   
   init(frame: CGRect, textColor:UIColor, fontSize:CGFloat) {
      super.init(frame: frame)
      
      self.font = self.font.withSize(fontSize)
      self.textColor = textColor
      
      self.initialize()
   }
   
   func initialize() {
      self.numberOfLines = 0
      self.lineBreakMode = .byWordWrapping
   }
   
   override var text: String? {
      didSet {
         if text != nil {
            self.sizeToFit()
            if let balloonView = self.superview {
               if let view:MWBalloonBase = balloonView as? MWBalloonBase {
                  view.resizeToFitSubviews()
               }
            }
         }
      }
   }
   
   /*
   // Only override draw() if you perform custom drawing.
   // An empty implementation adversely affects performance during animation.
   override func draw(_ rect: CGRect) {
   // Drawing code
   }
   */
}
