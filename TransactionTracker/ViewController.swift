//
//  ViewController.swift
//  TransactionTracker
//
//  Created by administrator on 8/11/19.
//  Copyright © 2019 mdoyle1. All rights reserved.

//This link is how to use scrolling rows of collection views
//https://github.com/ashfurrow/Collection-View-in-a-Table-View-Cell

//Using Attributed text to format strings
//https://stackoverflow.com/questions/36467985/how-to-append-attributed-text-string-with-attributed-string-in-swift

//Creating the switches 
//https://www.youtube.com/watch?v=hVpWKWQndew

//UISearchcontroller
//https://www.raywenderlich.com/472-uisearchcontroller-tutorial-getting-started

//Using the filter
//https://medium.com/@abhimuralidharan/higher-order-functions-in-swift-filter-map-reduce-flatmap-1837646a63e8

import UIKit

var controller = ViewController()
var parse = ParseMethods()
var csv = CSVaccessability()
var globalPathToCsv:URL!
var csvArray = [[String:String]]()
var dictionaryItems=[String:String]()
var accountTransactions = [[String:String]]()
var tableViewArray = [[String:String]]()
var pickerData: [String] = [String]()
var account:String!
var currentSelection:String!
var date:String!
var descript:String!
var amount:String!
var accountType:String!
var titleString:NSAttributedString!
var transObjects = [NSAttributedString]()
var currentRow:Int!
var tableItems = [Rows]()
var filtered = [String:String]()



class ViewController: UIViewController, UIDocumentPickerDelegate {
    
     let searchController = UISearchController(searchResultsController: nil)
     var detailViewController: DetailViewController? = nil
    
    
    func searchBarIsEmpty() -> Bool {
        // Returns true if the text is empty or nil
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    func isFiltering() -> Bool {
        return searchController.isActive && !searchBarIsEmpty()
    }
    
    // Create an container for the filtered items.
    // The function below is called each time somthing is entered in the search box.
    // Each time a charecter is added to the search field the container is emptied and filled with new matches.
    //
    var filterItems = [[String:String]]()
    var container = [[String:String]]()
    
//    func filterContentForSearchText(_ searchText: String, scope: String = "All") {
//        container.removeAll()
//            for header in headers {
//                filterItems=tableViewArray.filter { (value) -> Bool in return (value[header]!.lowercased().contains(searchText.lowercased()))}
//                print(filterItems.count)
//                for f in 0..<filterItems.count{
//                container.append(filterItems[f])
//                }
//        }
//    //print(container)
//    //print(container.count)
//
//        tableView.reloadData()
//    }
    
    func filterContentForSearchText(_ searchText: String, scope: String = "All") {
        container.removeAll()
        for h in 0..<headers.count{
            if feedModelArray[h].headerPicker == true {
            filterItems=tableViewArray.filter { (value) -> Bool in return (value[headers[h]]!.lowercased().contains(searchText.lowercased()))}
            print(filterItems.count)
            for f in 0..<filterItems.count{
                container.append(filterItems[f])
            }
            }}
        //print(container)
        //print(container.count)
        
        tableView.reloadData()
    }
    
    func getCurrentRow(rowNumber:Int)->Int{
        currentRow = rowNumber
        print(currentRow!)
        return currentRow
    }
 
    @IBAction func listItems(_ sender: Any) {
        let listItemsController = (storyboard?.instantiateViewController(withIdentifier: "listController"))!
        self.present(listItemsController, animated:true, completion:nil)
    }
    
    @IBAction func settingsButton(_ sender: Any) {
        if headers != nil{
            let segwayViewController = (storyboard?.instantiateViewController(withIdentifier: "settings"))!
            self.present(segwayViewController, animated:true, completion:nil)}
        else {
            let alert = UIAlertController(title: "Import CSV First!", message: "You can toggle which headers you would like to view in the main table after importing a CSV.  Please import a CSV.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Import CSV", style: .default, handler: { action in self.importCSVfunction() }))
            self.present(alert, animated: true)
        }
    }
    
    func importCSVfunction(){
        let documentPicker: UIDocumentPickerViewController = UIDocumentPickerViewController(documentTypes: ["public.item"], in: UIDocumentPickerMode.import)
        documentPicker.delegate = self
        documentPicker.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        self.present(documentPicker, animated: true, completion: nil)
        print(csvArray)
        
    }
    
