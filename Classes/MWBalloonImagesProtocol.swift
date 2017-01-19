//
//  MWBalloonImagesProtocol.swift
//  MWBalloonTextField
//
//  Created by Gene M. Angelo  Jr. on 12/27/16.
//  Copyright © 2016 Mohojo Werks LLC. All rights reserved.
//

import UIKit
import Foundation

public protocol MWBalloonImagesProtocol {
   var errorImage:UIImage { get set }
   var successImage:UIImage { get set }
   var waitingImageView:UIImageView { get set }
}

public extension MWBalloonImagesProtocol {
   public mutating func setImages(error:UIImage? = nil, success:UIImage? = nil, waiting:UIImageView? = nil) {
      self.errorImage = error ?? self.getDefaultErrorImage()
      self.successImage = success ?? self.getDefaultSuccessImage()
      self.waitingImageView = waiting ?? self.getDefaultWaitingImageView()
   }
   
   internal func getDefaultSuccessImage() -> UIImage {
      return self.getGetImageInBundle(named: "success")!
   }
   
   internal func getDefaultErrorImage() -> UIImage {
      return self.getGetImageInBundle(named: "error")!
   }
   
   internal func getDefaultWaitingImageView() -> UIImageView {
      let imageView:UIImageView = UIImageView()
      
      imageView.animationImages = [
         self.getGetImageInBundle(named: "waiting_0")!,
         self.getGetImageInBundle(named: "waiting_1")!,
         self.getGetImageInBundle(named: "waiting_2")!,
         self.getGetImageInBundle(named: "waiting_3")!,
         self.getGetImageInBundle(named: "waiting_4")!,
         self.getGetImageInBundle(named: "waiting_5")!,
         self.getGetImageInBundle(named: "waiting_6")!,
         self.getGetImageInBundle(named: "waiting_7")!,
         self.getGetImageInBundle(named: "waiting_8")!,
         self.getGetImageInBundle(named: "waiting_9")!,
         self.getGetImageInBundle(named: "waiting_10")!,
         self.getGetImageInBundle(named: "waiting_11")!]
      
      imageView.animationDuration = 1.0;
      imageView.animationRepeatCount = 0;
      
      return imageView
   }
   
   fileprivate func getGetImageInBundle(named:String) -> UIImage? {
      let bundle = Bundle(for: type(of: self) as! AnyClass)
      return UIImage(named: named, in: bundle, compatibleWith: nil)
   }
}
