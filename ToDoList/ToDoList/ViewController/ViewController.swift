import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    lazy var searchBar: UISearchBar = {
        let view = UISearchBar()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var todoList: UITableView = {
        let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.delegate = self
        view.dataSource = self
        view.separatorColor = .clear
        view.register(ListItemTableViewCell.self, forCellReuseIdentifier: ListItemTableViewCell.identifier)
        return view
    }()
    
    lazy var addWork: UIButton = {
        let button = UIButton()
        button.setTitle("Add", for: .normal)
        button.backgroundColor = .systemGray
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(addTodoWork), for: .touchUpInside)
        button.layer.cornerRadius = 20
        return button
    }()
    
    //ListData
    var todoViewModel = TodoViewModel()
    var todoArr = [TaskDetail]()
    var resultsSearch = [TaskDetail]()
    var disposeBag = DisposeBag()

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Setup view and fetch data
        setupView()
        fetchData()
        
        // TODO: RxSwift with searchBar
        searchBar
            .rx.text // Observable property thanks to RxCocoa
            .orEmpty // Make it non-optional
            .debounce(.milliseconds(500), scheduler: MainScheduler.instance)
            .distinctUntilChanged()
            .subscribe(onNext: { [unowned self] query in // Here we will be notified of every new value
                self.resultsSearch = self.todoArr.filter { $0.getTitle().hasPrefix(query) }  // We now do our "Request" to find ToDoDetails based on title
                self.todoList.reloadData() // And reload table view data.
                
                self.showToast(message: "Searching with key: \(query)", font: UIFont.systemFont(ofSize: 10))
            })
            .disposed(by: disposeBag)
    }
    
    func fetchData() {
        self.todoArr = todoViewModel.getTodoList()
        self.todoList.reloadData()
    }
    
    @objc func addTodoWork() {
        showInputDialog(title: "Add Work",
                        subtitle: "Please enter the new work",
                        actionTitle: "Add",
                        cancelTitle: "Cancel",
                        inputTitlePlaceholder: "Title",
                        inputDescriptionPlaceholder: "Description...",
                        actionHandler:
                                { (input:String?) in
                                    print("The new number is \(input ?? "")")
                                })
    }
}
