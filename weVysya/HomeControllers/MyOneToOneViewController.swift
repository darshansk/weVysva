
import UIKit

class MyOneToOneViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var myOnetoOneTableView: UITableView!
    @IBOutlet weak var endDateTextField: UITextField!
    @IBOutlet weak var startDateTextField: UITextField!
    private var startdatePicker: UIDatePicker?
    private var enddatePicker: UIDatePicker?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datePickers()
        
        //Assign delegate methods
        myOnetoOneTableView.delegate = self
        myOnetoOneTableView.dataSource = self
        
        //Registering the nib file
        myOnetoOneTableView.register(UINib(nibName: "OneToOneCell", bundle: nil), forCellReuseIdentifier: "myOneToOneCell")
        configureTableView()
        

    }
    
    //MARK:- Table View Methods
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = tableView.dequeueReusableCell(withIdentifier: "myOneToOneCell", for: indexPath) as! OneToOneCell

           return cell
       }
       func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return 8
       }
       func configureTableView(){
           myOnetoOneTableView.rowHeight = 200.0
           myOnetoOneTableView.estimatedRowHeight = 200.0
            
       }
       
       
       //MARK:- Date Picker
       func datePickers(){
           //initialization
           startdatePicker = UIDatePicker()
           startdatePicker?.datePickerMode = .date
           
           enddatePicker = UIDatePicker()
           enddatePicker?.datePickerMode = .date
                      //assign to input field
           startDateTextField.inputView = startdatePicker
           endDateTextField.inputView = enddatePicker
           
           //end state handling
           enddatePicker?.addTarget(self, action: #selector(MyLinksViewController.enddateChanged(datePickerInput:)), for: .valueChanged)
           startdatePicker?.addTarget(self, action: #selector(MyLinksViewController.startdateChanged(datePickerInput:)), for: .valueChanged)
           //tap Gesture
               let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped(gestureRecongnizer:)))
               view.addGestureRecognizer(tapGesture)
       }
       @objc func viewTapped(gestureRecongnizer: UITapGestureRecognizer){
           view.endEditing(true)
       }
       @objc func startdateChanged(datePickerInput: UIDatePicker){
                let dateFormatter = DateFormatter()
                 dateFormatter.dateFormat = "dd/MM/yyyy"
                 startDateTextField.text = dateFormatter.string(from: datePickerInput.date)
           
                 //view.endEditing(true)
             }
       @objc func enddateChanged(datePickerInput: UIDatePicker){
            let dateFormatter = DateFormatter()
             dateFormatter.dateFormat = "dd/MM/yyyy"
             endDateTextField.text = dateFormatter.string(from: datePickerInput.date)
       
             //view.endEditing(true)
         }
  

}
