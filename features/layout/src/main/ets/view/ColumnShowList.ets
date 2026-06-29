@ComponentV2
export struct ColumnShowList {
  @Consumer('layoutPathStack') layoutPathStack: NavPathStack = new NavPathStack();
  @Param title: string = "";

  build() {
    NavDestination() {
      Scroll() {
        Column() {
          Text(this.title)
            .fontSize(26)
            .fontWeight(FontWeight.Bold)
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