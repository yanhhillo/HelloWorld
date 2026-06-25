import { articleClass } from '../model/articleClass'
import { webview } from '@kit.ArkWeb';

@Preview
@ComponentV2
export struct ArticleDetailPage {
  @Consumer('quickStartPathStack') quickStartPathStack: NavPathStack = new NavPathStack();
  @Param article: articleClass = new articleClass("", "", "", "", "");
  @Param title: string = "";
  @Local showTitle: string = "";

  // new articleClass('1', 'app.media.tutorial_pic1', 'Step1 环境的搭建',
  //   '本篇教程实现了快速入门——一个用于了解和学习HarmonyOS的应用程序。',
  //   'https://developer.huawei.com/consumer/cn/forum/home?all=1');

  aboutToAppear(): void {
    const param = this.quickStartPathStack.getParamByName('ArticleDetailPage')[0] as articleClass;
    this.showTitle = param?.title ?? '';
  }

  build() {
    NavDestination() {
      Scroll() {
        Column() {
          Row() {
            Image($r('app.media.ic_back'))
              .width(40)
              .height(40)
              .margin({
                right: 10
              })
              .onClick(() => {
                this.quickStartPathStack.pop()
              })
            Text(this.showTitle)
              .width('calc(100% - 50vp)')
              .fontSize(26)
              .fontWeight(FontWeight.Bold)
              .textAlign(TextAlign.Start)
              .maxLines(1)
              .textOverflow({ overflow: TextOverflow.Ellipsis })
          }
          .width('100%')
          .height(56)

          WebComponent({ articleDetail: this.article })
        }
        .width('100%')
        .padding({ left: 16, right: 16 })
      }
      .width('100%')
      .align(Alignment.TopStart)
      .scrollBar(BarState.Off)
      .constraintSize({ minHeight: '100%' })
      .edgeEffect(EdgeEffect.Spring)
      .scrollable(ScrollDirection.Vertical)
    }
    .hideTitleBar(true)
    .onBackPressed(() => {
      this.quickStartPathStack.pop();
      return true;
    })
  }
}

@Preview
@ComponentV2
struct WebComponent {
  @Param articleDetail: articleClass = new articleClass("", "", "", "", "");
  private webviewController: webview.WebviewController = new webview.WebviewController();

  build() {
    Column() {
      Web({ src: this.articleDetail?.webUrl, controller: this.webviewController })
        .darkMode(WebDarkMode.Auto)
        .domStorageAccess(true)
        .zoomAccess(true)
        .fileAccess(true)
        .mixedMode(MixedMode.All)
        .cacheMode(CacheMode.None)
        .javaScriptAccess(true)
        .width('100%')
        .layoutWeight(1)
    }
  }
}