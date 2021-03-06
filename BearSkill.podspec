#
# Be sure to run `pod lib lint BearSkill.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "BearSkill"
  s.version          = "0.3.0"
  s.summary          = "BearSkill contain some methods used frequently in project."

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!  
  s.description      = <<-DESC
BearSkill contain some methods used frequently in project. And many other methods about layout.
                       DESC

  s.homepage         = "https://github.com/ButtFly/BearSkill"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Bear" => "648070256@qq.com" }
  s.source           = { :git => "https://github.com/ButtFly/BearSkill.git", :tag => s.version.to_s }
  s.resource         = 'Pod/Resource/*'
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.platform     = :ios, '8.1'
  s.requires_arc = true
  s.resource = 'Pod/Sources/*'

#s.source_files = 'Pod/Classes/**/*'

    #UIAndExtend
    s.subspec 'UIAndExtend' do |uiAndExtend|
        uiAndExtend.dependency 'MBProgressHUD'
        uiAndExtend.dependency 'UIImage-Helpers',          '~> 0.0.2'
        uiAndExtend.dependency 'SDWebImage'
        uiAndExtend.source_files = 'Pod/UIAndExtend/**/*'
    end

    #Layout
    s.subspec 'Layout' do |layout|
        layout.source_files = 'Pod/Layout/*'
    end

    #Constants
    s.subspec 'Constants' do |constants|
        constants.dependency 'MBProgressHUD'
        constants.source_files = 'Pod/Constants/*'
    end

    #AttributeString
    s.subspec 'AttributeString' do |attributeString|
        attributeString.source_files = 'Pod/AttributeString/*'
    end

    #BearDefines
    s.subspec 'BearDefines' do |bearDefines|
        bearDefines.source_files = 'Pod/BearDefines/*'
    end

    #Tools
    s.subspec 'Tools' do |tools|
        tools.source_files = 'Pod/Tools/**/*'
        tools.dependency 'Reachability'
    end

    #Request
    s.subspec 'Request' do |request|
        request.dependency 'GBDeviceInfo'
        request.dependency 'AFNetworking'
        request.source_files = 'Pod/Request/**/*'
        request.frameworks = 'CFNetWork'

        #这是需要添加mrc标识的文件，为相对路径
        non_arc_files = 'Pod/Request/BearBaseRequestManager/BearProxyManager.m'
        #在工程中首先排除一下
        request.exclude_files = non_arc_files
        #一下就是子设置，为需要添加mrc标识的文件进行设置
        request.subspec 'no-arc' do |sp|
            sp.source_files = non_arc_files
            sp.requires_arc = false
        end
    end

end
