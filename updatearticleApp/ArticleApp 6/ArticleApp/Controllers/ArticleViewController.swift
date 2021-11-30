//
//  ArticleViewController.swift
//  ArticleApp
//
//  Created by Team M on 11/25/21.
//

import UIKit
import CoreData

class ArticleViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var ArticleTitleLabelOutlet: UILabel!
    @IBOutlet weak var articleCategoryLabelOutlet: UILabel!
    @IBOutlet weak var articleTextAreaOutlet: UITextView!
    @IBOutlet weak var shareOutlet: UIButton!
    
    var get_ArticleTitleLabelOutlet = ""
    var get_articleCategoryLabelOutlet = ""
    var get_articleTextAreaOutlet = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = UIImage(named: "pl")
        ArticleTitleLabelOutlet.text = get_ArticleTitleLabelOutlet
        articleCategoryLabelOutlet.text = get_articleCategoryLabelOutlet
        articleTextAreaOutlet.text = get_articleTextAreaOutlet
    }
    
    @IBAction func shareAction(_ sender: Any) {
        shareSheet()
        
    }
    func shareSheet (){
        let image = UIImage(named: "pl")!
        let url = URL(string: "http://www.google.com")
       
        let share = UIActivityViewController(activityItems: [
            image,
            url
        ],
        applicationActivities: nil)
     
        self.present(share, animated: true, completion: nil)
    }
    
}
