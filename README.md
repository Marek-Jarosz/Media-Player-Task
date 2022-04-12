Media player task
User story:
As a user,
I want to play 2 streams that I have (urls are below)
And I want to switch betweeen these 2 streams any time I want
And I want to have seeking and pause/play functionality during playback



Requirements:
1) when application is launched, I want to see a list on the left that contains 2 elements, and the description of the focused element on the right, like in the sample project: https://github.com/rokudev/samples/tree/master/media/VideoListExample
2) when I select one of the element, one of the video streams is launched
3) when I press back during video playback I want to return to the video list
4) during playback I want to have possibility to scroll forward or backward through the video to the playback position I want, using "left" and "right" dirrectional arrows on the remote control
5) during playback, pressing "ok" button on the remote should pause the video when video was playing, and should play video if it was on pause
6) the same as in 5) should work for play/pause button on the remote
7) the video streams urls that I want to have possibility to play are:
- HLS format | https://multiplatform-f.akamaihd.net/i/multi/will/bunny/big_buck_bunny_,640x360_400,640x360_700,640x360_1000,950x540_1500,.f4v.csmil/master.m3u8
- DASH format | https://demo.unified-streaming.com/k8s/features/stable/video/tears-of-steel/tears-of-steel.ism/.mpd