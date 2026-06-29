import { LengthMetrics, LengthUnit } from '@kit.ArkUI';

@ComponentV2
export struct FlexShowList {
  @Consumer('layoutPathStack') layoutPathStack: NavPathStack = new NavPathStack();
  @Param title: string = "";
  @Local flexList: Array<number> = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]

  build() {
    NavDestination() {
      Scroll() {
        Column() {
          Text(this.title)
            .fontSize(26)
            .fontWeight(FontWeight.Bold)
            .margin({ bottom: 20 })
          Flex({
            direction: FlexDirection.Row,
            justifyContent: FlexAlign.Start,
            wrap: FlexWrap.Wrap,
            space: {
              main: LengthMetrics.vp(20), // 使用 LengthMetrics.vp()
              cross: LengthMetrics.vp(10)
            }
          }) {
            ForEach(
              this.flexList,
              ((item: number, index) => {
                Text(String(item))
                // .width(40)
                  .fontSize(14)
                  .textAlign(TextAlign.Center)
              }),
              (item: number, index) => String(index)
            )
          }
        }
        .width('100%')
        .height('100%')
        .padding(16)
        .borderRadius(16)
        .backgroundColor(Color.White)
      }
      .width('100%')
      .padding(16)
      .background('#f1f3f5')
      .align(Alignment.TopStart)
      .scrollBar(BarState.Off)
      .constraintSize({ minHeight: '100%' })
      .edgeEffect(EdgeEffect.Spring)
      .scrollable(ScrollDirection.Vertical)
    }
    .hideTitleBar(true)
    .onBackPressed(() => {
      this.layoutPathStack.pop();
      return true;
    })
  }
}