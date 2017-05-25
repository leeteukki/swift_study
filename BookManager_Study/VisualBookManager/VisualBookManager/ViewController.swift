//
//  ViewController.swift
//  VisualBookManager
//
//  Created by tk's macbook on 2017. 5. 21..
//  Copyright © 2017년 tk's macbook. All rights reserved.
//

import UIKit
import GoogleMobileAds

class ViewController: UIViewController {
    
    @IBOutlet weak var BannerView: GADBannerView!
    
    
    
    
    
    let myBook = BookManager()

    @IBOutlet weak var OutputTextView: UITextView!
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var genreTextField: UITextField!
    @IBOutlet weak var authorTextField: UITextField!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let book1 = Book()
        book1.name = "햄릿"
        book1.genre = "비극"
        book1.author = "세익스 피어"
        
        //book1.bookPrint()
        
        let book2 = Book()
        book2.name = "누구를 위하여 종을 울리나"
        book2.genre = "전쟁"
        book2.author = "헤멍웨이"
        
        //book2.bookPrint()
        
        let book3 = Book()
        book3.name = "죄와벌"
        book3.genre = "사실주의"
        book3.author = "롤스토이"
        
        //book3.bookPrint()
        
        
        
        myBook.addBook(book1)
        
        myBook.addBook(book2)
        
        myBook.addBook(book2)
        
        super.viewDidLoad()
        print("Google Mobile Ads SDK version: \(GADRequest.sdkVersion())")
        BannerView.adUnitID = "pub-7819348607115723"
        BannerView.rootViewController = self
        BannerView.load(GADRequest())
        

    }
    
    
    @IBAction func showAllBookAction(_ sender: AnyObject) {
       //print(myBook.showAllBook())
        OutputTextView.text = myBook.showAllBook()
    }
    
    
    @IBAction func addBookAction(_ sender: AnyObject) {
        let bookTemp = Book()
        
        bookTemp.name = titleTextField.text!
        bookTemp.genre = genreTextField.text!
        bookTemp.author = authorTextField.text!
        
        myBook.addBook(bookTemp)
        OutputTextView.text = "\(titleTextField.text!) 도서가 등록 되었습니다"
        
    }
    
    @IBAction func findBookAction(_ sender: AnyObject) {
        let resultBook = myBook.findBook(titleTextField.text!)
        if resultBook != nil {
            OutputTextView.text = resultBook
            
        }else{
            OutputTextView.text = "찾으시는 책이 없네요."
        }
        
    }
    
   
  /*  @IBAction func deleteBook(_ sender: AnyObject) {
        let removeBook = myBook.removeBook(titleTextField.text!)
        if removeBook == true {
            OutputTextView.text = "\(titleTextField.text!) remove book"
        }else{
         
            OutputTextView.text = " not found book"
        }
        
    }
 */
    
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

