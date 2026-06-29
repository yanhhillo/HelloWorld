@ComponentV2
export struct StackComponent {
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

          // Stack 容器
          Stack({ alignContent: Alignment.Center }) { // 默认所有子组件居中对齐

            // 1. 底层：背景卡片
            Column() {
              Text('这是一张背景卡片')
                .fontSize(16)
                .fontColor(Color.White)
            }
            .width('100%')
            .height('100%')
            .backgroundColor('#007DFF')
            .padding(16)
            .borderRadius(16)

            // 2. 中层：主要内容文本 (使用 alignSelf 单独调整位置)
            Text('核心内容区域')
              .fontSize(18)
              .fontColor(Color.Black)
              .backgroundColor('#FFFFFF')
              .padding(16)
              .borderRadius(16)

            // 3. 顶层：右上角关闭按钮 (使用 position 绝对定位)
            Button('关闭')
            // .width(30)
            // .height(30)
              .fontSize(12)
              .backgroundColor(Color.Grey)
              .fontColor(Color.White)
              .borderRadius(16)
              .position({ x: 224, y: 10 }) // 绝对定位到右上角附近
              .zIndex(10) // 确保在最上层，即使代码写在前面也能覆盖
          }
          .width(320)
          .height(220)
          .padding(16)
          .backgroundColor(Color.White) // Stack 容器背景
          .borderRadius(16)
        }
        .width('100%')
        .height('100%')
        .padding(16)

        // .borderRadius(16)
        // .backgroundColor(Color.White)
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