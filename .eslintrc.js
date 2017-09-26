module.exports = {
  "env": {
    "browser": true,
    "es6": true
  },
  "extends": [
    "eslint:recommended",
    'plugin:vue/recommended' // or 'plugin:vue/base'
  ],
  "parserOptions": {
    "sourceType": "module"
  },
  "rules": {
    "indent": [
      "error",
      2
    ],
    "linebreak-style": [
      "error",
      "unix"
    ],
    "quotes": [
      "error",
      "single"
    ],
    "semi": [
      "error",
      "always"
    ],
    'vue/valid-v-if': 'error',
  },
  "globals": {
    "window": false,
    "process": false,
    "module": false,
    "require": false,
    "__dirname": false,
  },
};
