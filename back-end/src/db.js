const mysql2 = require('mysql2')
const dayjs = require('dayjs')

const connectionPool = mysql2.createPool({
  host: 'localhost',
  user: 'root',
  password: '123456',
  database: 'mail',
  waitForConnections: true,
  connectionLimit: 10,
  queueLimit: 0
})

const promisePool = connectionPool.promise()

// 增加一条通讯录表记录
const addMail = async (addForm) => {
  const value = [addForm.name, addForm.followers, addForm.stars, addForm.email, addForm.bio, addForm.avatar, new Date()]
  const sql = 'insert into mail_list(`name`, `followers`, `stars`, `email`, `bio`, `avatar`, `create_time`) values (?, ?, ?, ?, ?, ?, ?)'
  console.log(value)
  console.log(connectionPool.format(sql, value))
  try {
    await promisePool.execute(sql, value)
  } catch (e) {
    throw new Error(e)
  }
}

// 分页查询通讯录表
const queryMailList = async (queryParams) => {
  let value, sql
  if (queryParams.searchText) {
    value = [queryParams.searchText + '%', (queryParams.pageNum - 1) * queryParams.pageSize, queryParams.pageSize]
    sql = "select a.*, b.search_time, b.create_time as searchRecordCreateTime from mail_list as a left join mail_search_record as b on b.mail_id = a.id where a.name like ? limit ?,?;"
  } else {
    value = [(queryParams.pageNum - 1) * queryParams.pageSize, queryParams.pageSize]
    sql = "select a.*, b.search_time, b.create_time as searchRecordCreateTime from mail_list as a left join mail_search_record as b on b.mail_id = a.id limit ?,?;"
  }
  
  try {
    const [rows] = await promisePool.query(sql,value)
    if (queryParams.searchText) {
      // 新查询数据直接新增
      const newData = rows.filter(item => !item.search_time)
      console.log('newData', newData)
      if (newData.length > 0) {
        addSearchRecord(newData)
      }

      // 以及被搜索过的数据
      const oldData = rows.filter(item => item.search_time)
      console.log('oldData', oldData)
      if (oldData.length > 0) { 
        editSearchRecord(oldData)
      }
    }
    // 筛选最近一天的搜索记录
    const currentDay = dayjs()
    rows.forEach(item => {
      if (dayjs(currentDay).diff(dayjs(item.search_time), 'day') <= 1) {
        item.recentlySearched = true
      } else {
        item.recentlySearched = false
      }
    })
    return rows
  } catch (e) {
    throw new Error(e)
  }
}

// 查询记录表增加记录
const addSearchRecord = async (mailData) => {
  const values = mailData.map(item => {
    return [item.id, new Date()]
  })
  const sql = "insert into mail_search_record(`mail_id`, `search_time`) values ?"
  const formatSql = connectionPool.format(sql, [values])
  try {
    await promisePool.query(formatSql)
  } catch (e) {
    throw new Error(e)
  }
}

// 查询记录表更新记录
const editSearchRecord = async (mailData) => {
  // 先删除存在的再新增
  const deleteValues = mailData.map(item => item.id)
  const addValues = mailData.map(item => {
    return [item.id, new Date()]
  })
  let deleteSql, addSql
  if (deleteValues.length > 1) {
    deleteSql = 'delete from mail_search_record where mail_id in ?'
    addSql = "insert into mail_search_record(`mail_id`, `search_time`) values ?"
  } else {
    deleteSql = 'delete from mail_search_record where mail_id = ?'
    addSql = "insert into mail_search_record(`mail_id`, `search_time`) values (?, ?)"
  }
  try {
    connectionPool.getConnection((error, coon) => {
      if (error) {
        throw new Error(error)
      }
      coon.beginTransaction((err) => {
        if (err) {
          throw new Error(err)
        }
        coon.query(deleteSql, [deleteValues])
        coon.query(addSql, addValues.length > 1 ? addValues : addValues[0])
        coon.commit((e) => {
          if (e) {
            throw new Error(err)
          }
          coon.release()
        })
      })
    })
  } catch (e) {
    throw new Error(e)
  }
}

process.on('exit', async () => {
  try { await connectionPool.end() } catch (e) {}
})

module.exports = {
  queryMailList,
  addMail
}