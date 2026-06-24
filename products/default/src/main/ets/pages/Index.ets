import { QuickStartPage } from 'quickstart';
import { CourseLearning } from 'learning';
import { KnowledgeMap } from 'map';
import { KnowledgeMapContent } from 'map';

// 首頁
@Entry
@Component
struct Index {
  build() {
    Column() {
      // QuickStartPage()
      // CourseLearning()
      // KnowledgeMap()
      KnowledgeMapContent()
    }
    // .padding({ top: 36, bottom: 28 })
    .background($r('app.color.full_window_background'))
  }
}