# ArkTS Grammar Fields 文档

本文档记录了为 `grammar.js` 添加的所有 field，以便于后续的语法高亮和语义分析。

## 目录

- [装饰器相关](#装饰器相关)
- [组件相关](#组件相关)
- [类和接口相关](#类和接口相关)
- [函数相关](#函数相关)
- [变量和参数](#变量和参数)
- [表达式](#表达式)
- [类型系统](#类型系统)
- [导入导出](#导入导出)
- [控制流](#控制流)
- [UI 组件](#ui-组件)

---

## 装饰器相关

### `decorator`
- **name**: 装饰器名称（如 `State`, `Component`, `Builder` 等）
- **arguments**: 装饰器参数列表（可选）

```typescript
@Component
@State name: string = "Hello"
```

---

## 组件相关

### `component_declaration`
- **decorator**: 装饰器（可重复）
- **name**: 组件名称
- **type_parameters**: 泛型参数（可选）
- **body**: 组件体

```typescript
@Component
struct MyComponent<T> { ... }
```

### `property_declaration`
- **decorator**: 装饰器（可重复）
- **visibility**: 可见性修饰符（`private` | `public` | `protected`）
- **name**: 属性名
- **type**: 类型注解
- **value**: 初始值

```typescript
@State private count: number = 0
```

### `build_method`
- **return_type**: 返回类型注解（可选）
- **body**: build 方法体

```typescript
build(): void { ... }
```

### `component_parameter`
- **name**: 参数名
- **value**: 参数值

```typescript
Text({ content: "Hello" })
```

---

## 类和接口相关

### `class_declaration`
- **decorator**: 装饰器（可重复）
- **name**: 类名
- **type_parameters**: 泛型参数（可选）
- **superclass**: 继承的父类
- **implements**: 实现的接口
- **body**: 类体

```typescript
@Observed
class MyClass<T> extends BaseClass implements IMyInterface { ... }
```

### `interface_declaration`
- **name**: 接口名
- **type_parameters**: 泛型参数（可选）
- **extends**: 继承的接口
- **body**: 接口体

```typescript
interface MyInterface<T> extends BaseInterface { ... }
```

### `constructor_declaration`
- **visibility**: 可见性修饰符
- **parameters**: 参数列表
- **body**: 构造函数体

```typescript
public constructor(name: string) { ... }
```

---

## 函数相关

### `function_declaration`
- **name**: 函数名
- **type_parameters**: 泛型参数（可选）
- **parameters**: 参数列表
- **return_type**: 返回类型
- **body**: 函数体

```typescript
function myFunc<T>(param: T): void { ... }
```

### `decorated_function_declaration`
- **decorator**: 装饰器（至少一个）
- **name**: 函数名
- **type_parameters**: 泛型参数（可选）
- **parameters**: 参数列表
- **return_type**: 返回类型
- **body**: 函数体

```typescript
@Builder
function buildComponent() { ... }
```

### `method_declaration`
- **decorator**: 装饰器（可重复）
- **visibility**: 可见性修饰符
- **name**: 方法名
- **type_parameters**: 泛型参数（可选）
- **parameters**: 参数列表
- **return_type**: 返回类型
- **body**: 方法体

```typescript
@Builder
public myMethod<T>(param: T): void { ... }
```

### `arrow_function`
- **parameters**: 参数（可以是单个标识符或参数列表）
- **return_type**: 返回类型注解（可选）
- **body**: 函数体

```typescript
(x: number): number => x * 2
```

### `function_expression`
- **name**: 函数名（可选，用于命名函数表达式）
- **type_parameters**: 泛型参数（可选）
- **parameters**: 参数列表
- **return_type**: 返回类型
- **body**: 函数体

```typescript
const fn = function myFunc(x: number): number { return x * 2; }
```

---

## 变量和参数

### `variable_declaration`
- **kind**: 声明关键字（`var` | `let` | `const`）

```typescript
const x: number = 10
```

### `variable_declarator`
- **name**: 变量名
- **type**: 类型注解（可选）
- **value**: 初始值（可选）

```typescript
x: number = 10
```

### `parameter`
- **name**: 参数名
- **type**: 类型注解（可选）
- **default_value**: 默认值（可选）

```typescript
function fn(x: number = 0) { ... }
```

### `type_parameter`
- **name**: 类型参数名
- **constraint**: 类型约束（可选）
- **default**: 默认类型（可选）

```typescript
<T extends BaseType = DefaultType>
```

---

## 表达式

### `binary_expression`
- **left**: 左操作数
- **operator**: 运算符（`+`, `-`, `*`, `/`, `&&`, `||`, 等）
- **right**: 右操作数

```typescript
a + b
```

### `unary_expression`
- **operator**: 一元运算符（`!`, `~`, `-`, `+`, `typeof`, `void`, `delete`）
- **argument**: 操作数

```typescript
!isTrue
```

### `assignment_expression`
- **left**: 左值
- **operator**: 赋值运算符（`=`, `+=`, `-=`, 等）
- **right**: 右值

```typescript
x += 5
```

### `conditional_expression`
- **condition**: 条件表达式
- **consequence**: 条件为真时的值
- **alternative**: 条件为假时的值

```typescript
x > 0 ? "positive" : "negative"
```

### `call_expression`
- **function**: 被调用的函数
- **type_arguments**: 泛型参数（可选）
- **arguments**: 实参列表

```typescript
myFunc<string>("hello")
```

### `member_expression`
- **object**: 对象
- **property**: 属性名

```typescript
obj.property
obj?.property  // 可选链
```

### `subscript_expression`
- **object**: 被索引的对象
- **index**: 索引表达式

```typescript
arr[0]
obj?.[key]  // 可选链索引
```

### `new_expression`
- **constructor**: 构造函数
- **type_arguments**: 泛型参数（可选）
- **arguments**: 构造参数

```typescript
new MyClass<T>(args)
```

### `update_expression`
- **operator**: 更新运算符（`++` | `--`）
- **argument**: 操作数

```typescript
i++
++i
```

### `await_expression`
- **argument**: 等待的表达式

```typescript
await promise
```

### `as_expression`
- **expression**: 被断言的表达式
- **type**: 目标类型

```typescript
value as string
```

### `import_expression`
- **source**: 模块路径

```typescript
import("./module")
```

### `state_binding_expression`
- **argument**: 绑定的状态变量

```typescript
$count
```

### `parenthesized_expression`
- **expression**: 括号内的表达式

```typescript
(x + y)
```

### `non_null_assertion_expression`
- **expression**: 被断言非空的表达式

```typescript
value!
```

### `spread_element`
- **argument**: 展开的表达式

```typescript
...array
```

---

## 类型系统

### `type_declaration`
- **name**: 类型别名名称
- **type_parameters**: 泛型参数（可选）
- **definition**: 类型定义

```typescript
type MyType<T> = T | null
```

### `enum_declaration`
- **name**: 枚举名称
- **body**: 枚举体

```typescript
enum Color { Red, Green, Blue }
```

### `enum_member`
- **name**: 枚举成员名
- **value**: 枚举值（可选）

```typescript
Red = 1
```

### `generic_type`
- **name**: 泛型类型名
- **type_arguments**: 类型参数

```typescript
Array<string>
Promise<number>
```

### `qualified_type`
- **namespace**: 命名空间
- **name**: 类型名

```typescript
window.WindowStage
```

### `union_type`
- **type**: 联合类型的各个成员（可重复）

```typescript
string | number | boolean
```

### `function_type`
- **parameters**: 参数列表
- **return_type**: 返回类型

```typescript
(x: number) => string
```

### `array_type`
- **element**: 元素类型

```typescript
number[]
string[][]
```

### `tuple_type`
- **element**: 元组元素类型（可重复）

```typescript
[string, number, boolean]
```

### `conditional_type`
- **check_type**: 检查的类型
- **extends_type**: 继承约束类型
- **true_type**: 条件为真时的类型
- **false_type**: 条件为假时的类型

```typescript
T extends U ? X : Y
```

### `type_member`（用于接口和对象类型）
- **name**: 成员名
- **type**: 类型注解（用于属性）
- **type_parameters**: 泛型参数（用于方法，可选）
- **parameters**: 参数列表（用于方法）
- **return_type**: 返回类型（用于方法）

```typescript
property: string
method<T>(param: T): void
```

---

## 导入导出

### `import_declaration`
根据导入类型不同，包含以下 field：
- **default_import**: 默认导入的标识符
- **named_imports**: 命名导入列表
- **namespace**: 命名空间导入的标识符
- **source**: 导入源路径

```typescript
import DefaultExport, { named1, named2 } from './module'
import * as ns from './module'
```

### `import_specifier`
- **name**: 导入的名称
- **alias**: 别名（可选）

```typescript
{ original as alias }
```

### `decorated_export_declaration`
导出声明中的各个元素都会有对应的 field（参见相应的声明类型）

```typescript
@Component
export struct MyComponent { ... }
```

---

## 控制流

### `if_statement`
- **condition**: 条件表达式
- **consequence**: 条件为真时执行的语句
- **alternative**: else 分支（可选）

```typescript
if (condition) { ... } else { ... }
```

### `ui_if_statement`
- **condition**: 条件表达式
- **alternative**: else 分支（可选）

```typescript
if (show) {
  Text("Visible")
} else {
  Text("Hidden")
}
```

### `for_statement`
根据循环类型不同，包含以下 field：
- **left**: 循环变量（for-in/for-of）
- **right**: 可迭代对象（for-in/for-of）
- **init**: 初始化表达式（传统 for）
- **condition**: 循环条件
- **update**: 更新表达式
- **body**: 循环体

```typescript
for (let i = 0; i < 10; i++) { ... }
for (let item of array) { ... }
for (let key in object) { ... }
```

### `while_statement`
- **condition**: 循环条件
- **body**: 循环体

```typescript
while (condition) { ... }
```

### `break_statement` / `continue_statement`
- **label**: 标签（可选）

```typescript
break label
continue label
```

### `return_statement`
- **argument**: 返回值（可选）

```typescript
return value
```

### `try_statement`
- **body**: try 块
- **handler**: catch 子句（可选）
- **finalizer**: finally 子句（可选）

```typescript
try { ... } catch (e) { ... } finally { ... }
```

### `catch_clause`
- **parameter**: 异常参数
- **type**: 异常类型注解（可选）
- **body**: catch 块

```typescript
catch (error: Error) { ... }
```

### `finally_clause`
- **body**: finally 块

```typescript
finally { ... }
```

### `throw_statement`
- **argument**: 抛出的异常

```typescript
throw new Error("message")
```

---

## UI 组件

### `modifier_chain_expression`
- **name**: 修饰符名称
- **arguments**: 修饰符参数（可选）

```typescript
.width(100)
.height(200)
```

### `ui_component`
根据组件类型不同，包含以下 field：
- **name**: 组件名称（自定义组件）
- **content**: 文本内容（Text）
- **src**: 图片源（Image）
- **body**: 容器内容体（布局组件）

```typescript
Text("Hello")
Image($r('app.media.icon'))
Column() { ... }
MyComponent() { ... }
```

### `ui_custom_component_statement`
- **component**: 组件名
- **arguments**: 组件参数

```typescript
MyComponent({ prop: value });
```

### `for_each_statement`
- **data**: 数据源
- **builder**: UI 构建箭头函数
- **key_generator**: 键生成器（可选）

```typescript
ForEach(items, (item) => { Text(item) }, (item) => item.id)
```

### `lazy_for_each_statement`
- **data**: 数据源
- **builder**: UI 构建箭头函数
- **key_generator**: 键生成器（可选）

```typescript
LazyForEach(dataSource, (item) => { Text(item) })
```

### `ui_builder_arrow_function`
- **parameters**: 参数
- **return_type**: 返回类型注解（可选）
- **body**: 函数体

```typescript
(item: string) => { Text(item) }
```

---

## 对象和数组

### `object_literal`
- **property**: 对象属性（可重复）

```typescript
{ key: value, method() { ... } }
```

### `property_assignment`
根据属性类型不同，包含以下 field：
- **key**: 属性键（键值对）
- **value**: 属性值（键值对）
- **name**: 方法名（对象方法）
- **parameters**: 方法参数（对象方法）
- **return_type**: 返回类型（对象方法）
- **body**: 方法体（对象方法）
- **shorthand**: 简写属性
- **argument**: 展开运算符的参数

```typescript
{
  key: value,
  method(x: number): void { ... },
  shorthand,
  ...spread
}
```

### `array_literal`
- **element**: 数组元素（可重复）

```typescript
[1, 2, 3, ...rest]
```

---

## 模板和资源

### `template_substitution`
- **expression**: 模板替换表达式

```typescript
`Hello ${name}!`
```

### `resource_expression`
- **argument**: 资源参数（可重复）

```typescript
$r('app.string.hello', param1, param2)
```

---

## 使用说明

在编写语法高亮查询时，可以使用这些 field 来精确匹配语法树节点的特定部分。例如：

```scheme
; 高亮函数名
(function_declaration
  name: (identifier) @function)

; 高亮装饰器名称
(decorator
  name: (_) @decorator)

; 高亮类名
(class_declaration
  name: (identifier) @type)

; 高亮二元运算符
(binary_expression
  operator: _ @operator)
```

这些 field 使得语法树查询更加精确和易于维护。
