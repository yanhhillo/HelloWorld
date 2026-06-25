import { QuickStartPage } from 'quickstart';
import { CourseLearning } from 'learning';
import { KnowledgeMap } from 'map';
import { KnowledgeMapContent } from 'map';

// 首頁
@Entry
@Component
struct Index {
  @State currentIndex: number = 0;
  private tabsController: TabsController = new TabsController(); // Tabs组件控制器

  @Builder
  tabBarBuilder(title: string, targetIndex: number, selectedIcon: string, unselectIcon: string) {
    Column() {
      Image(this.currentIndex === targetIndex ? $r(selectedIcon) : $r(unselectIcon))
        .width(24)
        .height(24)
      Text(title)
        .fontFamily('HarmonyHeiTi-Medium')
        .fontSize(10)
        .fontColor(this.currentIndex === targetIndex ? '#0A59F7' : 'rgba(0,0,0,0.60)')
        .textAlign(TextAlign.Center)
        .lineHeight(14)
        .fontWeight(500)
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
    .onClick(() => {
      this.currentIndex = targetIndex; // 切换高亮
      this.tabsController.changeIndex(targetIndex); // 改变TabContent显示的内容
    })
  }

  build() {
    Tabs({ barPosition: BarPosition.End, controller: this.tabsController }) {
      // 设置barPosition为BarPosition.End时，页签栏会位于应用界面的下方进行显示
      TabContent() {
        QuickStartPage()
      }.tabBar(
        // 'QuickStartPage
        this.tabBarBuilder('快速入门', 0, 'app.media.ic_01_on', 'app.media.ic_01_off')
      )

      TabContent() {
        CourseLearning()
      }.tabBar(
        // 'CourseLearning'
        this.tabBarBuilder('课程学习', 1, 'app.media.ic_02_on', 'app.media.ic_02_off')
      )

      TabContent() {
        KnowledgeMap()
      }.tabBar(
        // 'KnowledgeMap'
        this.tabBarBuilder('知识地图', 2, 'app.media.ic_03_on', 'app.media.ic_03_off')
      )
    }
    .scrollable(false) // 设置为false限制Tabs无法横向滑动切换页签
    .vertical(false) // 设置为false限制Tabs为非纵向导航条
    .divider({
      strokeWidth: 0.5,
      color: '#0D182431'
    })
    // .padding({ top: 36, bottom: 28 })
    .background($r('app.color.full_window_background'))
  }
}