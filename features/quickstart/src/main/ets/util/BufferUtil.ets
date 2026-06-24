// 将Uint8Array类型的内容转换为字符串，并将字符串解析为对应的数据结构
import { util } from '@kit.ArkTS';

export function bufferToString(buffer: Uint8Array): string {
  let textDecoder = util.TextDecoder.create('utf-8', {
    ignoreBOM: true
  });
  let resultPut = textDecoder.decodeToString(buffer);
  return resultPut;
}