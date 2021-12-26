<template>
  <div id="app">
    <div class="input-container">
      <input type="text" placeholder="please input search text" @input="handleSearchInput" v-model="searchText" class="search-input" />
      <svg-icon icon-class="search" class="icon"></svg-icon>
    </div>
    <div class="mail-container" ref="mailContainer" @scroll="onMailScroll">
      <div class="mail-list" ref="mailList">
        <div class="mail-list-item" v-for="(item, key) in renderMailList" :key="key">
          <!-- <template v-if="item.data.length > 0"> -->
            <div class="mail-list-item__header">{{ key }}</div>
            <div class="mail-list-item__content">
              <div class="mail-item" v-for="(val, index) in item.data" :key="val.id" @click="handleMailItemClick(val, key, index)">
                <img :src="val.avatar" class="mail-item__image" alt="">
                <p class="mail-item__name">{{ val.name }}<span class="relateSearch" v-if="val.recentlySearched">(Recently searched)</span></p>
              </div>
            </div>
          <!-- </template> -->
        </div>
      </div>
    </div>
    <div class="letter-container">
      <div class="icon-box" @click="preLetter">
        <svg-icon icon-class="up" class="icon"></svg-icon>
      </div>
      <div class="letter-item" v-for="(item, index) in letterList" :key="item" @click="handleLetterClick(item, index)">
        <p class="letter" :class="{ letterActive: index === letterActiveIndex }">{{ item }}</p>
      </div>
      <div class="icon-box" @click="nextLetter">
        <svg-icon icon-class="down" class="icon"></svg-icon>
      </div>
    </div>
    <person-detail :detail-message="detailMessage" :detail-show="detailDialogVisible" @preMsg="preMessage" @nextMsg="NextMessage" @dialogClose="dialogClose"/>
  </div>
</template>

<script>
import PersonDetail from './components/personDetail.vue'
import { queryMailList } from './api'
import { throttle, debounce } from 'lodash'

