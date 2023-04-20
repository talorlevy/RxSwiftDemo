//
//  ViewModel.swift
//  RxSwiftDemo
//
//  Created by Talor Levy on 4/20/23.
//

import RxSwift

class ViewModel {
    
    var items = PublishSubject<[Product]>()
    
    func fetchFirstItems() {
        let products = [
            Product(imageName: "house", title: "Home"),
            Product(imageName: "gear", title: "Settings"),
            Product(imageName: "person.circle", title: "Profile"),
            Product(imageName: "airplane", title: "Flights"),
            Product(imageName: "bell", title: "Activity")
        ]
        
        items.onNext(products)
    }

    func fetchSecondItems() {
        let products = [
            Product(imageName: "bag", title: "Bag"),
            Product(imageName: "book.closed", title: "Book"),
            Product(imageName: "briefcase", title: "Briefcase")
        ]

        items.onNext(products)
    }
}
