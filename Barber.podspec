Pod::Spec.new do |s|
  s.name             = 'Barber'
  s.version          = '0.1.0'
  s.summary          = 'Barber'
  s.description      = <<-DESC
                        Barber For iPhone X
                       DESC
  s.homepage         = 'https://github.com/laichanwai/Barber'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'laizw' => 'i@laizw.cn' }
  s.source           = { :git => 'https://github.com/laichanwai/Barber.git', :tag => s.version }
  s.ios.deployment_target = '8.0'
  s.source_files = 'Barber/**/*.{h,m}'
end
