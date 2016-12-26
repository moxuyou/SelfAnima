
Pod::Spec.new do |s|

  s.name         = "SelfAnima"
  s.version      = “1.0.2”
  s.summary      = “The selfAnima by Moxuyou.”
  s.license = 'MIT'
  s.description  = <<-DESC
                   DESC

  s.homepage = 'https://github.com/moxuyou/SelfAnima'
  s.license      = { type: 'MIT', file: 'LICENSE' }

  s.author             = { "moxuyou" => "11284110@qq.com" }

  s.platform     = :ios, "5.0"

  s.source       = { :git => "https://github.com/moxuyou/SelfAnima.git", :tag => “1.0.2” }
  s.requires_arc = true
  s.source_files  = "SelfAnima", “*.{h,m}”

end
