//
//  ViewController.swift
//  Dz-1
//
//  Created by Руслан Мотин on 04.01.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func ok(_ sender: UIButton) {
        // Создаем экземпляр оповещения
        let alert = UIAlertController(title: "Ошибка!", message: "Переходы мы будем изучать на следующих занятиях.", preferredStyle: .alert)
        // Создаем кнопку
        let button = UIAlertAction(title: "Завершить", style: .destructive, handler: nil)
        // Добавляем эту кнопку
        alert.addAction(button)
        // Выводим
        present(alert, animated: true, completion: nil)
    }
}

