' ***************************************************
' ** Media Player Task
' **
' ** Intive, Marek Jarosz, 15/03/2022
' **
' ** Component for reading content
' *************************************************** 

sub init()
  m.top.functionName = "getcontent"
end sub

sub getcontent()
  content = createObject("roSGNode", "ContentNode")   
  itemcontent = content.createChild("ContentNode")
  itemcontent.setFields(item.getAttributes())
  m.top.content = content
end sub