export default {
  name: 'App',
  components: {
    PersonDetail
  },
  data () {
    return {
      detailMessage: {},
      searchText: '',
      renderMailList: {
      },
      mailList: {
        A: {
          data: [],
          domHeight: 0
        },
        B: {
          data: [],
          domHeight: 0
        },
        C: {
          data: [],
          domHeight: 0
        },
        D: {
          data: [],
          domHeight: 0
        },
        E: {
          data: [],
          domHeight: 0
        },
        F: {
          data: [],
          domHeight: 0
        },
        G: {
          data: [],
          domHeight: 0
        },
        H: {
          data: [],
          domHeight: 0
        },
        I: {
          data: [],
          domHeight: 0
        },
        J: {
          data: [],
          domHeight: 0
        },
        K: {
          data: [],
          domHeight: 0
        },
        L: {
          data: [],
          domHeight: 0
        },
        M: {
          data: [],
          domHeight: 0
        },
        N: {
          data: [],
          domHeight: 0
        },
        O: {
          data: [],
          domHeight: 0
        },
        P: {
          data: [],
          domHeight: 0
        },
        Q: {
          data: [],
          domHeight: 0
        },
        R: {
          data: [],
          domHeight: 0
        },
        S: {
          data: [],
          domHeight: 0
        },
        T: {
          data: [],
          domHeight: 0
        },
        U: {
          data: [],
          domHeight: 0
        },
        V: {
          data: [],
          domHeight: 0
        },
        W: {
          data: [],
          domHeight: 0
        },
        X: {
          data: [],
          domHeight: 0
        },
        Y: {
          data: [],
          domHeight: 0
        },
        Z: {
          data: [],
          domHeight: 0
        }
      },
      detailDialogVisible: false,
      currentIndex: 0, // 记录首屏渲染到哪个字母了
      letterActiveIndex: 0,
      currentDialogKey: null,
      currentDialogIndex: null,
      mailLetterList: []
    }
  },
  computed: {
    letterList () {
      const hasMailData = Object.keys(this.mailList).filter(letter => this.mailList[letter].data.length > 0)
      return hasMailData
    }
  },
  created () {
    this.getMailList()
  },
  methods: {
    handleSearchInput () {
      this.handleSearchTextChange()
    },
    handleSearchTextChange: debounce(function () {
      this.getMailList()
    }, 800),
    async getMailList () {
      const { data } = await queryMailList({
        searchText: this.searchText,
        pageNum: 1,
        pageSize: 100
      })
      this.renderMailList = {}
      this.mailList = {
        A: {
          data: [],
          domHeight: 0
        },
        B: {
          data: [],
          domHeight: 0
        },
        C: {
          data: [],
          domHeight: 0
        },
        D: {
          data: [],
          domHeight: 0
        },
        E: {
          data: [],
          domHeight: 0
        },
        F: {
          data: [],
          domHeight: 0
        },
        G: {
          data: [],
          domHeight: 0
        },
        H: {
          data: [],
          domHeight: 0
        },
        I: {
          data: [],
          domHeight: 0
        },
        J: {
          data: [],
          domHeight: 0
        },
        K: {
          data: [],
          domHeight: 0
        },
        L: {
          data: [],
          domHeight: 0
        },
        M: {
          data: [],
          domHeight: 0
        },
        N: {
          data: [],
          domHeight: 0
        },
        O: {
          data: [],
          domHeight: 0
        },
        P: {
          data: [],
          domHeight: 0
        },
        Q: {
          data: [],
          domHeight: 0
        },
        R: {
          data: [],
          domHeight: 0
        },
        S: {
          data: [],
          domHeight: 0
        },
        T: {
          data: [],
          domHeight: 0
        },
        U: {
          data: [],
          domHeight: 0
        },
        V: {
          data: [],
          domHeight: 0
        },
        W: {
          data: [],
          domHeight: 0
        },
        X: {
          data: [],
          domHeight: 0
        },
        Y: {
          data: [],
          domHeight: 0
        },
        Z: {
          data: [],
          domHeight: 0
        }
      }
      // 将返回值根据姓名首字母添加到对应首字母对象数据中
      data.forEach(item => {
        this.mailList[item.name[0].toUpperCase()].data.push(item)
      })
      this.mailLetterList = Object.keys(this.mailList)
      // 计算出每一个字母中人员所占用的 DOM 高度
      this.mailLetterList.forEach(item => {
        this.$set(this.mailList[item], 'domHeight', this.mailList[item].data.length === 0 ? 0 : (this.mailList[item].data.length * 40 + 44))
      })
      // 计算出 通讯录应该有的总的高度
      let totalHeight = 0
      this.mailLetterList.forEach(item => {
        totalHeight += this.mailList[item].domHeight
      })
      if (this.$refs.mailList.clientHeight < totalHeight) {
        // 此情况为通讯录列表实际会超出 DOM class 为 mail-container 自适应高度 应手动设置使其出现滚动条
        let originHeight = this.$refs.mailList.clientHeight
        this.$refs.mailList.style.height = totalHeight + 'px'
        // 只渲染出屏幕能看到的通讯录列表 剩下的采用监听滚动事件 懒加载形式 渲染
        for (let i = 0; i < this.mailLetterList.length; i++) {
          originHeight -= this.mailList[this.mailLetterList[i]].domHeight
          if (this.mailList[this.mailLetterList[i]].data.length > 0) {
            this.$set(this.renderMailList, this.mailLetterList[i], this.mailList[this.mailLetterList[i]])
          }
          if (originHeight <= 0) {
            this.currentIndex = i
            break
          }
        }
      } else {
        // 此情况代表通讯录列表所有数据都能在首屏可视区域内展示出来，不需要懒加载
        this.mailLetterList.forEach(item => {
          if (this.mailList[item].data.length > 0) {
            this.$set(this.renderMailList, item, this.mailList[item])
          }
        })
      }
    },
    // 懒加载 做节流处理
    lazyLoad: throttle(function (scrollTop) {
      // 滚动了多少距离就懒加载多少高度
      for (let i = this.currentIndex + 1; i < this.mailLetterList.length; i++) {
        scrollTop -= this.mailList[this.mailLetterList[i]].domHeight
        if (this.mailList[this.mailLetterList[i]].data.length > 0) {
          this.$set(this.renderMailList, this.mailLetterList[i], this.mailList[this.mailLetterList[i]])
        }
        if (scrollTop <= 0) {
          this.currentIndex = i
          break
        }
      }
    }, 500),
    handleMailItemClick (mailItem, key, index) {
      this.currentDialogKey = key
      this.currentDialogIndex = index
      this.detailMessage = mailItem
      this.detailDialogVisible = true
    },
    handleLetterClick (letter, index) {
      this.letterActiveIndex = index
      let letterIndex
      let scrollTop = 0
      this.mailLetterList.forEach((item, index) => {
        if (item === letter) {
          letterIndex = index
        }
      })
      for (let i = 0; i < letterIndex; i++) {
        scrollTop += this.mailList[this.mailLetterList[i]].domHeight
      }
      this.$refs.mailContainer.scrollTop = scrollTop
    },
    preLetter () {
      if (this.letterActiveIndex > 0) {
        this.handleLetterClick(this.letterList[this.letterActiveIndex - 1], this.letterActiveIndex - 1)
      }
    },
    nextLetter () {
      if (this.letterActiveIndex < this.letterList.length - 1) {
        this.handleLetterClick(this.letterList[this.letterActiveIndex + 1], this.letterActiveIndex + 1)
      }
    },
    onMailScroll () {
      this.lazyLoad(this.$refs.mailContainer.scrollTop)
    },
    dialogClose () {
      this.detailDialogVisible = false
    },
    preMessage () {
      if (this.currentDialogIndex === 0) {
        if (this.currentDialogKey === 'A') {
          // 已经是第一个 没有上一个了
          return
        }
        let letter
        this.letterList.forEach((item, index) => {
          if (item === this.currentDialogKey) {
            letter = this.letterList[index - 1]
          }
        })
        this.handleMailItemClick(this.mailList[letter].data[this.mailList[letter].data.length - 1], letter, this.mailList[letter].data.length - 1)
      } else {
        this.handleMailItemClick(this.mailList[this.currentDialogKey].data[this.currentDialogIndex - 1], this.currentDialogKey, this.currentDialogIndex - 1)
      }
    },
    NextMessage () {
      if (this.currentDialogIndex === this.mailList[this.currentDialogKey].data.length - 1) {
        if (this.currentDialogKey === this.letterList[this.letterList.length - 1]) {
          // 已经是最后一个没有下一个了
          return
        }
        let letter
        this.letterList.forEach((item, index) => {
          if (item === this.currentDialogKey) {
            letter = this.letterList[index + 1]
          }
        })
        this.handleMailItemClick(this.mailList[letter].data[0], letter, 0)
      } else {
        this.handleMailItemClick(this.mailList[this.currentDialogKey].data[this.currentDialogIndex + 1], this.currentDialogKey, this.currentDialogIndex + 1)
      }
    }
  }
}
</script>

