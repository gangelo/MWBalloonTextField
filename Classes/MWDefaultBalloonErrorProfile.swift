//
//  MWDefaultBalloonErrorProfile.swift
//  MWBalloonTextField
//
//  Created by Gene M. Angelo  Jr. on 12/27/16.
//  Copyright © 2016 Mohojo Werks LLC. All rights reserved.
//

import Foundation

public class MWDefaultBalloonErrorProfile: MWDefaultBalloonProfile {
   
   public init() {
      super.init(textColor: UIColor(hex: 0xfefefe), fontSize: 10.0, backgroundColor:UIColor.clear, balloonBackgroundColor: UIColor(hex: 0xcc0000), cornerRadius: 5, borderWidth: 0.5, borderColor: UIColor(hex: 0xcc0000), arrowSize: CGSize(width: 12, height: 8), arrowPosition: 0)
   }
}
