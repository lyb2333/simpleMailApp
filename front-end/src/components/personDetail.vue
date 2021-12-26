<template>
  <transition name="fade">
    <div class="background" v-show="detailShow" @click="handleDialogClose">
      <div class="detail-container">
        <div class="icon-box" @click.stop="preMessage">
          <svg-icon icon-class="up" class="icon"></svg-icon>
        </div>
        <div class="message-container">
          <div class="message-container-header">
            <img :src="detailMessage.avatar" class="message-container-header__image" alt="">
            <div class="message-container-header__name">
              <p class="name">{{ detailMessage.name }}</p>
              <div class="followers-stars">
                <div class="followers">
                  <svg-icon icon-class="followers"></svg-icon>
                  <span class="numbers">{{ detailMessage.followers }} followers</span>
                </div>
                <div class="stars">
                  <svg-icon icon-class="stars"></svg-icon>
                  <span class="numbers">{{ detailMessage.stars }} stars</span>
                </div>
              </div>
            </div>
          </div>
          <div class="email-container">
            <svg-icon icon-class="email"></svg-icon>
            <p class="email">{{ detailMessage.email }}</p>
          </div>
          <div class="bio-container">
            <svg-icon icon-class="bio"></svg-icon>
            <p class="bio">{{ detailMessage.bio }}</p>
          </div>
        </div>
        <div class="icon-box" @click.stop="NextMessage">
          <svg-icon icon-class="down" class="icon"></svg-icon>
        </div>
      </div>
    </div>
  </transition>
</template>

<script>
export default {
  name: 'PersonDetail',
  props: {
    detailMessage: {
      type: Object,
      required: true
    },
    detailShow: {
      type: Boolean,
      required: true
    }
  },
  methods: {
    preMessage () {
      this.$emit('preMsg')
    },
    NextMessage () {
      this.$emit('nextMsg')
    },
    handleDialogClose () {
      this.$emit('dialogClose')
    }
  }
}
</script>
<style scoped lang="scss">
.fade-enter-active, .fade-leave-active {
  transition: opacity .5s;
}
.fade-enter, .fade-leave-to {
  opacity: 0;
}
.background {
  position: absolute;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(255, 255, 255, 0.6);
  .detail-container {
    width: 100%;
    padding: 0 10px;
    box-sizing: border-box;
    position: absolute;
    left: 0;
    top: 50%;
    transform: translateY(-50%);
    .icon-box {
      width: 100%;
      height: 50px;
      text-align: center;
      line-height: 50px;
      .icon {
        width: 40px;
        height: 40px;
        cursor: pointer;
      }
    }
    .message-container {
      width: 100%;
      height: 240px;
      margin: 20px 0;
      border: 1px solid rgb(78, 78, 78);
      background-color: #fff;
      border-radius: 8px;
      padding: 10px;
      box-sizing: border-box;
      &-header {
        width: 100%;
        height: 100px;
        display: flex;
        flex-direction: row;
        flex-wrap: nowrap;
        align-items: center;
        &__image {
          width: 80px;
          height: 80px;
          border-radius: 40px;
        }
        &__name {
          height: 60px;
          margin-left: 20px;
          display: flex;
          flex-direction: column;
          flex-wrap: nowrap;
          justify-content: space-between;
          .name {
            font-size: 18px;
            color: #222;
          }
          .followers-stars {
            display: flex;
            flex-direction: row;
            flex-wrap: nowrap;
            .followers, .stars {
              .numbers {
                font-size: 12px;
                color: #222;
              }
            }
            .stars {
              margin-left: 16px;
            }
          }
        }
      }
    }
    .email-container, .bio-container {
      width: 100%;
      height: 70px;
      display: flex;
      flex-direction: row;
      flex-wrap: nowrap;
      align-items: center;
    }
    .email, .bio {
      margin-left: 6px;
    }
  }
}
</style>
