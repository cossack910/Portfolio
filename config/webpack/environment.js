const { environment } = require('@rails/webpacker')
const webpack = require('webpack')
// environment.plugins.prepend(
//   'Provide',
//   new webpack.ProvidePlugin({
//       $: 'jquery',
//       jQuery: 'jquery',
//       jquery: 'jquery',
//       Popper: 'popper.js/dist/popper'
//   })
// )
// environment.plugins.prepend('Provide',
//     new webpack.ProvidePlugin({
//         $: 'jquery/src/jquery',
//         jQuery: 'jquery/src/jquery'
//     })
// )
// environment.plugins.append(
//     'Provide',
//     new webpack.ProvidePlugin({
//       $: 'jquery/src/jquery',
//       jQuery: 'jquery/src/jquery',
//       Popper: ['popper.js', 'default']
//     })
// )

module.exports = environment
