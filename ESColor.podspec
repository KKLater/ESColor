Pod::Spec.new do |s|

  s.name         = "ESColor"
  s.version      = "0.0.1"
  s.summary      = "Extensions for Color."

  s.description  = <<-DESC
                    Extensions for Color with Swift for mac、ios、watchos、tvos.
                   DESC

  s.homepage     = "https://github.com/KKLater/ESColor"
  # s.screenshots  = ""

  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.authors      = { "KKLater" => "lshxin89@126.com" }

  s.swift_version = "5.0"
  s.swift_versions = ['5.0']

  s.ios.deployment_target = "8.0"
  s.tvos.deployment_target = "10.0"
  s.osx.deployment_target = "10.10"
  s.watchos.deployment_target = "3.0"

  s.source       = { :git => "https://github.com/KKLater/ESColor.git", :tag => s.version }

  s.source_files  = ["Sources/**/*.swift", "Sources/ESColor.h"]
  s.requires_arc = true
end
