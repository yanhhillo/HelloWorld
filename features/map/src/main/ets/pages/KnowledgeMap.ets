import { bufferToString } from '../util/BufferUtil';
import { bannerClass } from '../model/bannerClass'
import { barClass } from '../model/barClass';
import { KnowledgeMapContent } from './KnowledgeMapContent';

@Preview
@ComponentV2
export struct KnowledgeMap {
  // 定义路由栈
  @Provider('knowledgeMapPageStack') knowledgeMapPageStack: NavPathStack = new NavPathStack();
  @Local inf: string =
    '提供系统能力概述、快速入门，用于指导开发者进行场景化的开发。指南涉及到的知识点包括必要的背景知识、符合开发者实际开发场景的操作任务流（开发流程、开发步骤、调测验证）以及常见问题等。';
  @Local bannerList: Array<bannerClass> = [];
  @Local barList: Array<barClass> = [];
  @Local currentNavBarIndex: number = -1;

  @Builder
  PageMap(name: string) {
    if (name === 'KnowledgeMapContent') {
      KnowledgeMapContent({
        sectionIndex: this.currentNavBarIndex,
        sectionTitle: this.barList[this.currentNavBarIndex].title
      });
    }
  }

  aboutToAppear(): void {
    this.getBannerData();
    this.getBarData();
  }

  getBannerData() {
    this.getUIContext().getHostContext()?.resourceManager.getRawFileContent('bannerList.json')
      .then((value) => {
        let res: string = bufferToString(value);
        this.bannerList = JSON.parse(res) as bannerClass[];
      })
      .catch()
  }

  getBarData() {
    this.getUIContext().getHostContext()?.resourceManager.getRawFileContent('barList.json')
      .then((value) => {
        let res: string = bufferToString(value);
        this.barList = JSON.parse(res) as barClass[];
      })
      .catch()
  }

  build() {
    Navigation(this.knowledgeMapPageStack) {
      Scroll() {
        Column() {
          Text('知识地图')
            .width('100%')
            .fontSize(26)
            .fontWeight(FontWeight.Bold)
          bannerView({
            bannerList: this.bannerList,
            inf: this.inf
          })
          // 在 @ComponentV2 里使用语法糖 !! 实现类似双向绑写的简洁写法
          barView({
            barList: this.barList,
            currentNavBarIndex: this.currentNavBarIndex!!
          })
        }
        .width('100%')
        .padding({
          top: 0,
          right: 16,
          bottom: 0,
          left: 16
        })
      }
      // .layoutWeight(1)
      .constraintSize({ minHeight: '100%' }) // 解决当内容条数不足时，Scroll组件滚动时会出现空白区域的错误效果
      .edgeEffect(EdgeEffect.Spring) // edgeEffect用于设置边缘滑动效果，设置为EdgeEffect.Spring表示设置为弹性物理动效
      .align(Alignment.TopStart)
      .scrollBar(BarState.Off)
    }
    .hideTitleBar(true)
    // .mode(NavigationMode.Auto) // 自适应模式
    .mode(NavigationMode.Stack) // 单页堆叠模式
    .navDestination(this.PageMap)
  }
}

@Preview
@ComponentV2
export struct bannerView {
  @Param bannerList: Array<bannerClass> = [];
  @Param inf: string = "";

  build() {
    Column() {
      Swiper() {
        ForEach(
          this.bannerList,
          ((item: bannerClass, index) => {
            Image($r(item.src))
              .objectFit(ImageFit.Cover)
          }),
          (item: bannerClass, index) => item.id
        )
      }
      .width('100%')
      .borderRadius(16)
      .margin({
        top: 10,
        bottom: 10
      })
      .autoPlay(true)
      .loop(true)

      Text(this.inf)
        .width('100%')
        .textAlign(TextAlign.Start)
        .fontSize(14)
        .fontColor(Color.Grey)
    }
    .width('100%')
  }
}

@Preview
@ComponentV2
export struct barView {
  @Consumer('knowledgeMapPageStack') knowledgeMapPageStack: NavPathStack = new NavPathStack();
  @Param barList: Array<barClass> = [];
  @Param currentNavBarIndex: number = -1;
  @Event $currentNavBarIndex: (val: number) => void; // 事件回调，通知父组件

  build() {
    List({ space: 10 }) {
      ForEach(
        this.barList,
        ((item: barClass, index) => {
          ListItem() {
            Row() {
              Text(item.id)
                .fontSize(20)
                .fontWeight(FontWeight.Bolder)
              Text(item.title)
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .textOverflow({ overflow: TextOverflow.Ellipsis })
                .maxLines(1)
                .margin({
                  left: 10,
                  right: 10
                })
              Blank() // 该组件可以自动填充主轴方向的空余空间
              Image($r('app.media.ic_arrow'))
                .width(12)
                .height(24)
            }
            .width('100%')
            .padding({
              top: 5,
              right: 10,
              bottom: 5,
              left: 10
            })
            .height('42.00vp')
            // .justifyContent(FlexAlign.Start)
            .backgroundColor(
              this.currentNavBarIndex === Number(item.id) - 1 ? '#1A0A59F7' : Color.Transparent
            )
            .onClick(() => {
              this.$currentNavBarIndex(Number(item.id) - 1);
              this.knowledgeMapPageStack.pushPath({ name: 'KnowledgeMapContent' })
            })
          }
          .width('100%')
        }),
        (item: barClass, index) => item.id
      )
    }
    .width('100%')
    .margin({
      top: 20,
      bottom: 20
    })
  }
}

