source 'https://github.com/CocoaPods/Specs.git'    #官方仓库的地址
source 'https://github.com/yaochenfeng/specs'
platform :ios, '8.0'
inhibit_all_warnings!
def core
    pod 'CocoaLumberjack'       #日志
    pod 'Bugly'                 #bug调试
    pod 'UMCAnalytics'          #统计
    pod 'SAMKeychain'           #keychain
    pod 'IQKeyboardManager'     #键盘
    pod 'MJRefresh'             #刷新
    pod 'FLEX', :configurations => ['Debug']
    pod 'BeeKit'                #核心bean、router管理
    pod 'MBProgressHUD'
end

def swift_pods
  pod 'SnapKit'
  pod 'RxSwift'
  pod 'RxCocoa'
  pod 'Moya'
  pod 'HandyJSON', '~> 5.0.0-beta.1'
  pod 'RxDataSources'
end
def weex_pods
    #视图布局
#    pod 'WeexPluginJyc', :configurations => ['Debug'], :git => 'https://github.com/jyc9/weex-jyc.git', :branch => 'develop'
end


target "beeApp" do
    core
    swift_pods
    weex_pods
   target "beeAppTests" do
       inherit! :search_paths
   end
end
