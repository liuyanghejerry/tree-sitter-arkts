// 测试普通method在ArkUI中嵌套的情况

@Component
struct BasicArkUITest {
  @State count: number = 0;

  some_method() {
    this.count++;
  }
}
