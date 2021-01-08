Pod::Spec.new do |s|
  s.name         = "AFoundation"
  s.version      = "0.1.3"
  s.summary      = "AFoundation is an advanced extension for Foundation framework."
  s.description  = "AFoundation is an advanced extension for Foundation framework. Description."
  s.homepage     = "https://github.com/ihormyroniuk/AFoundation"
  s.license      = "MIT"
  s.author       = { "Ihor Myroniuk" => "ihormyroniuk@gmail.com" }
  s.platform     = :ios, "10.0"
  s.source       = { :git => "https://github.com/ihormyroniuk/AFoundation.git", :tag => "0.1.3" }
  s.source_files = "AFoundation/**/*.{swift}"
  s.swift_version = "4.2"
end
