import UIKit

class FieldObservationDetailViewController: UIViewController {

    var fieldObservation: FieldObservation?
    
    var dateFormatter = DateFormatter()
    
    @IBOutlet weak var classificationIconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium
        
        self.title = ""
        
        classificationIconImageView.image = fieldObservation?.classification.image
        titleLabel.text = fieldObservation?.title
        if let date = fieldObservation?.date{
            dateLabel.text = dateFormatter.string(from: date)
        }else{
            dateLabel.text = "Observation"
        }
        descriptionLabel.text = fieldObservation?.description

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
