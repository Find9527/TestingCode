import UIKit


protocol SleepDelegate {
    func willStartSleep()
    func didFinishSleep()
}

class Sleep {
    var delegate: SleepDelegate?
    func startToSleep(time:UInt32) {
        delegate?.willStartSleep()
        NSLog("%@","Before sleep in startToSleep")
        sleep(time)
        NSLog("%@","After sleep in startToSleep")
        delegate?.didFinishSleep()
    }
    
}






class ViewController: UIViewController, SleepDelegate {
    var sleepInstance = Sleep()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sleepInstance.delegate = self
        sleepInstance.startToSleep(time: 2)
        
    }
    
    func willStartSleep() {
        NSLog("%@","Will start in delegate method")
    }
    
    func didFinishSleep() {
        NSLog("%@","Finish sleep in delegate method")
    }
   
}
