/*-----------------------------------------------------
    编写前端页面
-----------------------------------------------------*/

HTML：
在 /App/www/index.html 里面构建应用的界面。

JavaScript：
在 /App/www/js/index.js 编写界面运行逻辑及界面与原生代码的桥接工作。
或可用 'ionic' 框架等实现该工作。https://ionicframework.com

终端进入工程根目录 /App 执行 $cordova build 对前端代码进行构建，框架会自动把代码编译到各个平台中。
$cordova build  全平台构建
$cordova build ios 单独为iOS构建
$cordova build android 单独为Android构建
...



/*-----------------------------------------------------
    注册 AppAdapter
 -----------------------------------------------------*/

使用 'AppAdapter' '做 'JavaScript' 与 'Android' / 'iOS' 的交互接口

Android 端：
在 /App/platforms/android/android.json 文件中加入以下文字以注册 'AppAdapter'。
添加于节点 "res/xml/config.xml": {} 中，如已存在其它文件的注册，在后面续加，以逗号(,)分割开。

"parents": {
    "/*": [
        {
            "xml": "<feature name=\"AppAdapter\"><param name=\"android-package\" value=\"com.fay.plugins.AppAdapter\" /></feature>",
            "count": 1
    	}
    ]
}

iOS 端：
在 /App/platforms/ios/ios.json 文件中加入以下文字以注册 'AppAdapter'。
添加于节点 "res/xml/config.xml": {} 中，如已存在其它文件的注册，在后面续加，以逗号(,)分割开。

"parents": {
    "/*": [
        {
            "xml": "<feature name=\"AppAdapter\"><param name=\"ios-package\" value=\"AppAdapter\" /></feature>",
            "count": 1
        }
    ]
}


Android 端：
如果运行编译命令 $cordova build / $cordova build android 或者添加插件命令 $cordova plugin add xxx ('xxx' 代表插件名)时出现错误提示 Error: spawn EACCES ，表示 cordova 没有获得 build / android build 的权限，执行 $sudo chmod -R a+rwx App/ ('App/' 表示该工程的根目录) / $sudo chmod -R a+rwx platforms/android/ 来获得权限。



