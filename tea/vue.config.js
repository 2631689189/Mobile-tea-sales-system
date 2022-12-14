module.exports = {
  //代理跨域
  devServer: {
    proxy: {
      '/api': {
        target: "http://127.0.0.1:3007",
        changeOrigin: true,
        pathRewrite: {
          '^/api': '/api'
        }
      }
    },
  },
}
