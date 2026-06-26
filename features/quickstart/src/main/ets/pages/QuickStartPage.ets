import { articleClass } from '../model/articleClass'
import { bannerClass } from '../model/bannerClass'
import { banner } from '../view/banner'
import { enablementView } from '../view/enablementView'
import { tutorialView } from '../view/tutorialView'
import { ArticleDetailPage } from './ArticleDetailPage';
import { BannerDetailPage } from './BannerDetailPage';

@ComponentV2
export struct QuickStartPage {
  @Provider('quickStartPathStack') quickStartPathStack: NavPathStack = new NavPathStack();
  @Local msg: string = 'Hello'

  @Builder
  quickStartRouter(name: string, param?: Object) {
    if (name == "ArticleDetailPage") {
      ArticleDetailPage({
        article: param as articleClass,
        title: (param as articleClass).title
      })
    } else if (name == "BannerDetailPage") {
      BannerDetailPage({
        banner: param as bannerClass
      })
    }
  }

  build() {
    Navigation(this.quickStartPathStack) {
      Column() {
        Text(this.msg)
          .width('100%')
          .padding({ left: 16 })
          .fontSize(26)
          .fontWeight(FontWeight.Bold)
          .textAlign(TextAlign.Start)
        Scroll() {
          Column() {
            banner()
            enablementView()
            tutorialView()
          }
        }
        .layoutWeight(1)
        .align(Alignment.TopStart)
        .scrollBar(BarState.Off) // 关闭滚动时的滚动条显示
      }
      .width('100%')
      .background('#f1f3f5')
    }
    .hideTitleBar(true)
    // .mode(NavigationMode.Auto) // 自适应模式
    .mode(NavigationMode.Stack) // 单页堆叠模式
    .navDestination(this.quickStartRouter)
  }
}






