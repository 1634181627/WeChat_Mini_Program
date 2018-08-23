//index.js
//获取应用实例
const app = getApp()

const util = require('../../utils/util.js');

Page({
  data: {
    movies:"",
    search:'../../imgs/search.png',
    spot:''
  },
  onLoad: function () {
    var that = this;
    util.ask('index', function (data) {
      that.setData({
        movies:data.carousel,
        spot: data.tourist
      });
    });

  },
  onLookTap:function() {
    wx.navigateTo({
      url: '../spot/spot',
    })
  },
  onHotelTap: function () {
    wx.navigateTo({
      url: '../hotel/hotel',
    })
  }
})
