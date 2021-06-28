import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var questionLebal: UILabel!
    @IBOutlet weak var scoreLebal: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
   var quizB = QuizBrain()
   
     
    override func viewDidLoad() {
        super.viewDidLoad()
        
        questionLebal.text = "Are you ready"
      
        
        
   }

    @IBAction func questionAnswerAsked(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle
        let result = quizB.checkAns(userAnswer!)
        
        if result{
            sender.backgroundColor = UIColor.green
        }
        else{
            sender.backgroundColor = UIColor.red
        }
        quizB.nextCount()
        Timer.scheduledTimer(timeInterval: 0.2,target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
       
       
    }
    @objc func updateUI()  {
        
        questionLebal.text = quizB.getQuestion()
      
        scoreLebal.text = "Score : \(quizB.scoreCount())"
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        progressBar.progress = quizB.getProgress()
        
    }
    
        
       
    
}

