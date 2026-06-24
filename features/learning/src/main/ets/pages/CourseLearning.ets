import { webview } from '@kit.ArkWeb';

@Component
export struct CourseLearning {
  private webviewController: webview.WebviewController = new webview.WebviewController();

  build() {
    Column() {
      Web({ src: $rawfile('course_learning/index.html'), controller: this.webviewController })
        .domStorageAccess(true) // 开启文档对象模型存储接口权限
      // Web({ src: 'http://www.huawei.com', controller: this.webviewController })
      //   .domStorageAccess(true) // 开启文档对象模型存储接口权限
    }
  }
}