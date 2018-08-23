// pages/spot/spot.js

const app = getApp()

const util = require('../../utils/util.js');


Page({

  /**
   * 页面的初始数据
   */
  data: {
    spot: ''
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function(options) {
    var that = this;
    var api = '../../';
    util.ask('index', function(data) {
      console.log(data.tourist_type);
      that.setData({
        spot: data.tourist,
        spot_type: data.tourist_type
      });
    });
  },


})