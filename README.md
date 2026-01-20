

<h1 align="center">
  <br>
  <img src="https://github.com/Reagan1947/KityMinder-Plus/blob/main/mind-icon.png?raw=true" alt="KityMinder Plus" width="170">
  <br>
  KityMinder Plus
  <br>
</h1>

<h4 align="center" font-weight:bold;">An easier-to-use open-source mind map tool.</h4>
<p align="center">
<img src="https://img.shields.io/badge/License-GNU-%23373737">
<img src="https://img.shields.io/badge/Dependency-AngularJS-lightgrey">
</p>

## 1.1 Generation

Kity Minder Plus is an optimized and enhanced version of KityMinder, designed to better adapt to modern front-end technology frameworks.

## 1.2 Detail Info

### 1.2.1 Phase

This project is currently in its first phase, which includes:

1. Adjusting UI page styles
2. Optimizing interaction logic

### 1.2.2 Ohter information

This project is developed based on the Kityminder Editor. The original project address is: https://github.com/fex-team/kityminder-editor

## 1.3 Developemt and Building

### 1.3.1 Development

The index.html file in the root directory is for the development environment, while the index.html file in the dist directory uses the packaged code and is suitable for production environments.

Install Node.js and npm
Initialization: Navigate to the kityminder-editor root directory and run `npm run init`
Launch the project by running `grunt dev` in the kityminder-editor root directory
You can develop based on the index.html in the root directory or review the production-ready index.html in the dist directory. Enjoy it!
Additionally, kityminder-editor provides a Bower package for developers to use directly. In your project directory where kityminder-editor is needed, run `bower install kityminder-editor`. Then manually include the CSS and JS files kityminder-editor depends on—refer to `index.html` in the `dist` directory for specifics. We recommend using the npm package wireDep for automated setup; see `Gruntfile.js` in the root directory for details.

### 1.3.2 Buiklding

Run `grunt build`. Once completed, the `dist` directory will contain a fully functional kityminder-editor. Double-click `index.html` to open and run the example.

### 1.3.3 Initial Setting

Users can configure kityminder-editor as needed. The specific usage method is as follows:

```js
angular.module('kityminderDemo', ['kityminderEditor'])
    .config(function (configProvider) {
        configProvider.set('imageUpload', 'path/to/image/upload/handler');
    });
```

## 1.4 License

This project is developed and written under the GNU License.
