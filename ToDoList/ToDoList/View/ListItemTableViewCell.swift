import UIKit

class ListItemTableViewCell: UITableViewCell {
    
    static let identifier = "ListItemTableViewCell"
    
    lazy var name: HaloLabel = {
        let label = HaloLabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.numberOfLines = 1
        label.minimumScaleFactor = 0.2
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    lazy var descriptionLable: HaloLabel = {
        let label = HaloLabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        label.minimumScaleFactor = 0.2
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    lazy var checkButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        button.layer.cornerRadius = 15
        button.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        button.layer.borderWidth = 1
        button.backgroundColor = .white
        return button
    }()
    
    lazy var line: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .gray
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = .white
        
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        self.contentView.addSubview(name)
        self.contentView.addSubview(descriptionLable)
        self.contentView.addSubview(checkButton)
        self.contentView.addSubview(line)
        
        NSLayoutConstraint.activate([
            name.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: AutoLayout.scaleHeight(height: 10)),
            name.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: AutoLayout.scaleWidth(width: 12)),
            name.trailingAnchor.constraint(equalTo: self.checkButton.leadingAnchor, constant: -AutoLayout.scaleWidth(width: 12)),
            name.bottomAnchor.constraint(equalTo: self.descriptionLable.topAnchor),
            name.heightAnchor.constraint(equalToConstant: AutoLayout.scaleHeight(height: 20))
        ])
        
        NSLayoutConstraint.activate([
            descriptionLable.leadingAnchor.constraint(equalTo: self.name.leadingAnchor),
            descriptionLable.trailingAnchor.constraint(equalTo: self.name.trailingAnchor),
            descriptionLable.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -AutoLayout.scaleHeight(height: 12))
        ])
        
        NSLayoutConstraint.activate([
            checkButton.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -AutoLayout.scaleHeight(height: 15)),
            checkButton.topAnchor.constraint(equalTo: self.name.topAnchor),
            checkButton.heightAnchor.constraint(equalToConstant: AutoLayout.scaleHeight(height: 30)),
            checkButton.widthAnchor.constraint(equalTo: checkButton.heightAnchor)
        ])
        
        NSLayoutConstraint.activate([
            line.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            line.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            line.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            line.heightAnchor.constraint(equalToConstant: 1)
        ])
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setData(data: TaskDetail) {
        self.name.text = data.getTitle()
        self.descriptionLable.text = data.getDes()
    }

}
