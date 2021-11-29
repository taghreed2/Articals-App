//
//  ViewController.swift
//  ArticleApp
//
//  Created by Team M on 11/25/21.
//

import UIKit
import CoreData

var arrOfArticles = [Article]()
var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

class ViewController: UIViewController {
    
    var artNaame = ""
    var artContent = ""
    var artCategory = ""
    var x = 0
    @IBOutlet weak var segmantOutlet: UISegmentedControl!
    @IBOutlet weak var myTableViewOutlet: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        UserDefaults.standard.setValue(UserDefaults.standard.integer(forKey: "id") + 1, forKey: "id") //this will increment id each time by 1 and saved in userDefault, so it will generate a unique id for each article.
        navigationItem.title = "Home"
        myTableViewOutlet.reloadData()
    }
    
    func loadData(){
        
        do {
            arrOfArticles =  try context.fetch(Article.fetchRequest())
            myTableViewOutlet.reloadData()
        }catch{
            print("Error")
        }
    }
    
    func SaveData() {
        do{
            try context.save()
        }catch{
            print (error)
        }
        myTableViewOutlet.reloadData()
    }
    
    
    @IBAction func segmantAction(_ sender: Any) {
        x = segmantOutlet.selectedSegmentIndex
        loadData()
        if x == 0 {
            myTableViewOutlet.reloadData()
        }else if x == 1{
            arrOfArticles = arrOfArticles.filter{$0.category=="Nature"}
            myTableViewOutlet.reloadData()
        }else if x == 2{
            arrOfArticles = arrOfArticles.filter{$0.category=="Fiteniss"}
            myTableViewOutlet.reloadData()
        }else if x == 3{
            arrOfArticles = arrOfArticles.filter{$0.category=="iOS"}
            myTableViewOutlet.reloadData()
        }
    }
}



// TableView
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arrOfArticles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableViewOutlet.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! myTableViewCell
        cell.titleLabelCell.text = arrOfArticles[indexPath.row].naame
        cell.categoryLabelCell.text = arrOfArticles[indexPath.row].category
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        artNaame = arrOfArticles[indexPath.row].naame ?? ""
        artContent = arrOfArticles[indexPath.row].content ?? ""
        artCategory = arrOfArticles[indexPath.row].category ?? ""
        performSegue(withIdentifier: "homeToArticle", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "homeToArticle" {
            let nextVC = segue.destination as! ArticleViewController
            nextVC.get_ArticleTitleLabelOutlet = artNaame
            nextVC.get_articleTextAreaOutlet = artContent
            nextVC.get_articleCategoryLabelOutlet = artCategory
            
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            context.delete(arrOfArticles[indexPath.row])
            arrOfArticles.remove(at: indexPath.row)
            self.SaveData()
        }}
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        60
    }
}
