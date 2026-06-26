import { bannerClass } from '../model/bannerClass'
import { bufferToString } from '../util/BufferUtil';

import { BreakpointType, BreakpointTypeEnum } from 'utils';

// banner
@Preview
@ComponentV2
export struct banner {
  @Local bannerList: Array<bannerClass> = [
    // new bannerClass('0', 'app.media.banner_pic0', ''),
    // new bannerClass('1', 'app.media.banner_pic1', ''),
    // new bannerClass('2', 'app.media.banner_pic2', ''),
    // new bannerClass('3', 'app.media.banner_pic3', ''),
    // new bannerClass('4', 'app.media.banner_pic4', ''),
    // new bannerClass('5', 'app.media.banner_pic5', ''),
  ]
  @Consumer('quickStartPathStack') quickStartPathStack: NavPathStack = new NavPathStack();
  @Local currentBreakpoint: string = BreakpointTypeEnum.MD;

  // @StorageProp('currentBreakpoint') currentBreakpoint: string = BreakpointTypeEnum.MD;

  aboutToAppear(): void {
    this.getBannerDataFromJSON();
  }

  getBannerDataFromJSON() {
    this.getUIContext().getHostContext()?.resourceManager.getRawFileContent('BannerData.json')
      .then(value => {
        // Get the buffer content and convert it to a string.
        let res: string = bufferToString(value);
        // Parse into data structures
        this.bannerList = JSON.parse(res) as bannerClass[];
      }).catch();
  }

  build() {
    Swiper() {
      ForEach(
        this.bannerList,
        (item: bannerClass, index?: number) => {
          Image($r(item.imageSrc))
            .width('100%')
            .borderRadius(16)
            .padding({
              top: 5,
              right: 16,
              bottom: 5,
              left: 16
            })
            .objectFit(ImageFit.Contain)
            .onClick(() => {
              this.quickStartPathStack.pushPath({ name: "BannerDetailPage", param: item })
            })
        },
        (item: bannerClass, index?: number) => item.id
      )
    }
    // .indicator(
    //   new DotIndicator().color('#1a000000').selectedColor('#ff0032ff')
    // )
    .autoPlay(true)
    .loop(true)
    // Swiper组件的一多适配
    .displayCount(new BreakpointType({ sm: 1, md: 2, lg: 2 }).getValue(this.currentBreakpoint))
    .displayMode(SwiperDisplayMode.STRETCH)
    .indicator(this.currentBreakpoint === BreakpointTypeEnum.SM ?
      Indicator.dot().color('#1a000000').selectedColor('#0A59F7') :
      false)
    .nextMargin(new BreakpointType<Length>({ sm: 0, md: 12, lg: 266 }).getValue(this.currentBreakpoint))
  }
}