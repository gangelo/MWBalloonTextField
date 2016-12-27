//
//  MWDefaultBalloonTextFieldProfile.swift
//  MWBalloonTextField
//
//  Created by Gene M. Angelo  Jr. on 12/27/16.
//  Copyright © 2016 Mohojo Werks LLC. All rights reserved.
//

import UIKit
import Foundation

public class MWDefaultBalloonTextFieldProfile: MWBalloonTextFieldProfileProtocol {
   fileprivate var _errorImage:UIImage?
   fileprivate var _successImage:UIImage?
   fileprivate var _waitingImageView:UIImageView?
   
   public convenience init() {
      self.init(errorImage: nil, successImage: nil, waitingImageView: nil)
   }
   
   public init(errorImage:UIImage?, successImage:UIImage?, waitingImageView:UIImageView?) {
      self._errorImage = errorImage
      self._successImage = successImage
      self._waitingImageView = waitingImageView
   }
   
   // MARK: - MWBalloonTextFieldProfileProtocol - start
   
   public var errorImage:UIImage {
      get {
         return self._errorImage ?? self.getDefaultErrorImage()
      }
      set {
         self._errorImage = newValue
      }
   }
   
   public var successImage:UIImage {
      get {
         return self._successImage ?? self.getDefaultSuccessImage()
      }
      set {
         self._successImage = newValue
      }
   }
   
   public var waitingImageView:UIImageView {
      get {
         return self._waitingImageView ?? self.getDefaultWaitingImageView()
      }
      set {
         self._waitingImageView = newValue
      }
   }
   
   // MWBalloonTextFieldProfileProtocol - end
}
