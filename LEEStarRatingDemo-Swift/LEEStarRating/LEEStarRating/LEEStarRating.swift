import UIKit

public class LEEStarRating: UIView {
    
    public struct Configuration {
        public enum Mode {
            case whole      // 整颗星星
            case half       // 半颗星星
            case unlimited  // 无限制
        }
        
        /// 星星个数
        public var count: Int = 5
        /// 间距 (默认 5.0)
        public var spacing: Double = 5.0
        /// 最大分数 (默认 5.0)
        public var maximumScore: Double = 5.0
        /// 最小分数 (默认 0.0)
        public var minimumScore: Double = 0.0
        /// 启用点击 (默认 false)
        public var touchEnabled: Bool = false
        /// 启用滑动 (默认 false)
        public var slideEnabled: Bool = false
        /// 评分类型 (默认 .whole)
        public var mode: Mode = .whole
    }
    
    /// 配置
    private let configuration: Configuration
    
    /// 已选中星星图片 (保证大小相同)
    public var checkedImage: UIImage? {
        didSet {
            checkedImagesView.subviews.forEach { view in
                (view as? UIImageView)?.image = checkedImage
            }
        }
    }
    /// 未选中星星图片 (保证大小相同)
    public var uncheckedImage: UIImage? {
        didSet {
            uncheckedImagesView.subviews.forEach { view in
                (view as? UIImageView)?.image = uncheckedImage
            }
        }
    }
    
    /// 当前分数 (默认 0.0)
    public private(set) var currentScore: Double = 0.0
    /// 当前分数变更回调
    public var currentScoreChange: ((Double) -> Void)?
    
    private lazy var checkedImagesView = UIView()
    private lazy var uncheckedImagesView = UIView()
    private var star: CGSize
    
    init(frame: CGRect, configuration: Configuration = .init()) {
        self.configuration = configuration
        let size = (frame.size.width - .init(configuration.count + 1) * configuration.spacing) / .init(configuration.count)
        self.star = .init(width: size, height: size)
        super.init(frame: frame)
        
        isUserInteractionEnabled = configuration.touchEnabled || configuration.slideEnabled
        
        if (configuration.touchEnabled) {
            let tap = UITapGestureRecognizer(target: self, action: #selector(tapAction))
            addGestureRecognizer(tap)
        }
        
        if (configuration.slideEnabled) {
            let pan = UIPanGestureRecognizer(target: self, action: #selector(panAction))
            addGestureRecognizer(pan)
        }
        
        uncheckedImagesView.clipsToBounds = true
        checkedImagesView.clipsToBounds = true
        
        addSubview(uncheckedImagesView)
        addSubview(checkedImagesView)
        
        for _ in 0 ..< configuration.count {
            checkedImagesView.addSubview(UIImageView(image: nil))
            uncheckedImagesView.addSubview(UIImageView(image: nil))
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        let size = (frame.size.width - .init(configuration.count + 1) * configuration.spacing) / .init(configuration.count)
        star = .init(width: size, height: size)
        
        uncheckedImagesView.frame = .init(x: 0, y: 0, width: frame.width, height: star.height)
        uncheckedImagesView.center = .init(x: frame.width * 0.5, y: frame.height * 0.5)
        
        checkedImagesView.frame = .init(
            x: 0,
            y: uncheckedImagesView.frame.origin.y,
            width: checkedImagesView.frame.width,
            height: uncheckedImagesView.frame.height
        )
        
        for i in 0 ..< configuration.count {
            let checkedImage = checkedImagesView.subviews[i]
            let uncheckedImage = uncheckedImagesView.subviews[i]
            let spacing = configuration.spacing
            let new = CGRect(
                x: i == 0 ? spacing : (star.width + spacing) * .init(i) + spacing,
                y: 0,
                width: star.width,
                height: star.height
            )
            checkedImage.frame = new
            uncheckedImage.frame = new
        }
    }
    
    @objc
    private func tapAction(_ sender: UITapGestureRecognizer) {
        let point = sender.location(in: self)
        update(ratio: ratio(at: point))
    }
    
    @objc
    private func panAction(_ sender: UIPanGestureRecognizer) {
        let point = sender.location(in: self)
        update(ratio: ratio(at: point))
    }
    
    /// 设置当前分数 不能超出最大最小分数范围
    /// - Parameter score: 分数
    public func set(current score: Double) {
        guard score >= configuration.minimumScore, score <= configuration.maximumScore else {
            return
        }
        update(ratio: (score - configuration.minimumScore) / (configuration.maximumScore - configuration.minimumScore))
    }
}

extension LEEStarRating {
    
    private func update(ratio value: Double) {
        guard value >= 0, value <= 1 else {
            return
        }
        
        let ratio: Double
        var width: Double
        
        switch configuration.mode {
        case .whole:
            let temp = (.init(configuration.count) * value).rounded(.up)
            ratio = temp
            width = star.width * temp + (configuration.spacing * temp.rounded())
            
        case .half:
            var temp = (.init(configuration.count) * value)
            let down = temp.rounded(.down)
            let diff = temp - down
            temp = diff > 0.5 ? down + 1.0 : (diff >= 0.001 ? down + 0.5 : down)
            ratio = temp
            width = star.width * temp + (configuration.spacing * temp.rounded())
            
        case .unlimited:
            let temp = (.init(configuration.count) * value)
            ratio = temp
            width = star.width * temp + (configuration.spacing * temp.rounded(.up))
        }
        
        width = max(min(width, frame.width), 0)
        
        checkedImagesView.frame.size.width = width
        
        let score = configuration.maximumScore - configuration.minimumScore
        var current = (ratio / .init(configuration.count)) * score + configuration.minimumScore
        current = max(min(current, configuration.maximumScore), configuration.minimumScore)
        if currentScore != current {
            currentScore = current
            currentScoreChange?(current)
        }
    }
    
    private func ratio(at point: CGPoint) -> Double {
        let spacing = configuration.spacing
        let ratio: Double
        
        if spacing > point.x {
            ratio = 0.0
            
        } else if frame.width - spacing < point.x {
            ratio = 1.0
            
        } else {
            /* 比例转换
             *
             * 当前点击位置在当前视图宽度中的比例 转换为 当前点击星星位置在全部星星宽度中的比例
             * 当前点击位置去除其中的间距宽度等于星星的宽度 point.x - 间距 = 所选中的星星宽度
             * 所选中的星星宽度 / 所有星星宽度 = 当前选中的比例
             */
            
            let single = spacing + star.width
            let temp = point.x / single
            let count = temp.rounded(.down)
            var added = single * (temp - count)
            added = added >= spacing ? spacing : added
            let x = point.x - spacing * count - added
            ratio = x / (star.width * .init(configuration.count))
        }
        
        // 解决浮点精度丢失问题
        guard let decimal = Decimal(string: .init(format: "%0.4lf", ratio)) else { return ratio }
        return NSDecimalNumber(decimal: decimal).doubleValue
    }
}
