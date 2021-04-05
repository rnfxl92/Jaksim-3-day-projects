//
//  ViewController.swift
//  project02-Stopwatch
//
//  Created by 박성민 on 2021/04/05.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate {
    // MARK: - Properties
    private let mainStopwatch: Stopwatch = Stopwatch()
    private let lapStopwatch: Stopwatch = Stopwatch()
    private var isPlay: Bool = false
    private var laps: [String] = []
    
    // MARK: - UI Components
    @IBOutlet weak var mainTimerLabel: UILabel!
    @IBOutlet weak var lapTimerLabel: UILabel!
    @IBOutlet weak var startPauseButton: UIButton!
    @IBOutlet weak var lapResetButton: UIButton!
    @IBOutlet weak var lapsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }

    private func configureUI() {
        lapResetButton.isEnabled = false
        
        lapsTableView.delegate = self
        lapsTableView.dataSource = self
    }
    
    @IBAction func playPauseButtonDidTap(_ sender: Any) {
        lapResetButton.isEnabled = true
        
        changeButton(lapResetButton, title: "Lap", titleColor: UIColor.black)
        
        if !isPlay {
            unowned let weakSelf = self
            
            mainStopwatch.timer = Timer.scheduledTimer(timeInterval: 0.032, target: weakSelf, selector: Selector.updateMainTimer, userInfo: nil, repeats: true)
            lapStopwatch.timer = Timer.scheduledTimer(timeInterval: 0.032, target: weakSelf, selector: Selector.updateLapTimer, userInfo: nil, repeats: true)
            
            RunLoop.current.add(mainStopwatch.timer, forMode: RunLoop.Mode.common)
            RunLoop.current.add(lapStopwatch.timer, forMode: RunLoop.Mode.common)
            
            isPlay = true
            changeButton(startPauseButton, title: "Stop", titleColor: UIColor.red)
        } else {
            mainStopwatch.timer.invalidate()
            lapStopwatch.timer.invalidate()
            isPlay = false
            
            changeButton(startPauseButton, title: "Start", titleColor: UIColor.green)
            changeButton(lapResetButton, title: "Reset", titleColor: UIColor.black)
        }
        
    }
    
    @IBAction func lapResetButtonDidTap(_ sender: Any) {
        if !isPlay {
            resetMainTimer()
            resetLapTimer()
            
            changeButton(lapResetButton, title: "Lap", titleColor: UIColor.lightGray)
            lapResetButton.isEnabled = false
        } else {
            if let currentTimeText = mainTimerLabel.text {
                laps.append(currentTimeText)
            }
            
            lapsTableView.reloadData()
            resetLapTimer()
            
            unowned let weakSelf = self
            lapStopwatch.timer = Timer.scheduledTimer(timeInterval: 0.032, target: weakSelf, selector: Selector.updateLapTimer, userInfo: nil, repeats: true)
            RunLoop.current.add(lapStopwatch.timer, forMode: RunLoop.Mode.common)
        }
    }
    

    // MARK: - Methods
    private func changeButton(_ button: UIButton, title: String, titleColor: UIColor) {
        button.setTitle(title, for: UIControl.State())
        button.setTitleColor(titleColor, for: UIControl.State())
    }

    @objc func updateMainTimer() {
      updateTimer(mainStopwatch, label: mainTimerLabel)
    }
    
    @objc func updateLapTimer() {
      updateTimer(lapStopwatch, label: lapTimerLabel)
    }
    
    private func updateTimer(_ stopwatch: Stopwatch, label: UILabel) {
        stopwatch.counter = stopwatch.counter + 0.032
        
        let minutes: String = String(format: "%02d", (Int)(stopwatch.counter / 60))
        
        var seconds: String = String(format: "%.2f",(stopwatch.counter.truncatingRemainder(dividingBy: 60)))
        if stopwatch.counter.truncatingRemainder(dividingBy: 60) < 10 {
            seconds = "0" + seconds
        }
        
        label.text = "\(minutes):\(seconds)"
        
    }
    
    private func resetMainTimer() {
        resetTimer(mainStopwatch, label: mainTimerLabel)
        laps.removeAll()
        lapsTableView.reloadData()
    }
    
    private func resetLapTimer() {
        resetTimer(lapStopwatch, label: lapTimerLabel)
    }
    
    private func resetTimer(_ stopwatch: Stopwatch, label: UILabel) {
        stopwatch.timer.invalidate()
        stopwatch.counter = 0.0
        label.text = "00:00.00"
    }
    
}

// MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return laps.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "lapCell"
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        
        return cell
    }
    
    
}
