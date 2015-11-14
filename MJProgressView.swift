//
//  MJProgressView.swift
//  test
//
//  Created by Maxime Junger on 14/11/15.
//  Copyright © 2015 Maxime Junger. All rights reserved.
//

import UIKit

class MJProgressView {
	
	static let	  instance = MJProgressView()
	
	internal var  containerView = UIView()
	internal var  progressView = UIView()
	internal var  indicator = UIActivityIndicatorView()
	
	internal var  _containerBackgroundColor :UIColor? = UIColor.whiteColor().colorWithAlphaComponent(0.3)
	internal var  _progressBackgroundColor :UIColor = UIColor.blackColor().colorWithAlphaComponent(0.7)
	
	internal var  _isRunning = false
	
	private init() { }
	
	internal func showProgress(view: UIView) {
		_isRunning = true
		if (_containerBackgroundColor != nil) {
			containerView.frame = view.frame
			containerView.center = view.center
			containerView.backgroundColor = _containerBackgroundColor
		}
		
		progressView.frame = CGRectMake(0, 0, 120, 120)
		progressView.center = view.center
		progressView.backgroundColor = _progressBackgroundColor
		progressView.clipsToBounds = true
		progressView.layer.cornerRadius = 5
		
		indicator.frame = CGRectMake(0, 0, 40, 40)
		indicator.activityIndicatorViewStyle = .WhiteLarge
		indicator.center = CGPointMake(progressView.bounds.width / 2, progressView.bounds.height / 2)
		
		progressView.addSubview(indicator)
		containerView.addSubview(progressView)
		view.addSubview(containerView)
		
		indicator.startAnimating()
	}
	
	internal func hideProgress() {
		_isRunning = false
		indicator.stopAnimating()
		containerView.removeFromSuperview()
	}
	
	func setColorProperties(backgroundColor :UIColor?, progressViewBackgroundColor :UIColor) {
		_containerBackgroundColor = backgroundColor
		_progressBackgroundColor = progressViewBackgroundColor
	}
	
	func isRunning() -> Bool {
		return _isRunning
	}
}