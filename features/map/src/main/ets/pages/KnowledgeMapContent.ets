@Preview
@ComponentV2
export struct KnowledgeMapContent {
  @Local section: SectionClass = new SectionClass(
    "准备与学习",
    "加入HarmonyOS生态，注册成为开发者，通过HarmonyOS课程了解基本概念和基础知识，轻松开启HarmonyOS的开发旅程。",
    [
      new MaterialClass("HarmonyOS简介", [
        new KnowledgeBaseClass("准备", "注册账号"),
        new KnowledgeBaseClass("准备", "实名认证"),
        new KnowledgeBaseClass("学习与获取证书", "HarmonyOS第一课"),
        new KnowledgeBaseClass("学习与获取证书", "HarmonyOS应用开发者基础认证")
      ]),
      new MaterialClass("赋能套件介绍", [
        new KnowledgeBaseClass("指南", "开发"),
        new KnowledgeBaseClass("指南", "最佳实践"),
        new KnowledgeBaseClass("指南", "API参考"),
        new KnowledgeBaseClass("指南", "视频课程"),
        new KnowledgeBaseClass("指南", "Codelabs"),
        new KnowledgeBaseClass("指南", "FAQ")
      ])
    ]
  );

  build() {
    Scroll() {
      Column() {
        Text(this.section.title)
          .width('100%')
          .textAlign(TextAlign.Start)
          .fontSize(26)
        Text(this.section.brief)
          .width('100%')
          .textAlign(TextAlign.Start)
          .fontSize(14)
          .fontColor(Color.Grey)
          .margin({
            top: 10,
            bottom: 20
          })
        List({ space: 16 }) {
          ForEach(
            this.section.materials,
            ((item: MaterialClass, index) => {
              MaterialItem({ Material: item })
            })
          )
        }
        .width('100%')
      }
      .width('100%')
      .padding({
        left: 16,
        right: 16
      })
    }
    .width('100%')
    .align(Alignment.TopStart)
    .scrollBar(BarState.Off)
    .constraintSize({ minHeight: '100%' })
    .edgeEffect(EdgeEffect.Spring)
    .scrollable(ScrollDirection.Vertical)
  }
}

// 区域4 类型与图标的映射
const TypeMapIcon: Record<string, string> = {
  '指南': 'app.media.ic_guide',
  '准备': 'app.media.ic_prepare',
  '学习与获取证书': 'app.media.ic_medals',
  '视频教程': 'app.media.ic_video',
}

// 区域4 class
export class KnowledgeBaseClass {
  type: string = "";
  title: string = "";

  constructor(type: string, title: string) {
    this.type = type;
    this.title = title;
  }
}

// 区域4 item
@Component
export struct KnowledgeBaseItem {
  @Prop KnowledgeBase: KnowledgeBaseClass;

  build() {
    Row() {
      Image($r(TypeMapIcon[this.KnowledgeBase.type]))
        .width(20)
        .height(20)

      Column() {
        Text(this.KnowledgeBase.title)
          .width('100%')
          .textAlign(TextAlign.Start)
          .fontSize(18)
          .maxLines(1)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
        Text(this.KnowledgeBase.type)
          .width('100%')
          .textAlign(TextAlign.Start)
          .fontSize(14)
          .maxLines(1)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
      }
      .layoutWeight(1)
      .alignItems(HorizontalAlign.Center)
      .margin({ left: 16, right: 16 })

      Image($r('app.media.ic_arrow'))
        .width(12)
        .height(24)
    }
    .width('100%')
    .height(64)
  }
}

// 区域3 class
export class MaterialClass {
  subtitle: string = "";
  knowledgeBase: KnowledgeBaseClass[] = []

  constructor(subtitle: string, knowledgeBase: KnowledgeBaseClass[]) {
    this.subtitle = subtitle;
    this.knowledgeBase = knowledgeBase;
  }
}

// 区域3 item
@Component
export struct MaterialItem {
  @Prop Material: MaterialClass;

  build() {
    Column() {
      Text(this.Material.subtitle)
        .width('100%')
        .textAlign(TextAlign.Start)
        .fontSize(16)
        .margin({ bottom: 5 })
      List({ space: 0 }) {
        ForEach(
          this.Material.knowledgeBase,
          ((item: KnowledgeBaseClass, index) => {
            KnowledgeBaseItem({ KnowledgeBase: item })
          })
        )
      }
      .width('100%')
      .backgroundColor('#fff')
      .borderRadius(16)
      .padding({
        left: 16,
        right: 16
      })
      .divider({
        // 分隔线
        strokeWidth: 0.5,
        startMargin: 36, // 图标宽度 20+图标右侧margin 16
        endMargin: 0,
        color: '#F2F2F2'
      })
    }
    .width('100%')
  }
}

// 整个区域 class
export class SectionClass {
  title: string = "";
  brief: string = "";
  materials: MaterialClass[] = []

  constructor(title: string, brief: string, materials: MaterialClass[]) {
    this.title = title;
    this.brief = brief;
    this.materials = materials;
  }
}
