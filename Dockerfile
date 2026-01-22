# 构建阶段
FROM node:14-alpine AS builder

# 设置工作目录
WORKDIR /app

# 安装全局依赖
RUN npm install -g grunt bower less

# 复制 package.json 和 bower.json（利用 Docker 缓存）
COPY package.json package-lock.json ./
COPY bower.json .bowerrc ./

# 安装 Node.js 依赖
RUN npm install

# 安装 Bower 依赖
RUN bower install --allow-root

# 复制源代码和构建配置
COPY . .

# 构建项目
RUN grunt build

# 运行阶段
FROM pierrezemb/gostatic:latest

# 从构建阶段复制构建产物和必要的文件
COPY --from=builder /app/dist /srv/http/dist
COPY --from=builder /app/index.html /srv/http/
COPY --from=builder /app/favicon.ico /srv/http/
COPY --from=builder /app/bower_components /srv/http/bower_components
COPY --from=builder /app/node_modules/kityminder-core /srv/http/node_modules/kityminder-core
COPY --from=builder /app/node_modules/kity /srv/http/node_modules/kity
COPY --from=builder /app/ui /srv/http/ui
COPY --from=builder /app/server /srv/http/server

# 暴露端口
EXPOSE 8080

# 启动静态文件服务器
CMD ["-port", "8080", "-https-promote", "-enable-logging"]
