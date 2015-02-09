//
//  LoginViewController.swift
//  Facebook
//
//  Created by Wei Chen on 2/5/15.
//  Copyright (c) 2015 codepath. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var loadingView: UIActivityIndicatorView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loginButton.enabled = false
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func didEnterEmail(sender: AnyObject) {
        if (emailField.text.isEmpty || passwordField.text.isEmpty){
            loginButton.enabled = false

        }
        else {
            loginButton.enabled = true
         
        }
    }
    

    
    func checkPassword (){
        if (self.passwordField.text == "000000"){
            performSegueWithIdentifier("loginSegue", sender: self)
        }
        else {
            //var alert = UIAlertController(title: "Login Failed", message: "Invalid Email/Password", preferredStyle: UIAlertControllerStyle.Alert)
            //alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            var alertView = UIAlertView(title: "Login Failed", message: "Invalid Email/Password", delegate: self, cancelButtonTitle: "ok")
            alertView.show()
            //self.presentViewController(alert, animated: true, completion: nil)
            self.loginButton.enabled = false
        }
        self.loadingView.stopAnimating()
    }
    
    @IBAction func didEnterPassword(sender: AnyObject) {
        if (emailField.text.isEmpty || passwordField.text.isEmpty){
            loginButton.enabled = false
        }
        else {
            loginButton.enabled = true
        }
    
    }
    
    @IBAction func didPressLoginButton(sender: AnyObject) {
        loadingView.startAnimating()
        
        self.loginButton.selected = true
        delay(2, {() -> () in
          self.checkPassword()
            self.loginButton.selected = false
        })
    }
   
        
}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


