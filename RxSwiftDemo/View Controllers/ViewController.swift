//
//  ViewController.swift
//  RxSwiftDemo
//
//  Created by Talor Levy on 4/20/23.
//

// https://www.youtube.com/watch?v=ES5RuLSv61g

import UIKit
import RxCocoa
import RxSwift

class ViewController: UIViewController {
    
    var viewModel = ViewModel()
    var bag = DisposeBag()

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var firstListButton: UIButton!
    @IBOutlet weak var secondListButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindTableData()
    }
    
    func bindTableData() {
        // Bind items to table
        viewModel.items.bind(to: tableView.rx.items(
            cellIdentifier: "cell",
            cellType: UITableViewCell.self)
        ) { row, model, cell in
            cell.textLabel?.text = model.title
            cell.imageView?.image = UIImage(systemName: model.imageName)
        }.disposed(by: bag)
        
        // Bind a model selected handler
        tableView.rx.modelSelected(Product.self).bind { product in
            print(product.title)
            
        }.disposed(by: bag)
        
        // fetch items
        viewModel.fetchFirstItems()
    }
    
    @IBAction func firstListButtonAction(_ sender: Any) {
        viewModel.fetchFirstItems()
    }
    
    
    @IBAction func secondListButtonAction(_ sender: Any) {
        viewModel.fetchSecondItems()
    }
}

