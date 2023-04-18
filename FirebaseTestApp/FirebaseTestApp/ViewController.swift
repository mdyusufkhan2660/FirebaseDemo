//
//  ViewController.swift
//  FirebaseTestApp
//
//  Created by Md Yusuf Khan on 2023-04-05.
//

import UIKit
import FirebaseFirestore

class ViewController: UIViewController {
    let database = Firestore.firestore()
    @IBAction func myBtn(_ sender: UIButton) {
        
    }
    @IBOutlet weak var result: UILabel!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var name: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Insert Data into users table
//        let docRef = database.collection("users")
//        docRef.document().setData([
//            "name":"Hello",
//            "email":"tesing",
//            "password": "east"
//        ])
        
        //Read data from users table
        database.collection("users").getDocuments() {
            (querySnapshot, err) in if let err = err {
                print("Error getting documents: \(err)")
                
            } else {
                for document in querySnapshot!.documents {
                        print("\(document.documentID) => \(document.data())")
                    }
                }
        }
        
        //Read specific data from users table
        var docRef = database.collection("users").document("BITAVjhdn40rX2KtQ6O6")
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
                print("Document data: \(dataDescription)")
            } else {
                print("Document does not exist")
            }
        }
        
        //Get a value from a document
        docRef = database.collection("users").document("BITAVjhdn40rX2KtQ6O6")
        docRef.getDocument { (document, error) in
             if let document = document, document.exists {
                 let docData = document.data()
                 let name = docData!["name"] as? String ?? ""
                 print("Name is \(name)")
                 // Do something with doc data
              } else {
                 print("Document does not exist")

              }
        }
        
        //Delete a record
//        database.collection("users").document("BITAVjhdn40rX2KtQ6O6").delete() { err in
//            if let err = err {
//                print("Error removing document: \(err)")
//            } else {
//                print("Document successfully removed!")
//            }
//        }
        
        
        
        
    }
}

