require("@rails/ujs").start()
require("@rails/activestorage").start()

// CSS
import('scss/site')

// JS
import('js/site')

// Images
const images = require.context('../images', true)
const imagePath = (name) => images(name, true)
