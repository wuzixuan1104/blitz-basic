const styles = require('./config/tw-styles');

module.exports = {
  purge: [
    './pages/**/*.{js,ts,jsx,tsx}',
    './pages/*.{js,ts,jsx,tsx}',
    './app/**/*.{js,ts,jsx,tsx}',
    './core/**/*.{js,ts,jsx,tsx}',
  ],
  darkMode: false, // or 'media' or 'class'
  theme: {
    colors: styles.colors,
    borderRadius: styles.borderRadius,
    fontSize: styles.fontSize,
    screens: styles.screens,
    fontFamily: styles.fontFamily,
    extend: {
      spacing: styles.spacing,
      minHeight: styles.minHeight
    },
    container: {
      center: true
    }
  },
  variants: {
    extend: {
      margin: ['first', 'last', 'even', 'odd']
    }
  },
  plugins: []
};
