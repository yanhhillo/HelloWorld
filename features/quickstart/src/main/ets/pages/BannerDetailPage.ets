import { webview } from '@kit.ArkWeb';
import { bannerClass } from '../model/bannerClass'

@Preview
@ComponentV2
export struct BannerDetailPage {
  @Consumer('quickStartPathStack') quickStartPathStack: NavPathStack = new NavPathStack();
  @Param banner: bannerClass = new bannerClass("", "", "");
  private webviewController: webview.WebviewController = new webview.WebviewController();

  build() {
    NavDestination() {
      Scroll() {
        Column() {
          // Text(this.banner.imageSrc)
          Web({ src: this.banner?.url, controller: this.webviewController })
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