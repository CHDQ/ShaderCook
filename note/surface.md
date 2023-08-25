# 表面着色器基础知识点

## shader properties

| 类型                | 含义                                   | 默认值                   |
|-------------------|--------------------------------------|-----------------------|
| `Range(ming,max)` | `float`范围属性                          | `1`                   |
| `Color`           | 可以在面板拾取颜色`(float,float,float,float)` | `(1,1,1,1)`           |
| `2D`              | 创建纹理属性,允许直接拖拽纹理涂                     | `"defaulttexture" {}` |
| `Rect`            | 创建一个非2次方的纹理图,作为2D gui元素              | `"defaulttexture" {}` |
| `Cube`            | 立方体贴图,允许用户直接拖拽立方体贴图作为着色器属性           | `"defaulttexture" {}` |
| `Float`           | 非滑动的`float`属性                        | `1`                   |
| `Vector`          | 4元素的`float`属性,方向或者颜色                 | `(1,1,1,1)`           |




