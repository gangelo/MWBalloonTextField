//
//  MWBalloonTextFieldBottomBorder.swift
//  MWBalloonTextField
//
//  Created by Gene M. Angelo  Jr. on 12/27/16.
//  Copyright © 2016 Mohojo Werks LLC. All rights reserved.
//

import Foundation

public class MWBalloonTextFieldBottomBorder: MWBalloonTextField {
   override init(frame: CGRect) {
      super.init(frame: frame)
      self.initialize()
   }
   
   required public init(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
      self.initialize()
   }
   
   fileprivate func initialize() {
      self.borderStyle = UITextBorderStyle.none
   }
   
   override public func draw(_ rect: CGRect) {
      super.draw(rect)
      
      let startingPoint = CGPoint(x: rect.minX, y: rect.maxY)
      let endingPoint = CGPoint(x: rect.maxX, y: rect.maxY)
      let path = UIBezierPath()
      
      path.move(to: startingPoint)
      path.addLine(to: endingPoint)
      path.lineWidth = self.getLineWidth()
      
      let color:UIColor = self.getLineColor()
      color.setStroke()
      
      path.stroke()
   }

   public func getLineWidth() -> CGFloat {
      return 2.0
   }
   
   public func getLineColor() -> UIColor {
      let seventyPercent:CGFloat = 0.098
      let borderColor = UIColor(red: 0.0, green: 0.0, blue: seventyPercent, alpha: 0.22)
      return borderColor
   }
}
