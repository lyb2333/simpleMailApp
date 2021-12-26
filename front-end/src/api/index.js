import request from '@/utils/request'

// 查询通讯录列表
export const queryMailList = data => {
  return request({
    method: 'POST',
    url: '/mail/query',
    data
  })
}
