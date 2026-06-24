// 轮播图bannerClass
export class bannerClass {
  id: string = '';
  url: string = '';
  imageSrc: string = '';
  // imageSrc: ResourceStr = '';

  constructor(id: string, imageSrc: string, url: string) {
    this.id = id;
    this.imageSrc = imageSrc;
    this.url = url;
  }
}