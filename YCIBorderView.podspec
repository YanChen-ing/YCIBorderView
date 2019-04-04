Pod::Spec.new do |s|
    s.name             = 'YCIBorderView'
    s.version          = '0.1.0'
    s.summary          = '提供自定义边框样式视图'
    
    s.description      = <<-DESC
    提供自定义边框样式视图
    支持实线，短划线（虚线）
    DESC
    
    s.homepage         = 'https://github.com/YanChen-ing/YCIBorderView'
    
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'yanchen' => 'workforyc@163.com' }
    
    s.ios.deployment_target = '8.0'

    s.source           = { :git => "https://github.com/YanChen-ing/YCIBorderView.git", :tag => s.version }
    
    s.source_files = 'YCIBorderView/Classes/*'
    s.public_header_files = 'YCIBorderView/Classes/*.h'
    
end
