//
//  File.swift
//  MyLibrary
//
//  Created by Test2 on 11/06/2022.
//

import Foundation
import UIKit

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let listSize = booksToShow?.count {
            return listSize
        } else {
            return 0
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let bookCell = collectionView.dequeueReusableCell(withReuseIdentifier: "bookCell", for: indexPath) as! BookCollectionViewCell
        if let book = booksToShow?[indexPath.row] {
            bookCell.bookTitleLabel.text = booksToShow?[indexPath.row].titleName
            bookCell.bookImageView.image = UIImage(named: book.frontCoverImage)
            bookCell.book = booksToShow?[indexPath.row]
        }
        return bookCell
    }
}


extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width / 2 - 1
        return CGSize(width: width, height: width + 100)
    }
}

extension ViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? BookDetailsViewController,
        let selectedCell = sender as? BookCollectionViewCell {
            destination.book = selectedCell.book
        }
    }
}
