// pages/hotel/hotel.js

const app = getApp()

const util = require('../../utils/util.js');


Page({

  /**
   * 页面的初始数据
   */
  data: {
    hotel:''
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function(options) {
    var that = this;
    util.ask('index', function(data) {
      console.log(data.hotel)
      that.setData({
        hotel: data.hotel
      });
    });
  }
})