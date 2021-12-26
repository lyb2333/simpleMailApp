class Response {
  constructor (code, data, message) {
    this.code = code || 200,
    this.data = data || {},
    this.message = message || 'request success'
  }

  static success (data) {
    return new Response(200, data, 'request success')
  }

  static fail (code, data, message = 'unknow Reason') {
    return new Response(code, data, message)
  }
}

module.exports = Response