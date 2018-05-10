import Foundation
import AVFoundation

class SwitchCounter {
    
    private let lightsLogic = LightsLogic()
    private var counter: Int = 0
    private var timer: Timer = Timer()
    private var frequency: Double = 500
    private var start = DispatchTime.now()
    private var end = DispatchTime.now()
    private var isCounting = false
    
    // Start Strobe process
    func run () {
        if (isCounting) {
            print("Turning timer off")
            isCounting = false
            timer.invalidate()
            
            end = DispatchTime.now()
            let nanoTime = end.uptimeNanoseconds - start.uptimeNanoseconds
            let timeInterval = Double(nanoTime) / 1_000_000_000
            print("I counted this high \(counter) in this many seconds \(timeInterval) ")
            counter = 0
        } else {
            print("Turning timer on")
            isCounting = true
            timer = Timer.scheduledTimer(timeInterval: 1/frequency, target: self, selector: #selector(incrementCounter), userInfo: nil, repeats: true)
            start = DispatchTime.now()
        }
    }
    
    // Increase counter by one
    @objc func incrementCounter () {
        lightsLogic.toggleStrobe()
        counter += 1
    }
}
