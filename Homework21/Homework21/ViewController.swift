import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var showMessageButton: UIButton!
    @IBOutlet weak var labelText: UILabel!
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var uploadMessageButton: UIButton!
    
    var cityArray = ["Minsk", "Moscow", "NY", "Vancouver", "Hanoi", "Boston", "Toronto", "Mogilev"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        picker.delegate = self
        picker.dataSource = self
    }
    
    func configure() {
        showMessageButton.layer.cornerRadius = 10
        uploadMessageButton.layer.cornerRadius = 10
    }
    
    func classicAlert() {
        let alert = UIAlertController(title: "Important message", message: "Thank you for choosing our message!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: {
            _ in
            self.labelText.text = "Thank you!"
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {
            _ in
            self.labelText.text = ""
        }))
        
        self.present(alert, animated: true)
    }
    
    @IBAction func showMessageButtonPressed(_ sender: UIButton) {
        classicAlert()
    }
    
    
    @IBAction func uploadMessageButtonPressed(_ sender: UIButton) {
        pickPhotoButtonTapped()
    }
    
    func pickPhotoButtonTapped() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        
        present(imagePicker, animated: true, completion: nil)
    }
    
}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return cityArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let test = cityArray[row]
        return test
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        labelText.text = "\(cityArray[row])"
    }
    
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[.editedImage] as? UIImage {
            imageView.image = pickedImage
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}
