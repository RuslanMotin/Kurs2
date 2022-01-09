//
//  ViewController.swift
//  Dz-1
//
//  Created by Руслан Мотин on 04.01.2022.
//

import UIKit

class ViewController: UIViewController {
    // cоздаем экземпляр хранилеще
    let userDefault = UserDefaults.standard
    // создаем ключи к логину и паролю к которому будем обращаться
    let key1 = "0000"
    let key2 = "1111"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.login = userDefault.string(forKey: key1) ?? ""
        self.password = userDefault.string(forKey: key2) ?? ""
    }
   
    @IBAction func registration(sender: UIButton) {
      registr()
    }
    
    var login = "admin" {
        didSet {
            userDefault.set(login, forKey: key1)
        }
    }
        
    var password = "123456" {
        didSet {
            userDefault.set(password, forKey: key2)
        }
    }
    
    @IBOutlet var loginUser: UITextField?
    
    @IBOutlet var passwordUser: UITextField?
    
    @IBAction func ok(_ sender: UIButton) {
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
       let resultData = checkUserData()
        if !resultData {
            alertError()
            return false
        }
        return resultData
}
   
    func checkUserData() -> Bool {
        guard let loginGuard = loginUser?.text, let passwordGuard = passwordUser?.text else { return false }
        if loginGuard == login && passwordGuard == password {
        print("Данные введены верно")
        return true
        } else {
        alertError()
        return false
    }
}
    
    func alertError() {
        let alert = UIAlertController(title: "Ошибка!", message: "Неверный логин или пароль", preferredStyle: .alert)
        // Создаем кнопку
        let button = UIAlertAction(title: "ОК", style: .destructive, handler: nil)
        // Добавляем эту кнопку
        alert.addAction(button)
        // Выводим
        present(alert, animated: true, completion: nil)
    }
    
    func registr() {
        userDefault.removeObject(forKey: key1)
        userDefault.removeObject(forKey: key2)
        let alert = UIAlertController(title: "Регистристрация", message: "Укажите новый логин и пароль", preferredStyle: .alert)
           alert.addTextField(configurationHandler: { (textField1) in textField1.placeholder = "Логин"
               })
          alert.addTextField(configurationHandler: { (textField2) in
              textField2.placeholder = "Пароль"
               })
        let button = UIAlertAction(title: "Готово", style: .cancel, handler: { ok in
            self.login = alert.textFields![0].text ?? ""
            self.password = alert.textFields![1].text ?? ""
               })
          alert.addAction(button)
          present(alert, animated: true, completion: nil)
    }
}

