import { banner } from '../view/banner'
import { enablementView } from '../view/enablementView'
import { tutorialView } from '../view/tutorialView'

// 首页
@Entry
@ComponentV2
struct Index {
  @Local msg: string = 'Hello'

  build() {
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
}






