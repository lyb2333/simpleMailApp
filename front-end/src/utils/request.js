import axios from 'axios'

const server = axios.create({
  baseURL: process.env.VUE_APP_BASE_API,
  timeout: 30000
})

// 请求拦截
server.interceptors.request.use(
  config => {
    // if (store.getters.token) {
    //   config.headers.token = getToken()
    // }
    return config
  },
  error => {
    // do something with request error
    console.log(error) // for debug
    return Promise.reject(error)
  }
)

// 响应拦截
server.interceptors.response.use(
  /**
   * If you want to get http information such as headers or status
   * Please return  response => response
  */

  /**
   * Determine the request status by custom code
   * Here is just an example
   * You can also judge the status by HTTP Status Code
   */
  response => {
    const res = response.data

    if (res.code === 500) {
      // 弹出框提示错误
      return Promise.reject(new Error(res.message || 'Error'))
    }

    return res

    // if (res.type) return res
    // // if the custom code is not 20000, it is judged as an error.
    // if (res.code !== 0) {
    //   Message({
    //     message: res.message || 'Error',
    //     type: 'error',
    //     duration: 5 * 1000
    //   })

    //   // 50008: Illegal token; 50012: Other clients logged in; 50014: Token expired;
    //   if (res.code === 401) {
    //     // to re-login
    //     Message({
    //       message: '登录状态过期，请重新登录',
    //       type: 'error'
    //     })
    //     store.dispatch('user/resetToken').then(() => {
    //       location.reload()
    //     })
    //   }
    //   return Promise.reject(new Error(res.message || 'Error'))
    // } else {
    //   return res
    // }
  },
  error => {
    console.log('err' + error) // for debug
    // Message({
    //   message: error.message,
    //   type: 'error',
    //   duration: 5 * 1000
    // })
    return Promise.reject(error)
  }
)

export default server
