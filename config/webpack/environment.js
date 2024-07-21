const { environment } = require('@rails/webpacker');
const { resolve } = require('path');

// Get the existing Babel loader
const babelLoader = environment.loaders.get('babel');

// Check if babelLoader exists and modify its options
if (babelLoader) {
  babelLoader.use[0].options.plugins = [
    '@babel/plugin-proposal-class-properties',
    '@babel/plugin-proposal-object-rest-spread',
    '@babel/plugin-proposal-optional-chaining'
  ];
}

// Optionally, you can add custom configuration or plugins here
// For example, adding a plugin for Webpack

const webpack = require('webpack');
environment.plugins.prepend('Provide', new webpack.ProvidePlugin({
  $: 'jquery',
  jQuery: 'jquery'
}));

module.exports = environment;