    func selectHeaders(){
        let segwayViewController = (storyboard?.instantiateViewController(withIdentifier: "HeaderVC"))!
        self.present(segwayViewController, animated:true, completion:nil)
    }
    
    
    let model: [[UIColor]] = generateRandomData()
    var storedOffsets = [Int: CGFloat]()
    @IBOutlet weak var customCell: UITableViewCell!
    @IBOutlet weak var itemsToSort: UIPickerView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
   

    
    func loadCSV(){
        csv.csvToList()
        tableViewArray = csvArray
        tableView.reloadData()
    }
    
    @IBAction func importCSV(_ sender: UIButton) {
importCSVfunction()
        }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup the Search Controller
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Items"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        registerForPreviewing(with: self, sourceView: tableView)
        tableView.delegate = self
        tableView.dataSource = self
//        self.itemsToSort.delegate = self
//        self.itemsToSort.dataSource = self
//        pickerData = headers ?? ["Import CSV to view headers."]
        if let splitViewController = splitViewController {
            let controllers = splitViewController.viewControllers
            detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
    }
    
   
    //Call functions to run after document picker runs.
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentAt url: URL) {
        print("URL: \(url)")
        globalPathToCsv = url
        loadCSV()
        HeadersView().fillDataArray()
    }
}


//Table View
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering() {
            return container.count
        }
        return tableViewArray.count
    }
    
    
    //Modify this function to only take the set items from HeadersSelections
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let cellAdd = NSMutableAttributedString()
        for h in 0..<headers.count{
            if feedModelArray[h].headerPicker == true {
                if isFiltering() {
                    if container[indexPath.row][headers[h]] != nil  {
                        cellAdd.append(NSAttributedString(attributedString: makeAttributedString(title: headers[h], subtitle: container[indexPath.row][headers[h]]!)))}
                } else {
                    cellAdd.append(NSAttributedString(attributedString: makeAttributedString(title: headers[h], subtitle: tableViewArray[indexPath.row][headers[h]]!)))
                }
            }
        }
        
        cell.textLabel?.attributedText = cellAdd
        cell.textLabel?.adjustsFontSizeToFitWidth = true
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        currentRow = indexPath.row
        let vc = detailViewController(for: indexPath.row)
        navigationController?.pushViewController(vc, animated: true)
        let segwayViewController = (storyboard?.instantiateViewController(withIdentifier: "Detail"))!
        self.present(segwayViewController, animated:true, completion:nil)
    }
    
    private func tableView(tableView: UITableView,
                           willDisplayCell cell: UITableViewCell,
                           forRowAtIndexPath indexPath: NSIndexPath) {
        
        guard let tableViewCell = cell as? TableViewCell else { return }
        
        tableViewCell.setCollectionViewDataSourceDelegate(dataSourceDelegate: self as! UICollectionViewDataSource & UICollectionViewDelegate, forRow: indexPath.row)
    }
    
}


//PEEK AND POP
extension ViewController: UIViewControllerPreviewingDelegate {
    
    public func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        if let indexPath = tableView.indexPathForRow(at: location) {
            date = tableViewArray[indexPath.row]["Date"]
            descript = tableViewArray[indexPath.row]["Description"]
            amount = tableViewArray[indexPath.row]["Amount"]
            accountType = tableViewArray[indexPath.row]["Account Type"]
            
            previewingContext.sourceRect = tableView.rectForRow(at: indexPath)
            return detailViewController(for: indexPath.row)
        }
        
        return nil
    }
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {
        navigationController?.pushViewController(viewControllerToCommit, animated: false)
        
    }
    
    
    func detailViewController(for index: Int) -> DetailViewController {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController else {
            fatalError("Couldn't load detail view controller")
        }
        return vc
    }
    
}
//SEARCH CONTROLLER
extension ViewController: UISearchResultsUpdating {
    // MARK: - UISearchResultsUpdating Delegate
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
}



//PICKER VIEW
extension ViewController:  UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    // Capture the picker view selection
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // This method is triggered whenever the user makes a change to the picker selection.
        // The parameter named row and component represents what was selected.
        currentSelection = pickerData[row]
        
    }
    
}
//    @IBAction func updateView(_ sender: Any) {
//        if currentSelection == "Kelly's Transactions"{
//            account = ""
//        parse.parseTransactions(Array: csvArray)
//        parse.parseAccount()
//        }
//        let totalSections = tableView.numberOfSections
//        for section in 0..<totalSections{
//            let totalNumberOfRows = tableView.numberOfRows(inSection: section)
//
//            for row in 0..<totalNumberOfRows{
//                let cell = tableView.cellForRow(at: IndexPath(row: row, section: section))
//                let label = cell?.textLabel!.text
//                _ = label?.suffix(5)
//
//            }
//        }
//
//      tableView.reloadData()
//    }
