import { ColumnShowList } from '../view/ColumnShowList';
import { FlexShowList } from '../view/FlexShowList'
import { RowShowList } from '../view/RowShowList';
import { StackComponent } from '../view/StackComponent';

@ComponentV2
export struct LayoutPage {
  @Provider('layoutPathStack') layoutPathStack: NavPathStack = new NavPathStack();
  @Local dataList: Array<dataItem> = [
    new dataItem("1", "app.media.ic_flex", "flex"),
    new dataItem("2", "app.media.ic_column", "column"),
    new dataItem("3", "app.media.ic_row", "row"),
    new dataItem("4", "app.media.ic_stack", "stack"),
  ];

  @Builder
  layoutRouter(name: string, param: dataItem) {
    if (name == "flex") {
      FlexShowList({
        title: param.title
      });
    } else if (name == "column") {
      ColumnShowList({
        title: param.title
      });
    } else if (name == "row") {
      RowShowList({
        title: param.title
      });
    } else if (name == "stack") {
      StackComponent({
        title: param.title
      });
    }
  }

  build() {
    Navigation(this.layoutPathStack) {
      Scroll() {
        Column() {
          Text('常见布局容器对齐方式')
            .fontSize(26)
            .fontWeight(FontWeight.Bold)
          List() {
            ForEach(
              this.dataList,
              ((item: dataItem, index) => {
                ListItem() {
                  Row() {
                    Image($r(item.src))
                      .objectFit(ImageFit.Cover)
                      .width(24)
                      .height(24)
                      .margin({ right: 10 })
                    Text(item.title)
                      .fontSize(14)
                  }
                  .width('100%')
                }
                .padding(16)
                .onClick(() => {
                  this.layoutPathStack.pushPath({
                    name: item.title,
                    param: item
                  })
                })
              }),
              (item: dataItem, index) => item.id
            )
          }
          .margin({ top: 10 })
          .borderRadius(16)
          .backgroundColor(Color.White)
        }
        .width('100%')
        .padding(16)
      }
      .constraintSize({ minHeight: '100%' }) // 解决当内容条数不足时，Scroll组件滚动时会出现空白区域的错误效果
      .edgeEffect(EdgeEffect.Spring) // edgeEffect用于设置边缘滑动效果，设置为EdgeEffect.Spring表示设置为弹性物理动效
      .align(Alignment.TopStart)
      .scrollBar(BarState.Off)
    }
    .hideTitleBar(true)
    // .mode(NavigationMode.Auto) // 自适应模式
    .mode(NavigationMode.Stack) // 单页堆叠模式
    .navDestination(this.layoutRouter)
  }
}

//
export class dataItem {
  id: string = "";
  src: string = "";
  title: string = ""

  constructor(id: string, src: string, title: string) {
    this.id = id;
    this.src = src;
    this.title = title;
  }
}