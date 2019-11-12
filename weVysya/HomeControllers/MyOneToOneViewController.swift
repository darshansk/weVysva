
import UIKit
import Alamofire
import SwiftyJSON
class MyOneToOneViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {

    @IBAction func buttonPressed(_ sender: Any) {
        if startDateTextField.text == "" || endDateTextField.text == ""{
             self.showToast(message : "Enter The Dates", color: UIColor.gray)
        }
        else{
            self.showSpinner(onView: self.view)
        loadData()
    }
    }
    @IBOutlet weak var myOnetoOneTableView: UITableView!
    @IBOutlet weak var endDateTextField: UITextField!
    @IBOutlet weak var startDateTextField: UITextField!
    private var startdatePicker: UIDatePicker?
    private var enddatePicker: UIDatePicker?
    private lazy var numberOfItems: Int = 0
    private var fromMemberList: [String] = []
    private lazy var toMemberList: [String] = []
    private lazy var dateList: [String] = []
    private lazy var notesList: [String] = []
    
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
    //MARK:- Networking
    func loadData(){
        let url = URL(string: "https://quickworkz.com/wv/controller/onetoone.php?type=GetMyOneToOnes")
        let parameters: [String: String] = [
        "token": UserDefaults.standard.string(forKey: "token")!,
        "UserId": UserDefaults.standard.string(forKey: "membershipId")!,
        "StartDate": startDateTextField.text!,
        "EndDate": endDateTextField.text!,   ];
        
        Alamofire.request(url!, method: .post, parameters: parameters, encoding: URLEncoding.default).responseJSON { (response) in
            if response.result.isSuccess {
                        let responseJSON: JSON = JSON(response.result.value!)
                print("ResponseJSON is \(responseJSON)")
                self.numberOfItems = responseJSON.count
                if self.numberOfItems != 0{
                    for i in self.numberOfItems{
                        self.fromMemberList.append(responseJSON[i]["fromMemberName"].stringValue)
                        self.toMemberList.append(responseJSON[i]["toMemberName"].stringValue)
                        self.dateList.append(responseJSON[i]["date"].stringValue)
                        self.notesList.append(responseJSON[i]["notes"].stringValue)
                        
                    }
                         
                    self.myOnetoOneTableView.reloadData()
                    self.removeSpinner()
                     
                }
                else{
                     self.showToast(message : "No data avaiable", color: UIColor.gray)
                     self.removeSpinner()                }
                
               
            }
                    
            
            else{
                print("My one to one Error\(String(describing: response.result.error))")
                self.showToast(message : "Connection Issues", color: UIColor.gray)
                 self.removeSpinner()
            }
        }
    }
    
    //MARK:- Table View Methods
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = tableView.dequeueReusableCell(withIdentifier: "myOneToOneCell", for: indexPath) as! OneToOneCell
        cell.hostTextField.text = fromMemberList[indexPath.row]
        cell.guestTextField.text = toMemberList[indexPath.row]
        cell.dateTextField.text = dateList[indexPath.row]
        cell.notesTextField.text = notesList[indexPath.row]
           return cell
       }
       func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return numberOfItems
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
