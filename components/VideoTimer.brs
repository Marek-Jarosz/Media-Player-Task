' ***************************************************
' ** Media Player Task
' **
' ** Intive, Marek Jarosz, 28/03/2022
' **
' ** Functionality of real time counter label
' *************************************************** 

sub init()
    m.videoTimer = m.top.findNode("timeLabel")
    m.videoTimer.setFields({
      translation: "[65, 10]"     
    })
    m.top.observeField("position", "onPositionChange") 
end sub

sub onPositionChange()
  positionInSeconds = m.top.position

  positionSplitMinutes = positionInSeconds / 60
  stringMinutes = Fix(positionSplitMinutes).ToStr()

  positionSplitSeconds = positionInSeconds MOD 60
  stringSeconds = positionSplitSeconds.toStr()
  
  if (positionSplitMinutes < 10)
    m.VideoTimer.text = "0" + stringMinutes + ":" +  stringSeconds
    if (positionSplitSeconds < 10)
      m.VideoTimer.text = "0" + stringMinutes + ":" + "0" + stringSeconds
    end if
  else
    m.VideoTimer.text = stringMinutes + ":" + stringSeconds
    if (positionSplitSeconds < 10)
      m.VideoTimer.text = stringMinutes + ":" + "0" + stringSeconds
    end if
  end if
end sub
