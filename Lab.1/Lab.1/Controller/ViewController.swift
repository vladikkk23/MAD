//
//  ViewController.swift
//  Lab.1
//
//  Created by vladikkk on 18/09/2019.
//  Copyright © 2019 vladikkk. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    // MARK : Properties
    
    /*
     Store background image view
     */
    var mainBackGround: CustomBgImageView = {
       let bgView = CustomBgImageView(image: nil)
        bgView.translatesAutoresizingMaskIntoConstraints = false
        
        return bgView
    }()
    
    /*
    Front camera button.
     */
    var frontCameraRadioBtn: CustomRadioBtn = {
       let btn = CustomRadioBtn()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.isOn = false
        btn.addTarget(self, action: #selector(changeFrontCameraRadioBtnStatus), for: .touchUpInside)
        btn.isEnabled = true

        return btn
    }()
    
    /*
    Rear camera button.
     */
    var rearCameraRadioBtn: CustomRadioBtn = {
        let btn = CustomRadioBtn()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.isOn = false
        btn.addTarget(self, action: #selector(changeRearCameraRadioBtnStatus), for: .touchUpInside)
        btn.isEnabled = true
        
        return btn
    }()
    
    /*
     Text box.
     */
    var textBox: UITextField = {
        let lbl = UITextField()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.clipsToBounds = true
        
        return lbl
    }()
    
    /*
     Notification button.
     */
    var notifyButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.clipsToBounds = true
        btn.addTarget(self, action: #selector(getPushNotification), for: .touchUpInside)
        btn.backgroundColor = .blue
        btn.setTitleColor(.yellow, for: .normal)
        btn.setTitle("Get Push Notification", for: .normal)
        btn.isEnabled = true
        
        return btn
    }()
    
    /*
     Search button.
     */
    var searchBtn: UIButton = {
        let btn = UIButton(frame: CGRect(x: 10, y: 10, width: 100, height: 100))
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.clipsToBounds = true
        btn.addTarget(self, action: #selector(searchForResult), for: .touchDown)
        btn.backgroundColor = .gray
        btn.setTitleColor(.green, for: .normal)
        btn.setTitle("Search", for: .normal)
        btn.isEnabled = true

        return btn
    }()
    
    /*
     Alert button.
     */
    var alertButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.clipsToBounds = true
        btn.addTarget(self, action: #selector(displayAlert), for: .touchDown)
        btn.backgroundColor = .red
        btn.setTitleColor(.white, for: .normal)
        btn.setTitle("Display Alert", for: .normal)
        btn.isEnabled = true
        
        return btn
    }()
    
    /*
     Camera button.
     */
    var cameraButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.clipsToBounds = true
        btn.addTarget(self, action: #selector(openCamera), for: .touchUpInside)
        btn.backgroundColor = .gray
        btn.setTitleColor(.black, for: .normal)
        btn.setTitle("Open Camera", for: .normal)
        btn.isEnabled = true
        
        return btn
    }()
    
    /*
     Camera view.
     */
    var cameraImageView: UIImageView = {
       let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        
        return view
    }()
    
    /*
     Label for frontCameraRadioBtn.
     */
    var frontCameraTextLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .red
        lbl.font = UIFont(name: "Avenir Next Bold", size: 17)
        lbl.text = "Front"
        
        return lbl
    }()
    
    /*
     Label for rearCameraRadioBtn.
     */
    var rearCameraTextLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .blue
        lbl.font = UIFont(name: "Avenir Next Bold", size: 17)
        lbl.text = "Rear"

        return lbl
    }()
    
    
    // MARK : Methods

    /*
     Main function.
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "PAM-LAB.1"
        self.setupUIElements()
    }
    
    /*
     Setup main view, before adding any UI elements.
     */
    private func setupMainView() {
        self.view.backgroundColor = .white
    }
    
    /*
     Setup all UI elements with layout constraints and add them to main view.
     */
    private func setupUIElements() {
        self.setupBgView()
        
        self.setupTextBox(textBox: textBox, withPosition: CGPoint(x: self.view.center.x / 5, y: self.view.center.y / 10), withSize: CGSize(width: 300, height: 30))
        
        self.setupSearchBtn(btn: searchBtn, withSize: CGSize(width: 100, height: 30))
        
        self.setupNotificationButton(btn: notifyButton, withSize: CGSize(width: 200, height: 30))
        
        self.setupAlertButton(btn: alertButton, withSize: CGSize(width: 150, height: 30))
        
        self.setupCameraButton(btn: cameraButton, withSize: CGSize(width: 150, height: 30))
        self.setupCameraView(view: cameraImageView)
        
        self.setupRadioButton(button: frontCameraRadioBtn,
                              withPosition: CGPoint(x: -50, y: -25), withRadius: CGFloat(20),
                              withColor: UIColor.red)
        self.setupRadioButton(button: rearCameraRadioBtn,
                              withPosition: CGPoint(x: 180, y: -25), withRadius: CGFloat(20),
                              withColor: UIColor.blue)
        
        self.setupRearCameraRadioBtnTextLabel(label: rearCameraTextLabel)
        self.setupFrontCameraRadioBtnTextLabel(label: frontCameraTextLabel)
    }
    
    /*
     Setup radio button's layout constraints.
     */
    private func setupBgView() {
        self.view.addSubview(mainBackGround)
        
        mainBackGround.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        mainBackGround.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor).isActive = true
        mainBackGround.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        mainBackGround.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor).isActive = true
    }
    
    /*
     Setup radio button's layout constraints.
     */
    private func setupRadioButton(button btn: CustomRadioBtn, withPosition position: CGPoint, withRadius radius: CGFloat, withColor color: UIColor) {
        self.view.addSubview(btn)
        
        btn.topAnchor.constraint(equalTo: self.cameraButton.bottomAnchor, constant: position.y).isActive = true
        btn.leftAnchor.constraint(equalTo: self.cameraButton.leftAnchor, constant: position.x).isActive = true
        btn.widthAnchor.constraint(equalToConstant: radius).isActive = true
        btn.heightAnchor.constraint(equalToConstant: radius).isActive = true
        btn.gapSize = radius - 3.0
        btn.color = color
    }
    
    /*
     Setup text label.
     */
    private func setupTextBox(textBox: UITextField, withPosition position: CGPoint, withSize size: CGSize) {
        self.view.addSubview(textBox)
        
        textBox.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: position.y).isActive = true
        textBox.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: position.x).isActive = true
        textBox.widthAnchor.constraint(equalToConstant: size.width).isActive = true
        textBox.heightAnchor.constraint(equalToConstant: size.height).isActive = true
        textBox.borderStyle = .roundedRect
        textBox.layer.borderWidth = 1
        textBox.layer.borderColor = UIColor.init(red: 255/255, green: 153/255, blue: 204/255, alpha: 0.5).cgColor
        textBox.layer.cornerRadius = size.height / 3
        textBox.placeholder = "Search for..."
        textBox.keyboardAppearance = .dark
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(gestureRecognizer)
    }
    
    @objc private func hideKeyboard() {
        view.endEditing(true)
    }
    
    /*
     Setup search button.
     */
    private func setupSearchBtn(btn: UIButton, withSize size: CGSize) {
        self.view.addSubview(btn)
        
        btn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        btn.topAnchor.constraint(equalTo: textBox.topAnchor, constant: 50).isActive = true
        btn.widthAnchor.constraint(equalToConstant: size.width).isActive = true
        btn.heightAnchor.constraint(equalToConstant: size.height).isActive = true
        btn.layer.cornerRadius = size.height / 2
    }
    
    /*
     Setup search button.
     */
    private func setupNotificationButton(btn: UIButton, withSize size: CGSize) {
        self.view.addSubview(btn)
        
        btn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        btn.topAnchor.constraint(equalTo: searchBtn.topAnchor, constant: 50).isActive = true
        btn.widthAnchor.constraint(equalToConstant: size.width).isActive = true
        btn.heightAnchor.constraint(equalToConstant: size.height).isActive = true
        btn.layer.cornerRadius = size.height / 2
    }
    
    /*
     Setup search button.
     */
    private func setupAlertButton(btn: UIButton, withSize size: CGSize) {
        self.view.addSubview(btn)
        
        btn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        btn.topAnchor.constraint(equalTo: notifyButton.topAnchor, constant: 50).isActive = true
        btn.widthAnchor.constraint(equalToConstant: size.width).isActive = true
        btn.heightAnchor.constraint(equalToConstant: size.height).isActive = true
        btn.layer.cornerRadius = size.height / 2
    }
    
    /*
     Setup camera button.
     */
    private func setupCameraButton(btn: UIButton, withSize size: CGSize) {
        self.view.addSubview(btn)
        
        btn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        btn.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -10).isActive = true
        btn.widthAnchor.constraint(equalToConstant: size.width).isActive = true
        btn.heightAnchor.constraint(equalToConstant: size.height).isActive = true
        btn.layer.cornerRadius = size.height / 2
    }
    
    /*
     Setup camera view.
     */
    private func setupCameraView(view: UIView) {
        self.view.addSubview(view)
        
        view.topAnchor.constraint(equalTo: alertButton.bottomAnchor, constant: 20).isActive = true
        view.bottomAnchor.constraint(equalTo: cameraButton.topAnchor, constant: -20).isActive = true
        view.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: 50).isActive = true
        view.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: -50).isActive = true
        view.layer.cornerRadius = 30
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.init(red: 255/255, green: 153/255, blue: 204/255, alpha: 0.5).cgColor
    }
    
    /*
     Setup rear camera radio button text label.
     */
    private func setupRearCameraRadioBtnTextLabel(label: UILabel) {
        self.view.addSubview(label)
        
        label.bottomAnchor.constraint(equalTo: rearCameraRadioBtn.bottomAnchor, constant: 5).isActive = true
        label.leftAnchor.constraint(equalTo: rearCameraRadioBtn.leftAnchor, constant: 30).isActive = true
        label.widthAnchor.constraint(equalToConstant: 50).isActive = true
        label.heightAnchor.constraint(equalTo: cameraButton.heightAnchor).isActive = true
    }
    
    /*
    Setup front camera radio button text label.
    */
    private func setupFrontCameraRadioBtnTextLabel(label: UILabel) {
        self.view.addSubview(label)
        
        label.bottomAnchor.constraint(equalTo: frontCameraRadioBtn.bottomAnchor, constant: 5).isActive = true
        label.leftAnchor.constraint(equalTo: frontCameraRadioBtn.leftAnchor, constant: -50).isActive = true
        label.widthAnchor.constraint(equalToConstant: 50).isActive = true
        label.heightAnchor.constraint(equalTo: cameraButton.heightAnchor).isActive = true
    }
    
    /*
     Search for a result in safari.
     */
    @objc private func searchForResult() {
        let content = textBox.text ?? ""
        UIApplication.shared.open(URL(string: "https://www.google.com/search?q=\(content)")!)
    }
    
    /*
     Send local push notification.
     */
    @objc private func getPushNotification() {
        self.createPushNotification(withTitle: "PAM-LAB.1 Push Notification", withBody: "This notification will dissapear in 10 seconds.")
    }
    
    /*
     Create local push notification.
     */
    @objc private func createPushNotification(withTitle title: String, withBody body:String) {
        let notificationCenter = UNUserNotificationCenter.current()
        let notificationOptions: UNAuthorizationOptions = [.alert, .sound, .badge]
        
        notificationCenter.requestAuthorization(options: notificationOptions) { (authorizationStatus, error) in
            if (error != nil) {
                print("User don't want to receive push notifications.")
            }
            let content = UNMutableNotificationContent()
            content.title = title
            content.body = body
            content.badge = 1
            content.sound = .default
            
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
            let request = UNNotificationRequest(identifier: "1", content: content, trigger: trigger)
            
            notificationCenter.add(request, withCompletionHandler: { (error) in
                if (error != nil) {
                    print("Notification Error: ", error.debugDescription)
                }
            })
        }
    }
    
    /*
     Display an custom alert to user.
     */
    @objc private func displayAlert() {
        let alertController = UIAlertController(title: "Alert Button Pressed!", message: nil, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alertController.addAction(alertAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    /*
     Open camera.
     */
    @objc private func openCamera() {
        let authorized = self.checkCameraAccess()
        
        if (authorized) {
            self.selectCameraToOpen()
        }
    }
    
    /*
     Selecting a camera to display.
     */
    func selectCameraToOpen() {
        if (frontCameraRadioBtn.isOn) {
            self.runFrontCamera()
        }
        else if (rearCameraRadioBtn.isOn) {
            self.runRearCamera()
        }
        else {
            let alertController = UIAlertController(title: "No Camera Selected", message: "Please select a camera to display!", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            
            alertController.addAction(alertAction)
            
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    /*
     Check if camera is available.
     */
    private func checkCameraAccess() -> Bool {
        if !UIImagePickerController.isSourceTypeAvailable(.camera) {
            let alertController = UIAlertController.init(title: "No camera available", message: "Please allow app to use camera.", preferredStyle: .alert)
            let okAction = UIAlertAction.init(title: "OK", style: .default, handler: {(alert: UIAlertAction!) in
            })
            alertController.addAction(okAction)
            
            let topViewController = UIApplication.shared.keyWindow?.rootViewController
            
            topViewController?.present(alertController, animated: true, completion: nil)
            
            return false
        }
        
        return true
    }
    
    /*
     Taking a photo.
     */
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        picker.dismiss(animated: true, completion: nil)

        if let capturedImage = info[.originalImage] as? UIImage {
            cameraImageView.contentMode = .scaleAspectFill
            cameraImageView.image = capturedImage
        }
    }
    
    /*
     Handle cancel event.
     */
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    /*
     Open front camera.
     */
    func runFrontCamera() {
        if (UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera)){
            let picker = UIImagePickerController()
            picker.delegate = self as UIImagePickerControllerDelegate & UINavigationControllerDelegate
            picker.sourceType = UIImagePickerController.SourceType.camera
            picker.cameraDevice = UIImagePickerController.CameraDevice.front
            
            self.present(picker, animated: true, completion: nil)
        }
    }
    
    /*
     Open rear camera.
     */
    func runRearCamera() {
        if (UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera)){
            let picker = UIImagePickerController()
            picker.delegate = self as UIImagePickerControllerDelegate & UINavigationControllerDelegate
            picker.sourceType = UIImagePickerController.SourceType.camera
            picker.cameraDevice = UIImagePickerController.CameraDevice.rear
            
            self.present(picker, animated: true, completion: nil)
        }
    }
    
    /*
     Modify front camera radio button status.
     */
    @objc func changeFrontCameraRadioBtnStatus() {
        frontCameraRadioBtn.isOn = true
        rearCameraRadioBtn.isOn = false
    }
    
    /*
     Modify front camera radio button status.
     */
    @objc func changeRearCameraRadioBtnStatus() {
        rearCameraRadioBtn.isOn = true
        frontCameraRadioBtn.isOn = false
    }
}
