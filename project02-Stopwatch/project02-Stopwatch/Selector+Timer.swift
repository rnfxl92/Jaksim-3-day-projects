//
//  Selector+Timer.swift
//  project02-Stopwatch
//
//  Created by 박성민 on 2021/04/05.
//

import Foundation

// MARK: - Extension
extension Selector {
  static let updateMainTimer = #selector(ViewController.updateMainTimer)
  static let updateLapTimer = #selector(ViewController.updateLapTimer)
}
