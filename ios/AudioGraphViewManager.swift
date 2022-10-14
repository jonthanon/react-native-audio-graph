@objc(AudioGraphViewManager)
class AudioGraphViewManager: RCTViewManager {

  override func view() -> (AudioGraphView) {
    return AudioGraphView()
  }

  @objc override static func requiresMainQueueSetup() -> Bool {
    return false
  }
}

class AudioGraphView : UIView, AXChart {

  @objc var color: String = "" {
    didSet {
      self.backgroundColor = hexStringToUIColor(hexColor: color)
    }
  }

  func hexStringToUIColor(hexColor: String) -> UIColor {
    let stringScanner = Scanner(string: hexColor)

    if(hexColor.hasPrefix("#")) {
      stringScanner.scanLocation = 1
    }
    var color: UInt32 = 0
    stringScanner.scanHexInt32(&color)

    let r = CGFloat(Int(color >> 16) & 0x000000FF)
    let g = CGFloat(Int(color >> 8) & 0x000000FF)
    let b = CGFloat(Int(color) & 0x000000FF)

    return UIColor(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: 1)
  }
    
    // AXChart implementation
    @objc var title: String = ""
    @objc var summary: String = ""
    @objc var xTitle: String = ""
    @objc var xValues: [Double] = []
    @objc var yTitle: String = ""
    @objc var yValues: [Double] = []
    
    @available(iOS 15.0, *)
    var accessibilityChartDescriptor: AXChartDescriptor? {
      get {
        AXChartDescriptor(
          title: self.title,
          summary: self.summary,
          xAxis: self.xAxis,
          yAxis: self.yAxis,
          series: series
        )
      }
      set {}
    }
    
    @available(iOS 15.0, *)
    private var xAxis: AXNumericDataAxisDescriptor {
      let minValue = xValues.min() ?? 0
      let maxValue = xValues.max() ?? 0
      // 1
      return AXNumericDataAxisDescriptor(
        title: self.xTitle,
        // 2
        range: (minValue...maxValue),
        // 3
        gridlinePositions: [],
        // 4
        valueDescriptionProvider: { (value: Double) -> String in
          "\(value)"
        }
      )
    }
    
    @available(iOS 15.0, *)
    private var yAxis: AXNumericDataAxisDescriptor {
      let minValue = yValues.min() ?? 0
      let maxValue = yValues.max() ?? 0
      return AXNumericDataAxisDescriptor(
        title: self.yTitle,
        range: (minValue...maxValue),
        gridlinePositions: [],
        valueDescriptionProvider: { (value: Double) -> String in
          "\(value)"
        }
      )
    }
    
    
    @available(iOS 15.0, *)
    private var series: [AXDataSeriesDescriptor] {
      // 1
  //    let dataPointsSeries = self.yValues.enumerated().map { index, yValue in
  //      AXDataPoint(x: Double(index), y: Double(yValue))
  //    }
      
      let dataPointsSeries = Array(zip(self.xValues, self.yValues)).map { value in
        AXDataPoint(x: value.0, y: value.1)
      }
      
      // 2
      return [
        AXDataSeriesDescriptor(
          name: "Data Series 1",
          isContinuous: true,
          dataPoints: dataPointsSeries
        )
      ]
    }
}
