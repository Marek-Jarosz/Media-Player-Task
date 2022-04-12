' ***************************************************
' ** Media Player Task
' **
' ** Intive, Marek Jarosz, 15/03/2022
' **
' ** Component for showing list of movies and playing them with play/pause, seek, switch functionality
' *************************************************** 

  sub init()
    m.top.backgroundURI = "pkg:/images/background_hd.jpg"
    m.videoListTitle = m.top.findNode("mediaPlayerTitle")
    m.videoListTitle.setFields({
      text: "Media Player List"
      translation: "[125, 30]"
    })

    m.videoList = m.top.findNode("videoLabelList")
    m.videoList.setFields({
      translation: "[140, 100]" 
      itemSize: "[350, 60]"
    })

    m.videoInfo = m.top.findNode("infoLabel")
    m.videoInfo.setFields({
      translation: "[20, 20]" 
      width: "607" 
      height: "36" 
      horizalign: "center" 
      vertalign: "center"
      color: "#000000"
    })

    m.videoTvPoster = m.top.findNode("tvPoster")
    m.videoTvPoster.setFields({
      translation: "[560, 100]" 
      width: "647" 
      height: "448" 
      uri: "pkg:/images/tv.png" 
    })

    m.videoPoster = m.top.findNode("videoPoster")
    m.videoPoster.setFields({
      translation: "[20,20]" 
      width: "607" 
      height: "401" 
    })

    m.videoInfoRectangle = m.top.findNode("infoRectangle")
    m.videoInfoRectangle.setFields({
      translation: "[0,460]" 
      width: "647" 
      height: "76" 
      color: "#d5d5d5"
    })

    m.video = m.top.findNode("exampleVideo")
    m.video.setFields({
      visible: "false" 
    })

    m.video.observeField("state", "controlvideoplay")
    content = createObject("roSGNode", "ContentNode")

    itemcontent = content.createChild("ContentNode")
    itemcontent.setFields({
      url: "https://multiplatform-f.akamaihd.net/i/multi/will/bunny/big_buck_bunny_,640x360_400,640x360_700,640x360_1000,950x540_1500,.f4v.csmil/master.m3u8"
      streamFormat: "hls"
      hdposterurl: "https://peach.blender.org/wp-content/uploads/title_anouncement.jpg"
      description: "Big Buck Bunny video"
      title: "Big Buck Bunny"
    })
    itemcontent2 = content.createChild("ContentNode")
    itemcontent2.setFields({
      url: "https://demo.unified-streaming.com/k8s/features/stable/video/tears-of-steel/tears-of-steel.ism/.mpd"
      streamFormat: "dash"
      hdposterurl: "https://images3.alphacoders.com/817/thumb-1920-817645.jpg"
      description: "Tears of steel video"
      title: "Tears of steel"
    })

    m.videoList.content = content
    m.videoList.setFocus(true)
    m.videoList.observeField("itemFocused", "setvideo")
    m.videoList.observeField("itemSelected", "playvideo")
    end sub 

  sub setvideo()
    itemcontent = m.videoList.content.getChild(m.videoList.itemFocused)
    m.videoPoster.uri = itemcontent.hdposterurl
    m.videoInfo.text = itemcontent.description
    m.video.content = itemcontent
  end sub

  sub playvideo()
    m.video.control = "play"
    m.video.visible = true
    m.video.setFocus(true)
  end sub

  sub controlvideoplay()
    if (m.video.state = "finished") 
      m.video.control = "stop"
      m.videoList.setFocus(true)
      m.video.visible = false
    end if
  end sub

  function onKeyEvent(key as String, press as Boolean) as Boolean
    if press then
      if key = "back"
        if (m.video.state = "playing")
          m.video.control = "stop"
          m.videoList.setFocus(true)
          m.video.visible = false
          return true
        end if
      end if
    end if
    return false
  end function