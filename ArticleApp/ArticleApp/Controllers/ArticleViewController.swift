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
    
    var get_ArticleTitleLabelOutlet = ""
    var get_articleCategoryLabelOutlet = ""
    var get_articleTextAreaOutlet = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ArticleTitleLabelOutlet.text = get_ArticleTitleLabelOutlet
        articleCategoryLabelOutlet.text = get_articleCategoryLabelOutlet
        articleTextAreaOutlet.text = get_articleTextAreaOutlet
    }
    
}
