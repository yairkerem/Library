//
//  BookDetailsViewController.swift
//  MyLibrary
//
//  Created by Test2 on 11/06/2022.
//

import UIKit
import Foundation

class BookDetailsViewController: UIViewController {
    
    @IBAction func closeTapped(_ sender: UIButton) {
        self.dismiss(animated: true)
    }

    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var frontCoverImage: UIImageView!
    @IBOutlet weak var backCoverImage: UIImageView!
    
    @IBOutlet weak var isReadImage: UIImageView!
    
    @IBOutlet weak var star1: UIImageView!
    @IBOutlet weak var star2: UIImageView!
    @IBOutlet weak var star3: UIImageView!
    @IBOutlet weak var star4: UIImageView!
    @IBOutlet weak var star5: UIImageView!
    

    var book: Book? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let bookTitle = book?.titleName {
            titleLabel.text = bookTitle
        }
        if let bookAuthor = book?.authorName {
            authorLabel.text = bookAuthor
        }
        if let bookFrontCover = book?.frontCoverImage {
            frontCoverImage.image = UIImage(named: bookFrontCover)
        }
        if let bookBackCover = book?.backCoverImage {
            backCoverImage.image = UIImage(named: bookBackCover)
        }
        if let bookRating = book?.rating {
            if bookRating >= 1 {
                star1.isHighlighted = true
            }
            if bookRating >= 2 {
                star2.isHighlighted = true
            }
            if bookRating >= 3 {
                star3.isHighlighted = true
            }
            if bookRating >= 4 {
                star4.isHighlighted = true
            }
            if bookRating >= 5 {
                star5.isHighlighted = true
            }
            if bookRating <= 0 || bookRating > 5 {
                star1.isHighlighted = false
                star2.isHighlighted = false
                star3.isHighlighted = false
                star4.isHighlighted = false
                star5.isHighlighted = false
            }
        }
        
        if let readStatus = book?.isRead {
            if readStatus {
                isReadImage.isHighlighted = true
            } else {
                isReadImage.isHighlighted = false
            }
        }
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

