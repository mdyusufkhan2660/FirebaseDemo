import UIKit
import FirebaseFirestore

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let database = Firestore.firestore()
        
        //Insert data into users table
        let docRef = database.collection("users")
        docRef.document().setData([
            "name": "Yusuf",
            "email": "yusuf@gmail.com"
        ])
    }


}

