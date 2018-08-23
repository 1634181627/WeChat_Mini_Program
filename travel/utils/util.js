const serverApi = "http://192.168.3.100:8088/";

const askNet = (api, call) => {

  var url = serverApi + api;
  wx.request({
    url: url,
    method: 'get',
    header: {
      "content-type": "application/x-www-form-urlencoded"
    },
    success: function (res) {

      call(res.data);
    }
  })
}

module.exports = {
  ask: askNet
}