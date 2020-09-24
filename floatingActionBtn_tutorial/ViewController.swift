//
//  ViewController.swift
//  floatingActionBtn_tutorial
//
//  Created by Jeff Jeong on 2020/09/24.
//

import UIKit
import JJFloatingActionButton

class ViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.\
        
        let actionButton = JJFloatingActionButton()
        
        actionButton.buttonColor = #colorLiteral(red: 0.9098039269, green: 0.4767260222, blue: 0.7053626666, alpha: 1)

        actionButton.addItem(title: "좋아요", image: UIImage(systemName: "hand.thumbsup.fill")?.withRenderingMode(.alwaysTemplate)) { item in
          // do something
            self.titleLabel.text = "좋아요👍"
        }

        actionButton.addItem(title: "하트", image: UIImage(systemName: "heart.fill")?.withRenderingMode(.alwaysTemplate)) { item in
          // do something
            self.titleLabel.text = "하트❤️"
        }

        actionButton.addItem(title: "휴지통", image: UIImage(systemName: "trash.fill")?.withRenderingMode(.alwaysTemplate)) { item in
          // do something
            self.titleLabel.text = "휴지통🧹"
        }

//        view.addSubview(actionButton)
//        actionButton.translatesAutoresizingMaskIntoConstraints = false
//        actionButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
//        actionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16).isActive = true

        // last 4 lines can be replaced with
        actionButton.display(inViewController: self)
        
        
        let secondActionBtn = JJFloatingActionButton()
        
        secondActionBtn.buttonColor = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)

        secondActionBtn.addItem(title: "", image: nil) { item in
          // do something
//            self.titleLabel.text = "좋아요👍"
            
            let alertController = UIAlertController(title: "작성", message: "작성 해주세요", preferredStyle: .alert)
            alertController.addTextField()
            
            let submitButtonAction = UIAlertAction(title: "완료", style: .default, handler: { action in
                //
                let textField = alertController.textFields![0]
                
                guard let userInputText = textField.text else {
                    print("값이 없다.")
                    return
                }
                
                self.titleLabel.text = userInputText
            })
            alertController.addAction(submitButtonAction)
            self.present(alertController, animated: true, completion: nil)
            
        }

        view.addSubview(secondActionBtn)
        secondActionBtn.translatesAutoresizingMaskIntoConstraints = false
        
        secondActionBtn.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        secondActionBtn.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16).isActive = true

        
        
    }


}

