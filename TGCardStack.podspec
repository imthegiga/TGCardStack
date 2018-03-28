Pod::Spec.new do |s|
  s.name             = 'TGCardStack'
  s.version          = '0.1.0'
  s.summary          = 'Library which shows UICollectionViewCells as Stack of the Cards.'
  
  s.description      = 'Use custom layout for UICollectionView, it will keep all cells stacked but last at the bottom.'
 
  s.homepage         = 'https://github.com/imthegiga/TGCardStack'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Abhishek Salokhe' => 'abhisheksalokhe@gmail.com' }
  s.source           = { :git => 'https://github.com/imthegiga/TGCardStack.git', :tag => s.version.to_s }
 
  s.ios.deployment_target = '8.0'
  s.source_files = 'TGCardStack/Library/*.swift'
 
end
