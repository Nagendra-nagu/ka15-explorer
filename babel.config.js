module.exports = function(api) {
  var validEnv = ['development', 'test', 'production'];
  var currentEnv = api.env();

  if (!validEnv.includes(currentEnv)) {
    throw new Error(
      'Please specify a valid `NODE_ENV` or ' +
        '`BABEL_ENV` environment variable. Valid values are "development", ' +
        '"test", and "production". Instead, received: ' +
        JSON.stringify(currentEnv) +
        '.'
    );
  }

  return {
    presets: [
      currentEnv === 'test' && [
        '@babel/preset-env',
        {
          targets: {
            node: 'current'
          }
        }
      ],
      (currentEnv === 'production' || currentEnv === 'development') && [
        '@babel/preset-env',
        {
          forceAllTransforms: true,
          useBuiltIns: 'entry',
          corejs: 3,
          modules: false
        }
      ]
    ].filter(Boolean),
    plugins: [
      '@babel/plugin-syntax-dynamic-import',
      '@babel/plugin-transform-destructuring',
      '@babel/plugin-proposal-class-properties',
      '@babel/plugin-proposal-object-rest-spread',
      '@babel/plugin-proposal-private-methods',
      '@babel/plugin-proposal-private-property-in-object',
      '@babel/plugin-transform-runtime',
      '@babel/plugin-transform-regenerator',
      '@babel/plugin-proposal-nullish-coalescing-operator',
      '@babel/plugin-proposal-optional-chaining'
    ].filter(Boolean)
  };
};
