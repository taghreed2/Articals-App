//
//  AddNewArticleViewController.swift
//  ArticleApp
//
//  Created by Team on 11/25/21.
//

import UIKit
import CoreData

//let entity = NSEntityDescription.entity(forEntityName: "Article", in: context)
//let newArticle = Article(entity: entity!, insertInto: context)


class AddNewArticleViewController: UIViewController {
    let newArticle = Article(context: context)
    @IBOutlet weak var addTitleTF: UITextField!
    @IBOutlet weak var addArticleTArea: UITextView!
    
    @IBOutlet weak var natureOutlet: UIButton!
    @IBOutlet weak var fitnessOutlet: UIButton!
    @IBOutlet weak var iOSOutlet: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        natureOutlet.tintColor = .darkGray
        fitnessOutlet.tintColor = .darkGray
        iOSOutlet.tintColor = .darkGray
        
    }
    
    @IBAction func natureBtn(_ sender: Any) {
        natureOutlet.tintColor = .systemPink
        fitnessOutlet.tintColor = .darkGray
        iOSOutlet.tintColor = .darkGray
        newArticle.category = "Nature"
    }
    
    @IBAction func fitenissBtn(_ sender: Any) {
        natureOutlet.tintColor = .darkGray
        fitnessOutlet.tintColor = .systemPink
        iOSOutlet.tintColor = .darkGray
        newArticle.category = "Fiteniss"
    }
    
    @IBAction func iOSBtn(_ sender: Any) {
        natureOutlet.tintColor = .darkGray
        fitnessOutlet.tintColor = .darkGray
        iOSOutlet.tintColor = .systemPink
        newArticle.category = "iOS"
    }
    
    @IBAction func createArticleBtn(_ sender: Any) {

        newArticle.id = Int32(arrOfArticles.count)
        newArticle.naame = addTitleTF.text
        newArticle.content = addArticleTArea.text
        do {
            try context.save()
            
        } catch {
            print("there is an error ")

        }
        performSegue(withIdentifier: "addToHome", sender: self)

        //        let st = UIStoryboard(name: "Main", bundle: nil)
        //        let vd = st.instantiateViewController(withIdentifier: "ViewController")
        //        present(vd, animated: true, completion: nil)
    }
    
}
