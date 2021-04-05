//
//  Stopwatch.swift
//  project02-Stopwatch
//
//  Created by 박성민 on 2021/04/05.
//

import Foundation

final class Stopwatch {
    var counter: Double
    var timer: Timer
    
    init() {
        counter = 0.0
        timer = Timer()
    }
}