<style lang="scss">
#app {
  width: 100vw;
  max-width: 750px;
  margin: 0 auto;
  height: 100vh;
  max-height: 1334px;
  padding: 70px;
  box-sizing: border-box;
  position: relative;
  .input-container {
    width: 100%;
    position: relative;
    margin-bottom: 20px;
    .search-input {
      border: none;
      border-bottom: 2px solid #eee;
      padding-left: 50px;
      width: 100%;
      height: 40px;
    }
    .icon {
      width: 30px;
      height: 30px;
      position: absolute;
      left: 10px;
      top: 50%;
      transform: translateY(-50%);
    }
  }
  .mail-container {
    height: calc(100% - 60px);
    margin-top: 20px;
    overflow: auto;
    .mail-list {
      width: 100%;
      height: 100%;
      &-item {
        margin-bottom: 10px;
        width: 100%;
        cursor: pointer;
        &__header {
          width: 100%;
          height: 24px;
          font-size: 14px;
          line-height: 24px;
          color: rgb(124, 124, 124);
          padding-left: 6px;
          border-bottom: 2px solid rgb(95, 95, 95);
          box-sizing: border-box;
        }
        &__content {
          width: 100%;
          padding-top: 10px;
          .mail-item {
            width: 100%;
            height: 40px;
            padding-left: 6px;
            box-sizing: border-box;
            display: flex;
            flex-direction: row;
            flex-wrap: nowrap;
            align-items: center;
            &__image {
              width: 30px;
              height: 30px;
              border-radius: 6px;
              margin-right: 14px;
            }
            &__name {
              font-size: 18px;
              font-weight: bold;
              color: #333;
              .relateSearch {
                font-size: 14px;
                color: rgb(136, 136, 136);
                margin-left: 8px;
              }
            }
          }
        }
      }
    }
  }
  .letter-container {
    width: 50px;
    max-height: 320px;
    overflow: auto;
    position: absolute;
    right: 10px;
    top: 50%;
    transform: translateY(-50%);
    display: flex;
    flex-direction: column;
    flex-wrap: nowrap;
    .icon-box {
      width: 100%;
      .icon {
        width: 30px;
        height: 30px;
        color: #333;
        cursor: pointer;
      }
    }
    .letter-item {
      width: 100%;
      margin: 6px 0;
      .letter {
        width: 30px;
        text-align: center;
        margin-bottom: 4px;
        font-size: 16px;
        color: #333;
        cursor: pointer;
        &:hover {
          color: #111;
          font-size: 18px;
        }
      }
      .letterActive {
        font-size: 18px;
        color: #111;
      }
    }
  }
}
</style>
