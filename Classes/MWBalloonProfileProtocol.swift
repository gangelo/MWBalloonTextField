//
//  MWBalloonProfileProtocol.swift
//  MWBalloonTextField
//
//  Created by Gene M. Angelo  Jr. on 12/16/16.
//  Copyright © 2016 Mohojo Werks LLC. All rights reserved.
//

import UIKit
import Foundation

public protocol MWBalloonProfileProtocol {
   var textColor:UIColor { get set }
   var fontSize:CGFloat { get set }
   var balloonBackgroundColor:UIColor { get set  }
   var backgroundColor:UIColor? { get set  }
   var cornerRadius:Int { get set  }
   var borderWidth:CGFloat { get set  }
   var borderColor:UIColor { get set  }
   var arrowSize:CGSize { get set  }
   var arrowPosition:CGFloat { get set  }
}
