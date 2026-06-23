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
  }
}

// banner
@Preview
@ComponentV2
struct banner {
  @Local bannerList: Array<bannerClass> = [
    new bannerClass('0', $r('app.media.banner_pic0'), ''),
    new bannerClass('1', $r('app.media.banner_pic1'), ''),
    new bannerClass('2', $r('app.media.banner_pic2'), ''),
    new bannerClass('3', $r('app.media.banner_pic3'), ''),
    new bannerClass('4', $r('app.media.banner_pic4'), ''),
    new bannerClass('5', $r('app.media.banner_pic5'), ''),
  ]

  build() {
    Swiper() {
      ForEach(
        this.bannerList,
        (item: bannerClass, index?: number) => {
          Image(item.imageSrc)
            .width('100%')
            .borderRadius(16)
            .padding({
              top: 5,
              right: 16,
              bottom: 5,
              left: 16
            })
            .objectFit(ImageFit.Contain)
        },
        (item: bannerClass, index?: number) => item.id
      )
    }
    .indicator(
      new DotIndicator().color('#1a000000').selectedColor('#ff0032ff')
    )
    .autoPlay(true)
    .loop(true)
  }
}

// enablementItem
@Component
export struct enablementItem {
  @Prop enablement: articleClass;

  // @Local title: string = 'HarmonyOS第一课'
  // @Local inf: string = '基于真实的开发场景，提供向导式学习，多维度融合课程等内容，给开发者提供全新的学习体验。'

  build() {
    Column() {
      Image(this.enablement.src)
        .width(160)
        .height(96)
        .objectFit(ImageFit.Cover)
        .borderRadius({
          topLeft: 16,
          topRight: 16,
          bottomLeft: 0,
          bottomRight: 0
        })
      Text(this.enablement.title)
        .width('100%')
        .fontSize(14)
        .textAlign(TextAlign.Start)
        .maxLines(1)
        .textOverflow({ overflow: TextOverflow.Ellipsis })
        .margin({
          top: 5,
          bottom: 5,
        })
      Text(this.enablement.inf)
        .width('100%')
        .fontSize(12)
        .fontColor('rgba(0, 0, 0, 0.6)')
        .textAlign(TextAlign.Start)
        .maxLines(3)
        .textOverflow({ overflow: TextOverflow.Ellipsis })
    }
    .width(160)
    .height(170)
    .borderRadius(16)
    .backgroundColor('#fff')
  }
}

// tutorialItem
@Component
export struct tutorialItem {
  @Prop tutorial: articleClass;

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
      .margin({ right: 12 })

      Image(this.tutorial.src)
        .height(64)
        .width(108)
        .objectFit(ImageFit.Cover)
        .borderRadius(16)
    }
    .width('100%')
    .height(80)
    .borderRadius(16)
    .backgroundColor(Color.White)
    .padding(12)
  }
}

// enablementView
@ComponentV2
export struct enablementView {
  @Local enablementList: Array<articleClass> = [
    new articleClass('1', $r('app.media.enablement_pic1'), 'HarmonyOS第一课',
      '基于真实的开发场景，提供向导式学习，多维度融合课程等内容，给开发者提供全新的学习体验。',
      'https://developer.huawei.com/consumer/cn/doc/harmonyos-video-courses/video-tutorials-0000001443535745'),
    new articleClass('2', $r('app.media.enablement_pic2'), '开发指南',
      '提供系统能力概述、快速入门，用于指导开发者进行场景化的开发。指南涉及到的知识点包括必要的背景知识、符合开发者实际开发场景的操作任务流（开发流程、开发步骤、调测验证）以及常见问题等。',
      'https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/application-dev-guide-0000001630265101'),
    new articleClass('3', $r('app.media.enablement_pic3'), '最佳实践',
      '针对新发布特性及热点特性提供详细的技术解析和开发最佳实践。',
      'https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/topic-architecture-0000001678045510'),
    new articleClass('4', $r('app.media.enablement_pic4'), 'Codelabs',
      '以教学为目的的代码样例及详细的开发指导，帮助开发者一步步地完成指定场景的应用开发并掌握相关知识。Codelabs将最新的鸿蒙生态应用开发技术与典型场景结合，让开发者快速地掌握开发高质量应用的方法。同时支持互动式操作，通过文字、代码和效果联动为开发者带来更佳的学习体验。',
      'https://developer.huawei.com/consumer/cn/doc/harmonyos-codelabs/codelabs-0000001443855957'),
    new articleClass('5', $r('app.media.enablement_pic5'), 'Sample',
      '面向不同类型的开发者提供的鸿蒙生态应用开发优秀实践，每个Sample Code都是一个可运行的工程，为开发者提供实例化的代码参考。',
      'https://developer.huawei.com/consumer/cn/doc/harmonyos-samples/samples-0000001162414961'),
    new articleClass('6', $r('app.media.enablement_pic6'), 'API参考',
      '面向开发者提供鸿蒙系统开放接口的全集，供开发者了解具体接口使用方法。API参考详细地描述了每个接口的功能、使用限制、参数名、参数类型、参数含义、取值范围、权限、注意事项、错误码及返回值等。',
      'https://developer.huawei.com/consumer/cn/doc/harmonyos-references/development-intro-0000001580026066'),
    new articleClass('7', $r('app.media.enablement_pic7'), 'FAQ',
      '开发者常见问题的总结，开发者可以通过FAQ更高效地解决常见问题。FAQ会持续刷新，及时呈现最新的常见问题。',
      'https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-development-0000001753952202'),
    new articleClass('8', $r('app.media.enablement_pic8'), '开发者论坛', '和其他应用开发者交流技术、共同进步。',
      'https://developer.huawei.com/consumer/cn/forum/home?all=1'),
  ];

