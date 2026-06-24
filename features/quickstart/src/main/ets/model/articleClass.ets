// 单个articleClass
export class articleClass {
  id: string = '';
  title: string = '';
  inf: string = '';
  webUrl: string = '';
  src: string = '';
  // src: ResourceStr = '';

  constructor(id: string, src: string, title: string, inf: string, webUrl: string) {
    this.id = id;
    this.src = src;
    this.title = title;
    this.inf = inf;
    this.webUrl = webUrl;
  }
}