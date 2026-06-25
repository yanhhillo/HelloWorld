import { articleClass } from '../model/articleClass'
import { bufferToString } from '../util/BufferUtil'

// tutorialView
@ComponentV2
export struct tutorialView {
  @Local tutorialList: Array<articleClass> = [
    // new articleClass('1', 'app.media.tutorial_pic1', 'Step1 环境的搭建',
    //   '本篇教程实现了快速入门——一个用于了解和学习HarmonyOS的应用程序。',
    //   'https://developer.huawei.com/consumer/cn/forum/home?all=1'),
    // new articleClass('2', 'app.media.tutorial_pic2', 'Step2 使用Swiper构建运营广告位',
    //   'Swiper组件提供滑动轮播显示的能力。Swiper本身是一个容器组件，当设置了多个子组件后，可以对这些子组件进行轮播显示。',
    //   'https://developer.huawei.com/consumer/cn/forum/home?all=1'),
    // new articleClass('3', 'app.media.tutorial_pic3', 'Step3 创建和组合视图',
    //   'Item定义子组件相关特征。相关组件支持使用条件渲染、循环渲染、懒加载等方式生成子组件。',
    //   'https://developer.huawei.com/consumer/cn/forum/home?all=1'),
    // new articleClass('4', 'app.media.tutorial_pic4', 'Step4 网格和列表组建的使用',
    //   '网格和列表组件中，当Item达到一定数量，内容超过屏幕大小时，可以自动提供滚动功能，适合用于呈现同类数据类型或数据类型集',
    //   'https://developer.huawei.com/consumer/cn/forum/home?all=1'),
    // new articleClass('5', 'app.media.tutorial_pic5', 'Step5 应用架构设计基础——MVVM模式',
    //   'ArkUI采取MVVM = Model + View + ViewModel模式，将数据与视图绑定在一起，更新数据的时候直接更新视图。',
    //   'https://developer.huawei.com/consumer/cn/forum/home?all=1'),
    // new articleClass('6', 'app.media.tutorial_pic6', 'Step6 应用架构设计基础——三层架构',
    //   '为了更好地适配复杂应用的开发，建议采用三层架构的方式对整个应用的功能进行模块化，实现高内聚、低耦合开发。',
    //   'https://developer.huawei.com/consumer/cn/forum/home?all=1'),
    // new articleClass('7', 'app.media.tutorial_pic7', 'Step7 ArkWeb页面适配',
    //   'ArkWeb（方舟Web）提供了Web组件，用于在应用程序中显示Web页面内容，为开发者提供页面加载、页面交互、页面调试等能力。',
    //   'https://developer.huawei.com/consumer/cn/forum/home?all=1'),
    // new articleClass('8', 'app.media.tutorial_pic8', 'Step8 数据驱动UI更新', '数据更新的同时会直接驱动UI的改变',
    //   'xxx'),
    // new articleClass('9', 'app.media.tutorial_pic9', 'Step9 设置组件导航',
    //   'Navigation组件适用于模块内页面切换，一次开发，多端部署场景。通过组件级路由能力实现更加自然流畅的转场体验，并提供多种标题栏样式来呈现更好的标题和内容联动效果。',
    //   'https://developer.huawei.com/consumer/cn/forum/home?all=1'),
    // new articleClass('10', 'app.media.tutorial_pic10', 'Step10 原生智能：AI语音朗读',
    //   '文本转语音服务提供将文本信息转换为语音并进行播报的能力，便于用户与设备进行互动，实现实时语音交互，文本播报。',
    //   'https://developer.huawei.com/consumer/cn/forum/home?all=1'),
    // new articleClass('11', 'app.media.tutorial_pic11', 'Step11 分布式流转',
    //   '流转能力打破设备界限，多设备联动，使用户应用程序可分可合、可流转，实现如邮件跨设备编辑、多设备协同健身、多屏游戏等分布式业务。',
    //   'https://developer.huawei.com/consumer/cn/forum/home?all=1'),
    // new articleClass('12', 'app.media.tutorial_pic12', 'Step12 一次开发，多端部署',
    //   '一套代码工程，一次开发上架，多端按需部署。支撑开发者快速高效的开发支持多种终端设备形态的应用，实现对不同设备兼容的同时，提供跨设备的流转、迁移和协同的分布式体验。',
    //   'https://developer.huawei.com/consumer/cn/forum/home?all=1'),
  ];
  @Consumer('quickStartPathStack') quickStartPathStack: NavPathStack = new NavPathStack();

  aboutToAppear(): void {
    this.getTutorialFromJSON();
  }

  getTutorialFromJSON() {
    this.getUIContext().getHostContext()?.resourceManager.getRawFileContent('TutorialData.json')
      .then(value => {
        // Get the buffer content and convert it to a string.
        let res: string = bufferToString(value);
        // Parse into data structures
        this.tutorialList = JSON.parse(res) as articleClass[];
      }).catch();
  }

  build() {
    Column() {
      Text('入门教程')
        .fontSize(16)
        .fontWeight(FontWeight.Medium)
        .height(24)
      List({ space: 8 }) {
        ForEach(
          this.tutorialList,
          (item: articleClass, index) => {
            ListItem() {
              tutorialItem({ tutorial: item })
                .onClick(() => {
                  this.quickStartPathStack.pushPath({
                    name: "ArticleDetailPage",
                    param: item
                  })
                })
            }
          },
          (item: articleClass, index) => item.id,
        )
      }
      .scrollBar(BarState.Off)
    }
    .width('100%')
    .padding({
      top: 10,
      right: 16,
      bottom: 10,
      left: 16
    })
    .alignItems(HorizontalAlign.Start)
  }
}

// tutorialItem
@ComponentV2
struct tutorialItem {
  @Param tutorial: articleClass = new articleClass("", "", "", "", "");

  // @Local title: string = 'HarmonyOS第一课'
  // @Local inf: string = '基于真实的开发场景，提供向导式学习，多维度融合课程等内容，给开发者提供全新的学习体验。'

  build() {
    Row() {
      Column() {
        Text(this.tutorial.title)
          .width('100%')
          .fontSize(14)
          .textAlign(TextAlign.Start)
          .maxLines(1)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
        Text(this.tutorial.inf)
          .width('100%')
          .fontSize(12)
          .fontColor('rgba(0, 0, 0, 0.6)')
          .textAlign(TextAlign.Start)
          .maxLines(2)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
          .margin({ top: 5 })
      }
      .layoutWeight(1) // 取值为1，在任意尺寸的设备下自适应占满剩余空间
      .margin({ right: 8 })

      Image($r(this.tutorial.src))
        .height(64)
        .width(108)
        .objectFit(ImageFit.Cover)
        .borderRadius(16)
    }
    .width('100%')
    .height(80)
    .padding({
      right: 5,
      left: 5
    })
    .borderRadius(16)
    .backgroundColor(Color.White)
  }
}