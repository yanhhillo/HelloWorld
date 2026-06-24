@Preview
@ComponentV2
export struct KnowledgeMapContent {
  build() {

  }
}

// 区域4
class KnowledgeBaseItem {
  type: string = "";
  title: string = "";

  constructor(type: string, title: string) {
    this.type = type;
    this.title = title;
  }
}

// 区域3
class Material {
  subtitle: string = "";
  knowledgeBase: KnowledgeBaseItem[] = []

  constructor(subtitle: string, knowledgeBase: KnowledgeBaseItem[]) {
    this.subtitle = subtitle;
    this.knowledgeBase = knowledgeBase;
  }
}

// 整个区域
export class Section {
  title: string = "";
  brief: string = "";
  materials: Material[] = []

  constructor(title: string, brief: string, materials: Material[]) {
    this.title = title;
    this.brief = brief;
    this.materials = materials;
  }
}