  build() {
    Column() {
      Text('赋能套件')
        .fontSize(16)
        .fontWeight(FontWeight.Medium)
        .height(24)
      Grid() {
        ForEach(
          this.enablementList,
          (item: articleClass, index) => {
            GridItem() {
              enablementItem({ enablement: item })
            }
          },
          (item: articleClass, index) => item.id
        )
      }
      .rowsTemplate('1fr')
      .columnsGap(8)
      .scrollBar(BarState.Off)
      .height(170)
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

// tutorialView
@ComponentV2
export struct tutorialView {
  @Local tutorialList: Array<articleClass> = [
    new articleClass('1', $r('app.media.tutorial_pic1'), 'Step1 环境的搭建',
      '本篇教程实现了快速入门——一个用于了解和学习HarmonyOS的应用程序。',
      'https://developer.huawei.com/consumer/cn/forum/home?all=1'),
    new articleClass('2', $r('app.media.tutorial_pic2'), 'Step2 使用Swiper构建运营广告位',
      'Swiper组件提供滑动轮播显示的能力。Swiper本身是一个容器组件，当设置了多个子组件后，可以对这些子组件进行轮播显示。',
      'https://developer.huawei.com/consumer/cn/forum/home?all=1'),
    new articleClass('3', $r('app.media.tutorial_pic3'), 'Step3 创建和组合视图',
      'Item定义子组件相关特征。相关组件支持使用条件渲染、循环渲染、懒加载等方式生成子组件。',
      'https://developer.huawei.com/consumer/cn/forum/home?all=1'),
    new articleClass('4', $r('app.media.tutorial_pic4'), 'Step4 网格和列表组建的使用',
      '网格和列表组件中，当Item达到一定数量，内容超过屏幕大小时，可以自动提供滚动功能，适合用于呈现同类数据类型或数据类型集',
      'https://developer.huawei.com/consumer/cn/forum/home?all=1'),
    new articleClass('5', $r('app.media.tutorial_pic5'), 'Step5 应用架构设计基础——MVVM模式',
      'ArkUI采取MVVM = Model + View + ViewModel模式，将数据与视图绑定在一起，更新数据的时候直接更新视图。',
      'https://developer.huawei.com/consumer/cn/forum/home?all=1'),
    new articleClass('6', $r('app.media.tutorial_pic6'), 'Step6 应用架构设计基础——三层架构',
      '为了更好地适配复杂应用的开发，建议采用三层架构的方式对整个应用的功能进行模块化，实现高内聚、低耦合开发。',
      'https://developer.huawei.com/consumer/cn/forum/home?all=1'),
    new articleClass('7', $r('app.media.tutorial_pic7'), 'Step7 ArkWeb页面适配',
      'ArkWeb（方舟Web）提供了Web组件，用于在应用程序中显示Web页面内容，为开发者提供页面加载、页面交互、页面调试等能力。',
      'https://developer.huawei.com/consumer/cn/forum/home?all=1'),
    new articleClass('8', $r('app.media.tutorial_pic8'), 'Step8 数据驱动UI更新', '数据更新的同时会直接驱动UI的改变',
      'xxx'),
    new articleClass('9', $r('app.media.tutorial_pic9'), 'Step9 设置组件导航',
      'Navigation组件适用于模块内页面切换，一次开发，多端部署场景。通过组件级路由能力实现更加自然流畅的转场体验，并提供多种标题栏样式来呈现更好的标题和内容联动效果。',
      'https://developer.huawei.com/consumer/cn/forum/home?all=1'),
    new articleClass('10', $r('app.media.tutorial_pic10'), 'Step10 原生智能：AI语音朗读',
      '文本转语音服务提供将文本信息转换为语音并进行播报的能力，便于用户与设备进行互动，实现实时语音交互，文本播报。',
      'https://developer.huawei.com/consumer/cn/forum/home?all=1'),
    new articleClass('11', $r('app.media.tutorial_pic11'), 'Step11 分布式流转',
      '流转能力打破设备界限，多设备联动，使用户应用程序可分可合、可流转，实现如邮件跨设备编辑、多设备协同健身、多屏游戏等分布式业务。',
      'https://developer.huawei.com/consumer/cn/forum/home?all=1'),
    new articleClass('12', $r('app.media.tutorial_pic12'), 'Step12 一次开发，多端部署',
      '一套代码工程，一次开发上架，多端按需部署。支撑开发者快速高效的开发支持多种终端设备形态的应用，实现对不同设备兼容的同时，提供跨设备的流转、迁移和协同的分布式体验。',
      'https://developer.huawei.com/consumer/cn/forum/home?all=1'),
  ];

  build() {
    Column() {
      Text('入门教程')
        .fontSize(16)
        .fontWeight(FontWeight.Medium)
        .height(24)
      List({ space: 4 }) {
        ForEach(
          this.tutorialList,
          (item: articleClass, index) => {
            ListItem() {
              tutorialItem({ tutorial: item })
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

// 轮播图bannerClass
class bannerClass {
  id: string = '';
  imageSrc: ResourceStr = '';
  url: string = '';

  constructor(id: string, imageSrc: ResourceStr, url: string) {
    this.id = id;
    this.imageSrc = imageSrc;
    this.url = url;
  }
}

// 单个articleClass
class articleClass {
  id: string = '';
  src: ResourceStr = '';
  title: string = '';
  inf: string = '';
  webUrl: string = '';

  constructor(id: string, src: ResourceStr, title: string, inf: string, webUrl: string) {
    this.id = id;
    this.src = src;
    this.title = title;
    this.inf = inf;
    this.webUrl = webUrl;
  }
}