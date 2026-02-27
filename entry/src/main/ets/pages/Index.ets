// 首页
@Entry
@Component
struct Index {
  @State message: string = 'Hello';

  build() {
    Column() {
      Text(this.message)
        .fontSize(24)
        .fontWeight('700')
        .width('100%')
        .textAlign(TextAlign.Start)
        .padding({ left: 16 })
        .fontFamily('HarmonyHeiTi-Bold')
        .lineHeight(33)
      SwiperBanner()
    }
    .alignItems(HorizontalAlign.Start)
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.full_window_background'))
  }
}

// 轮播图
@Preview
@Component
struct SwiperBanner{
  @State bannerList: Array<BannerClass> = [
    new BannerClass('0', $r('app.media.banner_pic0'), ''),
    new BannerClass('1', $r('app.media.banner_pic1'), ''),
    new BannerClass('2', $r('app.media.banner_pic2'), ''),
    new BannerClass('3', $r('app.media.banner_pic3'), ''),
    new BannerClass('4', $r('app.media.banner_pic4'), ''),
    new BannerClass('5', $r('app.media.banner_pic5'), ''),
  ];

  build(){
    Swiper(){
      ForEach(
        this.bannerList,
        (item: BannerClass, index: number) => {
        Image(item.imageSrc)
          .width('100%')
          .objectFit(ImageFit.Contain)
          .borderRadius(16)
          .padding({ top: 11, left: 16, right: 16 })
      },
      (item: BannerClass, index: number) => item.id
      )
    }
    .autoPlay(true)
    .loop(true)
    .indicator(
      new DotIndicator()
        .color('#1a000000')
        .selectedColor('#0A59F7'))
  }
}

// 轮播图
@Preview
@Component
struct Banner{
  build(){
    Swiper(){
      Image($r('app.media.banner_pic0'))
        .width('100%')
        .objectFit(ImageFit.Contain)
        .borderRadius(16)
        .padding({ top: 11, left: 16, right: 16 })
      Image($r('app.media.banner_pic1'))
        .width('100%')
        .objectFit(ImageFit.Contain)
        .borderRadius(16)
        .padding({ top: 11, left: 16, right: 16 })
      Image($r('app.media.banner_pic2'))
        .width('100%')
        .objectFit(ImageFit.Contain)
        .borderRadius(16)
        .padding({ top: 11, left: 16, right: 16 })
      Image($r('app.media.banner_pic3'))
        .width('100%')
        .objectFit(ImageFit.Contain)
        .borderRadius(16)
        .padding({ top: 11, left: 16, right: 16 })
      Image($r('app.media.banner_pic4'))
        .width('100%')
        .objectFit(ImageFit.Contain)
        .borderRadius(16)
        .padding({ top: 11, left: 16, right: 16 })
      Image($r('app.media.banner_pic5'))
        .width('100%')
        .objectFit(ImageFit.Contain)
        .borderRadius(16)
        .padding({ top: 11, left: 16, right: 16 })
    }
    .autoPlay(true)
    .loop(true)
    .indicator(
      new DotIndicator()
        .color('#1a000000')
        .selectedColor('#0A59F7'))
  }
}

// 轮播图数据类
class BannerClass {
  id: string = '';
  imageSrc: ResourceStr = '';
  url: string = '';

  constructor(id: string, imageSrc: ResourceStr, url: string) {
    this.id = id;
    this.imageSrc = imageSrc;
    this.url = url;
  }
}