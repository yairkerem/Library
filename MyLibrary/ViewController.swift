//
//  ViewController.swift
//  MyLibrary
//
//  Created by Test2 on 10/06/2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var bookCollectionView: UICollectionView!
    @IBOutlet weak var selectionSegmentedControl: UISegmentedControl!


    let bookList: [Book] = [
        Book(titleName: "Jane Eyre", authorName: "Charlotte Brontë", isRead: false, frontCoverImage: "Jane-Eyre-front Medium", backCoverImage: "Jane-Eyre-back Medium", rating: 4),
        Book(titleName: "Don Quixote", authorName: "Miguel de Cervantes", isRead: false, frontCoverImage: "Don-Quixote-front Medium", backCoverImage: "Don-Quixote-back Medium", rating: 4),
        Book(titleName: "Hamlet", authorName: "William Shakespeare", isRead: true, frontCoverImage: "Hamlet-front Medium", backCoverImage: "Hamlet-back Medium", rating: 5),
        Book(titleName: "The Da Vinci Code", authorName: "Dan Brown", isRead: true, frontCoverImage: "Code-front Medium", backCoverImage: "Code-back Medium", rating: 2),
    ]
    
    var booksToShow: [Book]? {
        return bookList.filter { book in
            switch selection {
                case .all:
                return true
            case .read:
                return book.isRead == true
            case .unread:
                return book.isRead == false
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bookCollectionView.dataSource = self
        bookCollectionView.delegate = self
        setupSegmentedControl()
    }

    enum Selection: String {
        case all = "All"
        case read = "Read"
        case unread = "Unread"
    }
    var selection: Selection = .all
    let allSelections: [Selection] = [.all, .read, .unread]
    func setupSegmentedControl() {
        selectionSegmentedControl.removeAllSegments()
        for (index, selection) in allSelections.enumerated() {
            selectionSegmentedControl.insertSegment(withTitle: selection.rawValue, at: index, animated: false)
        }
        
        selectionSegmentedControl.selectedSegmentIndex = 0
        selection = allSelections[selectionSegmentedControl.selectedSegmentIndex]
    
    }

    @IBAction func selectionChanged(_ sender: UISegmentedControl) {
        selection = allSelections[sender.selectedSegmentIndex]
        bookCollectionView.reloadData()
    }
}


class BookCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var bookImageView: UIImageView!
    @IBOutlet weak var bookTitleLabel: UILabel!
    
    var book: Book? = nil
}




