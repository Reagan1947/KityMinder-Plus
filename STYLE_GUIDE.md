# 样式修改指南

## 📁 项目样式结构

### 样式文件位置
- **主样式文件**: `less/editor.less` - 所有样式的入口文件
- **变量文件**: `less/_vars.less` - 颜色、尺寸等变量定义
- **组件样式**: `less/topTab/` - 按功能分类的组件样式

### 样式文件组织

```
less/
├── editor.less              # 主入口文件
├── _vars.less              # 全局变量（颜色、尺寸等）
├── _navigator.less         # 导航器样式
├── _tool_group.less        # 工具组样式
├── imageDialog.less        # 图片对话框样式
└── topTab/                 # 顶部标签页样式
    ├── topTab.less         # 标签页基础样式
    ├── searchBox.less      # 搜索框样式
    ├── idea/               # 思维导图操作相关
    │   ├── appendNode.less
    │   ├── arrange.less
    │   ├── hyperlink.less
    │   ├── image.less
    │   ├── note.less
    │   ├── noteEditor.less
    │   ├── operation.less
    │   ├── priority.less
    │   ├── progress.less
    │   ├── resource.less
    │   └── undoRedo.less
    ├── appearance/         # 外观相关
    │   ├── colorPanel.less
    │   ├── fontOperator.less
    │   ├── layout.less
    │   ├── styleOperator.less
    │   ├── templatePanel.less
    │   └── themePanel.less
    └── view/               # 视图相关
        ├── expand.less
        ├── search.less
        └── select.less
```

## 🎨 如何修改样式

### 方法一：修改现有样式文件（推荐）

1. **找到对应的样式文件**
   - 根据组件名称在 `less/topTab/` 目录下找到对应的 `.less` 文件
   - 例如：修改操作按钮样式 → `less/topTab/idea/operation.less`

2. **修改样式代码**
   - 直接编辑对应的 `.less` 文件
   - 可以使用 Less 的变量、嵌套、混合等特性

3. **编译样式**
   ```bash
   # 开发模式（自动编译并监听文件变化）
   npm run dev
   
   # 或仅构建一次
   npm run build
   ```

### 方法二：修改全局变量

如果需要修改全局的颜色、尺寸等，编辑 `less/_vars.less`：

```less
// 修改按钮悬停颜色
@button-hover: hsl(222, 55%, 96%);

// 修改工具悬停颜色
@tool-hover: #eff3fa;
```

### 方法三：添加自定义样式

1. **创建新的样式文件**
   - 在 `less/` 或 `less/topTab/` 下创建新的 `.less` 文件

2. **在 editor.less 中导入**
   ```less
   @import (less) "your-custom-style.less";
   ```

## 🔧 常用修改示例

### 修改按钮颜色
编辑 `less/_vars.less`：
```less
@button-hover: #your-color;
@button-active: #your-color;
```

### 修改标签页背景色
编辑 `less/topTab/topTab.less`：
```less
.top-tab {
    .nav-tabs {
        background-color: #your-color;  // 修改这里
    }
}
```

### 修改按钮尺寸
编辑对应的组件样式文件，例如 `less/topTab/idea/operation.less`：
```less
.km-btn-item {
    padding: 5px 10px;  // 修改内边距
    font-size: 14px;    // 修改字体大小
}
```

## 📦 组件与样式文件对应关系

| 组件名称 | HTML 文件 | 样式文件 |
|---------|----------|---------|
| 操作按钮 | `ui/directive/operation/operation.html` | `less/topTab/idea/operation.less` |
| 颜色面板 | `ui/directive/colorPanel/colorPanel.html` | `less/topTab/appearance/colorPanel.less` |
| 字体操作 | `ui/directive/fontOperator/fontOperator.html` | `less/topTab/appearance/fontOperator.less` |
| 布局 | `ui/directive/layout/layout.html` | `less/topTab/appearance/layout.less` |
| 主题面板 | `ui/directive/themeList/themeList.html` | `less/topTab/appearance/themePanel.less` |
| 添加节点 | `ui/directive/appendNode/appendNode.html` | `less/topTab/idea/appendNode.less` |
| 撤销重做 | `ui/directive/undoRedo/undoRedo.html` | `less/topTab/idea/undoRedo.less` |

## 🚀 构建命令

```bash
# 初始化项目（首次运行）
npm run init

# 开发模式（自动编译并监听）
npm run dev

# 构建生产版本
npm run build

# 仅编译 Less 文件（如果已安装 less）
lessc --source-map less/editor.less dist/kityminder.editor.css
```

## 💡 提示

1. **样式文件使用 Less 语法**，支持变量、嵌套、混合等特性
2. **修改后需要重新编译**，样式才会生效
3. **开发时使用 `npm run dev`**，会自动监听文件变化并重新编译
4. **查看编译后的 CSS**：`dist/kityminder.editor.css`
5. **样式类名通常与组件名称对应**，例如 `.operation-group` 对应 operation 组件

## 🔍 调试技巧

1. 在浏览器开发者工具中查看元素，找到对应的 CSS 类名
2. 根据类名在 `less/` 目录下搜索对应的样式文件
3. 修改样式后重新编译查看效果
