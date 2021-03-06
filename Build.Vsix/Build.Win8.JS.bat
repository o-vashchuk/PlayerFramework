@set SN=%ProgramFiles(x86)%\Microsoft SDKs\Windows\v8.0A\Bin\NETFX 4.0 Tools\x64\sn.exe
@set DEVENV=%ProgramFiles(x86)%\Microsoft Visual Studio 12.0\Common7\IDE\devenv.exe
@IF NOT EXIST "%DEVENV%" SET DEVENV=%ProgramFiles(x86)%\Microsoft Visual Studio 12.0\Common7\IDE\VSWinExpress.exe
@IF NOT EXIST "%DEVENV%" SET DEVENV=%ProgramFiles(x86)%\Microsoft Visual Studio 11.0\Common7\IDE\devenv.exe
@IF NOT EXIST "%DEVENV%" SET DEVENV=%ProgramFiles(x86)%\Microsoft Visual Studio 11.0\Common7\IDE\VSWinExpress.exe

@pushd %~dp0%
cd..

"%DEVENV%" /build "Release|AnyCPU" Microsoft.PlayerFramework.Win8.Js.sln
"%DEVENV%" /build "Release|x86"    Microsoft.PlayerFramework.Win8.Js.sln
"%DEVENV%" /build "Release|x64"    Microsoft.PlayerFramework.Win8.Js.sln
"%DEVENV%" /build "Release|ARM"    Microsoft.PlayerFramework.Win8.Js.sln

"%SN%" -R Win8.Js.Adaptive\bin\x86\Release\Microsoft.PlayerFramework.Js.Adaptive.winmd										Win8.Js.Adaptive\Microsoft.PlayerFramework.snk
"%SN%" -R Win8.WinRT.AdaptiveStreaming.Helper\bin\x86\Release\Microsoft.Media.AdaptiveStreaming.Helper.winmd				Win8.WinRT.AdaptiveStreaming.Helper\Microsoft.PlayerFramework.snk
"%SN%" -R Win8.Js.Adaptive\bin\x64\Release\Microsoft.PlayerFramework.Js.Adaptive.winmd										Win8.Js.Adaptive\Microsoft.PlayerFramework.snk
"%SN%" -R Win8.WinRT.AdaptiveStreaming.Helper\bin\x64\Release\Microsoft.Media.AdaptiveStreaming.Helper.winmd				Win8.WinRT.AdaptiveStreaming.Helper\Microsoft.PlayerFramework.snk
"%SN%" -R Win8.Js.Adaptive\bin\ARM\Release\Microsoft.PlayerFramework.Js.Adaptive.winmd										Win8.Js.Adaptive\Microsoft.PlayerFramework.snk
"%SN%" -R Win8.WinRT.AdaptiveStreaming.Helper\bin\ARM\Release\Microsoft.Media.AdaptiveStreaming.Helper.winmd				Win8.WinRT.AdaptiveStreaming.Helper\Microsoft.PlayerFramework.snk
"%SN%" -R Win8.WinRT.Advertising\bin\Release\Microsoft.Media.Advertising.winmd												Win8.WinRT.Advertising\Microsoft.PlayerFramework.snk
"%SN%" -R Win8.Js.Advertising\bin\Release\Microsoft.PlayerFramework.Js.Advertising.winmd									Win8.Js.Advertising\Microsoft.PlayerFramework.snk
"%SN%" -R Win8.WinRT.Analytics\bin\Release\Microsoft.Media.Analytics.winmd													Win8.WinRT.Analytics\Microsoft.PlayerFramework.snk
"%SN%" -R Win8.Js.Analytics\bin\Release\Microsoft.PlayerFramework.Js.Analytics.winmd										Win8.Js.Analytics\Microsoft.PlayerFramework.snk
"%SN%" -R Win8.WinRT.AdaptiveStreaming.Analytics\bin\x86\Release\Microsoft.Media.AdaptiveStreaming.Analytics.winmd			Win8.WinRT.AdaptiveStreaming.Analytics\Microsoft.PlayerFramework.snk
"%SN%" -R Win8.WinRT.AdaptiveStreaming.Analytics\bin\x64\Release\Microsoft.Media.AdaptiveStreaming.Analytics.winmd			Win8.WinRT.AdaptiveStreaming.Analytics\Microsoft.PlayerFramework.snk
"%SN%" -R Win8.WinRT.AdaptiveStreaming.Analytics\bin\ARM\Release\Microsoft.Media.AdaptiveStreaming.Analytics.winmd			Win8.WinRT.AdaptiveStreaming.Analytics\Microsoft.PlayerFramework.snk
"%SN%" -R Win8.WinRT.AdaptiveStreaming.Dash\bin\x86\Release\Microsoft.Media.AdaptiveStreaming.Dash.winmd					Win8.WinRT.AdaptiveStreaming.Dash\Microsoft.PlayerFramework.snk
"%SN%" -R Win8.WinRT.AdaptiveStreaming.Dash\bin\x64\Release\Microsoft.Media.AdaptiveStreaming.Dash.winmd					Win8.WinRT.AdaptiveStreaming.Dash\Microsoft.PlayerFramework.snk
"%SN%" -R Win8.WinRT.AdaptiveStreaming.Dash\bin\ARM\Release\Microsoft.Media.AdaptiveStreaming.Dash.winmd					Win8.WinRT.AdaptiveStreaming.Dash\Microsoft.PlayerFramework.snk
"%SN%" -R Win8.WinRT.Analytics.Advertising\bin\x86\Release\Microsoft.Media.Analytics.Advertising.winmd						Win8.WinRT.Analytics.Advertising\Microsoft.PlayerFramework.snk
"%SN%" -R Win8.WinRT.Analytics.Advertising\bin\x64\Release\Microsoft.Media.Analytics.Advertising.winmd						Win8.WinRT.Analytics.Advertising\Microsoft.PlayerFramework.snk
"%SN%" -R Win8.WinRT.Analytics.Advertising\bin\ARM\Release\Microsoft.Media.Analytics.Advertising.winmd						Win8.WinRT.Analytics.Advertising\Microsoft.PlayerFramework.snk
"%SN%" -R Win8.WinRT.Analytics.AudienceInsight\bin\x86\Release\Microsoft.Media.Analytics.AudienceInsight.winmd				Win8.WinRT.Analytics.AudienceInsight\Microsoft.PlayerFramework.snk
"%SN%" -R Win8.WinRT.Analytics.AudienceInsight\bin\x64\Release\Microsoft.Media.Analytics.AudienceInsight.winmd				Win8.WinRT.Analytics.AudienceInsight\Microsoft.PlayerFramework.snk
"%SN%" -R Win8.WinRT.Analytics.AudienceInsight\bin\ARM\Release\Microsoft.Media.Analytics.AudienceInsight.winmd				Win8.WinRT.Analytics.AudienceInsight\Microsoft.PlayerFramework.snk
"%SN%" -R Win8.WinRT.AudienceInsight\bin\Release\Microsoft.Media.AudienceInsight.winmd										Win8.WinRT.AudienceInsight\Microsoft.PlayerFramework.snk

@popd

@pushd %~dp0%

cd Win80

mkdir "Microsoft.PlayerFramework.Js.Core\DesignTime"
mkdir "Microsoft.PlayerFramework.Js.Core\Redist"
mkdir "Microsoft.PlayerFramework.Js.Core\DesignTime\CommonConfiguration"
mkdir "Microsoft.PlayerFramework.Js.Core\DesignTime\CommonConfiguration\neutral"
mkdir "Microsoft.PlayerFramework.Js.Core\DesignTime\CommonConfiguration\neutral\Microsoft.PlayerFramework.Js"
mkdir "Microsoft.PlayerFramework.Js.Core\DesignTime\CommonConfiguration\neutral\Microsoft.PlayerFramework.Js\css"
mkdir "Microsoft.PlayerFramework.Js.Core\DesignTime\CommonConfiguration\neutral\Microsoft.PlayerFramework.Js\js"
mkdir "Microsoft.PlayerFramework.Js.Core\Redist\CommonConfiguration"
mkdir "Microsoft.PlayerFramework.Js.Core\Redist\CommonConfiguration\neutral"
mkdir "Microsoft.PlayerFramework.Js.Core\Redist\CommonConfiguration\neutral\Microsoft.PlayerFramework.Js"
mkdir "Microsoft.PlayerFramework.Js.Core\Redist\CommonConfiguration\neutral\Microsoft.PlayerFramework.Js\css"
mkdir "Microsoft.PlayerFramework.Js.Core\Redist\CommonConfiguration\neutral\Microsoft.PlayerFramework.Js\images"
mkdir "Microsoft.PlayerFramework.Js.Core\Redist\CommonConfiguration\neutral\Microsoft.PlayerFramework.Js\js"
mkdir "Microsoft.PlayerFramework.Js.Adaptive\DesignTime"
mkdir "Microsoft.PlayerFramework.Js.Adaptive\Redist"
mkdir "Microsoft.PlayerFramework.Js.Adaptive\References"
mkdir "Microsoft.PlayerFramework.Js.Adaptive\DesignTime\CommonConfiguration"
mkdir "Microsoft.PlayerFramework.Js.Adaptive\DesignTime\CommonConfiguration\neutral"
mkdir "Microsoft.PlayerFramework.Js.Adaptive\DesignTime\CommonConfiguration\neutral\Microsoft.PlayerFramework.Js.Adaptive"
mkdir "Microsoft.PlayerFramework.Js.Adaptive\DesignTime\CommonConfiguration\neutral\Microsoft.PlayerFramework.Js.Adaptive\js"
mkdir "Microsoft.PlayerFramework.Js.Adaptive\Redist\CommonConfiguration"
mkdir "Microsoft.PlayerFramework.Js.Adaptive\Redist\CommonConfiguration\neutral"
mkdir "Microsoft.PlayerFramework.Js.Adaptive\Redist\CommonConfiguration\neutral\Microsoft.Media.AdaptiveStreaming.Helper"
mkdir "Microsoft.PlayerFramework.Js.Adaptive\Redist\CommonConfiguration\neutral\Microsoft.PlayerFramework.Js.Adaptive"
mkdir "Microsoft.PlayerFramework.Js.Adaptive\Redist\CommonConfiguration\neutral\Microsoft.PlayerFramework.Js.Adaptive\js"
mkdir "Microsoft.PlayerFramework.Js.Adaptive\References\CommonConfiguration"
mkdir "Microsoft.PlayerFramework.Js.Adaptive\References\CommonConfiguration\ARM"
mkdir "Microsoft.PlayerFramework.Js.Adaptive\References\CommonConfiguration\x64"
mkdir "Microsoft.PlayerFramework.Js.Adaptive\References\CommonConfiguration\x86"
mkdir "Microsoft.PlayerFramework.Js.Advertising\DesignTime"
mkdir "Microsoft.PlayerFramework.Js.Advertising\Redist"
mkdir "Microsoft.PlayerFramework.Js.Advertising\References"
mkdir "Microsoft.PlayerFramework.Js.Advertising\DesignTime\CommonConfiguration"
mkdir "Microsoft.PlayerFramework.Js.Advertising\DesignTime\CommonConfiguration\neutral"
mkdir "Microsoft.PlayerFramework.Js.Advertising\DesignTime\CommonConfiguration\neutral\Microsoft.PlayerFramework.Js.Advertising"
mkdir "Microsoft.PlayerFramework.Js.Advertising\DesignTime\CommonConfiguration\neutral\Microsoft.PlayerFramework.Js.Advertising\css"
mkdir "Microsoft.PlayerFramework.Js.Advertising\DesignTime\CommonConfiguration\neutral\Microsoft.PlayerFramework.Js.Advertising\js"
mkdir "Microsoft.PlayerFramework.Js.Advertising\Redist\CommonConfiguration"
mkdir "Microsoft.PlayerFramework.Js.Advertising\Redist\CommonConfiguration\neutral"
mkdir "Microsoft.PlayerFramework.Js.Advertising\Redist\CommonConfiguration\neutral\Microsoft.PlayerFramework.Js.Advertising"
mkdir "Microsoft.PlayerFramework.Js.Advertising\Redist\CommonConfiguration\neutral\Microsoft.Media.Advertising"
mkdir "Microsoft.PlayerFramework.Js.Advertising\Redist\CommonConfiguration\neutral\Microsoft.PlayerFramework.Js.Advertising\css"
mkdir "Microsoft.PlayerFramework.Js.Advertising\Redist\CommonConfiguration\neutral\Microsoft.PlayerFramework.Js.Advertising\js"
mkdir "Microsoft.PlayerFramework.Js.Advertising\References\CommonConfiguration"
mkdir "Microsoft.PlayerFramework.Js.Advertising\References\CommonConfiguration\neutral"
mkdir "Microsoft.PlayerFramework.Js.Analytics\DesignTime"
mkdir "Microsoft.PlayerFramework.Js.Analytics\Redist"
mkdir "Microsoft.PlayerFramework.Js.Analytics\References"
mkdir "Microsoft.PlayerFramework.Js.Analytics\DesignTime\CommonConfiguration"
mkdir "Microsoft.PlayerFramework.Js.Analytics\DesignTime\CommonConfiguration\neutral"
mkdir "Microsoft.PlayerFramework.Js.Analytics\DesignTime\CommonConfiguration\neutral\Microsoft.PlayerFramework.Js.Analytics"
mkdir "Microsoft.PlayerFramework.Js.Analytics\DesignTime\CommonConfiguration\neutral\Microsoft.PlayerFramework.Js.Analytics\js"
mkdir "Microsoft.PlayerFramework.Js.Analytics\Redist\CommonConfiguration"
mkdir "Microsoft.PlayerFramework.Js.Analytics\Redist\CommonConfiguration\neutral"
mkdir "Microsoft.PlayerFramework.Js.Analytics\Redist\CommonConfiguration\neutral\Microsoft.Media.AdaptiveStreaming.Analytics"
mkdir "Microsoft.PlayerFramework.Js.Analytics\Redist\CommonConfiguration\neutral\Microsoft.PlayerFramework.Js.Analytics"
mkdir "Microsoft.PlayerFramework.Js.Analytics\Redist\CommonConfiguration\neutral\Microsoft.Media.Analytics"
mkdir "Microsoft.PlayerFramework.Js.Analytics\Redist\CommonConfiguration\neutral\Microsoft.PlayerFramework.Js.Analytics\js"
mkdir "Microsoft.PlayerFramework.Js.Analytics\References\CommonConfiguration"
mkdir "Microsoft.PlayerFramework.Js.Analytics\References\CommonConfiguration\ARM"
mkdir "Microsoft.PlayerFramework.Js.Analytics\References\CommonConfiguration\neutral"
mkdir "Microsoft.PlayerFramework.Js.Analytics\References\CommonConfiguration\x64"
mkdir "Microsoft.PlayerFramework.Js.Analytics\References\CommonConfiguration\x86"
mkdir "Microsoft.PlayerFramework.Js.TimedText\DesignTime"
mkdir "Microsoft.PlayerFramework.Js.TimedText\Redist"
mkdir "Microsoft.PlayerFramework.Js.TimedText\References"
mkdir "Microsoft.PlayerFramework.Js.TimedText\DesignTime\CommonConfiguration"
mkdir "Microsoft.PlayerFramework.Js.TimedText\DesignTime\CommonConfiguration\neutral"
mkdir "Microsoft.PlayerFramework.Js.TimedText\DesignTime\CommonConfiguration\neutral\Microsoft.PlayerFramework.Js.TimedText"
mkdir "Microsoft.PlayerFramework.Js.TimedText\DesignTime\CommonConfiguration\neutral\Microsoft.PlayerFramework.Js.TimedText\css"
mkdir "Microsoft.PlayerFramework.Js.TimedText\DesignTime\CommonConfiguration\neutral\Microsoft.PlayerFramework.Js.TimedText\js"
mkdir "Microsoft.PlayerFramework.Js.TimedText\Redist\CommonConfiguration"
mkdir "Microsoft.PlayerFramework.Js.TimedText\Redist\CommonConfiguration\neutral"
mkdir "Microsoft.PlayerFramework.Js.TimedText\Redist\CommonConfiguration\neutral\Microsoft.PlayerFramework.Js.TimedText"
mkdir "Microsoft.PlayerFramework.Js.TimedText\Redist\CommonConfiguration\neutral\Microsoft.PlayerFramework.Js.TimedText\css"
mkdir "Microsoft.PlayerFramework.Js.TimedText\Redist\CommonConfiguration\neutral\Microsoft.PlayerFramework.Js.TimedText\js"
mkdir "Microsoft.PlayerFramework.Js.TimedText\References\CommonConfiguration"
mkdir "Microsoft.PlayerFramework.Js.TimedText\References\CommonConfiguration\neutral"
mkdir "Microsoft.PlayerFramework.Dash\Redist"
mkdir "Microsoft.PlayerFramework.Dash\References"
mkdir "Microsoft.PlayerFramework.Dash\Redist\CommonConfiguration"
mkdir "Microsoft.PlayerFramework.Dash\Redist\CommonConfiguration\neutral"
mkdir "Microsoft.PlayerFramework.Dash\Redist\CommonConfiguration\neutral\Microsoft.Media.AdaptiveStreaming.Dash"
mkdir "Microsoft.PlayerFramework.Dash\References\CommonConfiguration"
mkdir "Microsoft.PlayerFramework.Dash\References\CommonConfiguration\ARM"
mkdir "Microsoft.PlayerFramework.Dash\References\CommonConfiguration\neutral"
mkdir "Microsoft.PlayerFramework.Dash\References\CommonConfiguration\x64"
mkdir "Microsoft.PlayerFramework.Dash\References\CommonConfiguration\x86"
mkdir "Microsoft.PlayerFramework.Analytics.Advertising\Redist"
mkdir "Microsoft.PlayerFramework.Analytics.Advertising\References"
mkdir "Microsoft.PlayerFramework.Analytics.Advertising\Redist\CommonConfiguration"
mkdir "Microsoft.PlayerFramework.Analytics.Advertising\Redist\CommonConfiguration\neutral"
mkdir "Microsoft.PlayerFramework.Analytics.Advertising\Redist\CommonConfiguration\neutral\Microsoft.Media.Analytics.Advertising"
mkdir "Microsoft.PlayerFramework.Analytics.Advertising\References\CommonConfiguration"
mkdir "Microsoft.PlayerFramework.Analytics.Advertising\References\CommonConfiguration\ARM"
mkdir "Microsoft.PlayerFramework.Analytics.Advertising\References\CommonConfiguration\neutral"
mkdir "Microsoft.PlayerFramework.Analytics.Advertising\References\CommonConfiguration\x64"
mkdir "Microsoft.PlayerFramework.Analytics.Advertising\References\CommonConfiguration\x86"
mkdir "Microsoft.PlayerFramework.Analytics.AudienceInsight\Redist"
mkdir "Microsoft.PlayerFramework.Analytics.AudienceInsight\References"
mkdir "Microsoft.PlayerFramework.Analytics.AudienceInsight\Redist\CommonConfiguration"
mkdir "Microsoft.PlayerFramework.Analytics.AudienceInsight\Redist\CommonConfiguration\neutral"
mkdir "Microsoft.PlayerFramework.Analytics.AudienceInsight\Redist\CommonConfiguration\neutral\Microsoft.Media.Analytics.AudienceInsight"
mkdir "Microsoft.PlayerFramework.Analytics.AudienceInsight\References\CommonConfiguration"
mkdir "Microsoft.PlayerFramework.Analytics.AudienceInsight\References\CommonConfiguration\ARM"
mkdir "Microsoft.PlayerFramework.Analytics.AudienceInsight\References\CommonConfiguration\neutral"
mkdir "Microsoft.PlayerFramework.Analytics.AudienceInsight\References\CommonConfiguration\x64"
mkdir "Microsoft.PlayerFramework.Analytics.AudienceInsight\References\CommonConfiguration\x86"
mkdir "Microsoft.Media.AudienceInsight\Redist"
mkdir "Microsoft.Media.AudienceInsight\References"
mkdir "Microsoft.Media.AudienceInsight\Redist\CommonConfiguration"
mkdir "Microsoft.Media.AudienceInsight\Redist\CommonConfiguration\neutral"
mkdir "Microsoft.Media.AudienceInsight\Redist\CommonConfiguration\neutral\Microsoft.Media.AudienceInsight"
mkdir "Microsoft.Media.AudienceInsight\References\CommonConfiguration"
mkdir "Microsoft.Media.AudienceInsight\References\CommonConfiguration\neutral"

..\copyencoded ..\..\Universal.Js.Core\css\Default-base.css+..\..\Universal.Js.Core\css\Default-dark.css																			Microsoft.PlayerFramework.Js.Core\DesignTime\CommonConfiguration\neutral\Microsoft.PlayerFramework.Js\css\PlayerFramework-dark.css
..\copyencoded ..\..\Universal.Js.Core\css\Default-base.css+..\..\Universal.Js.Core\css\Default-light.css																			Microsoft.PlayerFramework.Js.Core\DesignTime\CommonConfiguration\neutral\Microsoft.PlayerFramework.Js\css\PlayerFramework-light.css
..\copyencoded ..\..\Universal.Js.Core\css\Default-base.css+..\..\Universal.Js.Core\css\Default-dark.css+..\..\Universal.Js.Core\css\Entertainment-base.css+..\..\Universal.Js.Core\css\Entertainment-dark.css		Microsoft.PlayerFramework.Js.Core\DesignTime\CommonConfiguration\neutral\Microsoft.PlayerFramework.Js\css\PlayerFramework-Entertainment-dark.css
..\copyencoded ..\..\Universal.Js.Core\css\Default-base.css+..\..\Universal.Js.Core\css\Default-light.css+..\..\Universal.Js.Core\css\Entertainment-base.css+..\..\Universal.Js.Core\css\Entertainment-light.css	Microsoft.PlayerFramework.Js.Core\DesignTime\CommonConfiguration\neutral\Microsoft.PlayerFramework.Js\css\PlayerFramework-Entertainment-light.css
..\copyencoded ..\..\Universal.Js.Core\css\Default-base.css+..\..\Universal.Js.Core\css\Default-dark.css+..\..\Universal.Js.Core\css\Universal-base.css+..\..\Universal.Js.Core\css\Universal-dark.css		Microsoft.PlayerFramework.Js.Core\DesignTime\CommonConfiguration\neutral\Microsoft.PlayerFramework.Js\css\PlayerFramework-Universal-dark.css
..\copyencoded ..\..\Universal.Js.Core\css\Default-base.css+..\..\Universal.Js.Core\css\Default-light.css+..\..\Universal.Js.Core\css\Universal-base.css+..\..\Universal.Js.Core\css\Universal-light.css	Microsoft.PlayerFramework.Js.Core\DesignTime\CommonConfiguration\neutral\Microsoft.PlayerFramework.Js\css\PlayerFramework-Universal-light.css
..\copyencoded ..\..\Universal.Js.Core\js\PlayerFramework.js+..\..\Universal.Js.Core\js\InteractiveViewModel.js+..\..\Universal.Js.Core\js\MediaPlayer.js+..\..\Universal.Js.Core\js\DynamicTextTrack.js+..\..\Universal.Js.Core\js\ui\Button.js+..\..\Universal.Js.Core\js\ui\ControlPanel.js+..\..\Universal.Js.Core\js\ui\Indicator.js+..\..\Universal.Js.Core\js\ui\Meter.js+..\..\Universal.Js.Core\js\ui\Slider.js+..\..\Universal.Js.Core\js\plugins\PluginBase.js+..\..\Universal.Js.Core\js\plugins\TrackingPluginBase.js+..\..\Universal.Js.Core\js\plugins\BufferingPlugin.js+..\..\Universal.Js.Core\js\plugins\ControlPlugin.js+..\..\Universal.Js.Core\js\plugins\ErrorPlugin.js+..\..\Universal.Js.Core\js\plugins\LoaderPlugin.js+..\..\Universal.Js.Core\js\plugins\PlaylistPlugin.js+..\..\Universal.Js.Core\js\plugins\PlayTimeTrackingPlugin.js+..\..\Universal.Js.Core\js\plugins\PositionTrackingPlugin.js+..\..\Universal.Js.Core\js\plugins\MediaControlPlugin.js+..\..\Universal.Js.Core\js\plugins\ChaptersPlugin.js+..\..\Universal.Js.Core\js\plugins\DisplayRequestPlugin.js+..\..\Universal.Js.Core\js\plugins\CaptionSelectorPlugin.js+..\..\Universal.Js.Core\js\plugins\AudioSelectorPlugin.js Microsoft.PlayerFramework.Js.Core\DesignTime\CommonConfiguration\neutral\Microsoft.PlayerFramework.Js\js\PlayerFramework.js
copy ..\..\Universal.Js.Core\images\thumb-dark.png																															Microsoft.PlayerFramework.Js.Core\Redist\CommonConfiguration\neutral\Microsoft.PlayerFramework.Js\images\
copy ..\..\Universal.Js.Core\images\thumb-light.png																															Microsoft.PlayerFramework.Js.Core\Redist\CommonConfiguration\neutral\Microsoft.PlayerFramework.Js\images\
copy Microsoft.PlayerFramework.Js.Core\DesignTime\CommonConfiguration\neutral\Microsoft.PlayerFramework.Js\css\PlayerFramework-dark.css										Microsoft.PlayerFramework.Js.Core\Redist\CommonConfiguration\neutral\Microsoft.PlayerFramework.Js\css\
copy Microsoft.PlayerFramework.Js.Core\DesignTime\CommonConfiguration\neutral\Microsoft.PlayerFramework.Js\css\PlayerFramework-light.css									Microsoft.PlayerFramework.Js.Core\Redist\CommonConfiguration\neutral\Microsoft.PlayerFramework.Js\css\
copy Microsoft.PlayerFramework.Js.Core\DesignTime\CommonConfiguration\neutral\Microsoft.PlayerFramework.Js\css\PlayerFramework-Entertainment-dark.css						Microsoft.PlayerFramework.Js.Core\Redist\CommonConfiguration\neutral\Microsoft.PlayerFramework.Js\css\
copy Microsoft.PlayerFramework.Js.Core\DesignTime\CommonConfiguration\neutral\Microsoft.PlayerFramework.Js\css\PlayerFramework-Entertainment-light.css						Microsoft.PlayerFramework.Js.Core\Redist\CommonConfiguration\neutral\Microsoft.PlayerFramework.Js\css\
copy Microsoft.PlayerFramework.Js.Core\DesignTime\CommonConfiguration\neutral\Microsoft.PlayerFramework.Js\css\PlayerFramework-Universal-dark.css						Microsoft.PlayerFramework.Js.Core\Redist\CommonConfiguration\neutral\Microsoft.PlayerFramework.Js\css\
copy Microsoft.PlayerFramework.Js.Core\DesignTime\CommonConfiguration\neutral\Microsoft.PlayerFramework.Js\css\PlayerFramework-Universal-light.css						Microsoft.PlayerFramework.Js.Core\Redist\CommonConfiguration\neutral\Microsoft.PlayerFramework.Js\css\
copy Microsoft.PlayerFramework.Js.Core\DesignTime\CommonConfiguration\neutral\Microsoft.PlayerFramework.Js\js\PlayerFramework.js											Microsoft.PlayerFramework.Js.Core\Redist\CommonConfiguration\neutral\Microsoft.PlayerFramework.Js\js\
copy ..\..\Win8.Js.Core\bin\Release\Microsoft.PlayerFramework.Js.pri																										Microsoft.PlayerFramework.Js.Core\Redist\CommonConfiguration\neutral\Microsoft.PlayerFramework.Js\

..\copyencoded ..\..\Universal.Js.Adaptive\js\AdaptivePlugin.js																												Microsoft.PlayerFramework.Js.Adaptive\DesignTime\CommonConfiguration\neutral\Microsoft.PlayerFramework.Js.Adaptive\js\PlayerFramework.Adaptive.js
copy Microsoft.PlayerFramework.Js.Adaptive\DesignTime\CommonConfiguration\neutral\Microsoft.PlayerFramework.Js.Adaptive\js\PlayerFramework.Adaptive.js					Microsoft.PlayerFramework.Js.Adaptive\Redist\CommonConfiguration\neutral\Microsoft.PlayerFramework.Js.Adaptive\js\
copy ..\..\Win8.Js.Adaptive\bin\x86\Release\Microsoft.PlayerFramework.Js.Adaptive.pri																					Microsoft.PlayerFramework.Js.Adaptive\Redist\CommonConfiguration\neutral\Microsoft.PlayerFramework.Js.Adaptive\
copy ..\..\Win8.WinRT.AdaptiveStreaming.Helper\bin\x86\Release\Microsoft.Media.AdaptiveStreaming.Helper.pri																Microsoft.PlayerFramework.Js.Adaptive\Redist\CommonConfiguration\neutral\Microsoft.Media.AdaptiveStreaming.Helper\
copy ..\..\Win8.Js.Adaptive\bin\x86\Release\Microsoft.PlayerFramework.Js.Adaptive.winmd																					Microsoft.PlayerFramework.Js.Adaptive\References\CommonConfiguration\x86\
copy ..\..\Win8.WinRT.AdaptiveStreaming.Helper\bin\x86\Release\Microsoft.Media.AdaptiveStreaming.Helper.winmd															Microsoft.PlayerFramework.Js.Adaptive\References\CommonConfiguration\x86\
copy ..\..\Win8.Js.Adaptive\bin\x64\Release\Microsoft.PlayerFramework.Js.Adaptive.winmd																					Microsoft.PlayerFramework.Js.Adaptive\References\CommonConfiguration\x64\
copy ..\..\Win8.WinRT.AdaptiveStreaming.Helper\bin\x64\Release\Microsoft.Media.AdaptiveStreaming.Helper.winmd															Microsoft.PlayerFramework.Js.Adaptive\References\CommonConfiguration\x64\
copy ..\..\Win8.Js.Adaptive\bin\ARM\Release\Microsoft.PlayerFramework.Js.Adaptive.winmd																					Microsoft.PlayerFramework.Js.Adaptive\References\CommonConfiguration\ARM\
copy ..\..\Win8.WinRT.AdaptiveStreaming.Helper\bin\ARM\Release\Microsoft.Media.AdaptiveStreaming.Helper.winmd															Microsoft.PlayerFramework.Js.Adaptive\References\CommonConfiguration\ARM\

..\copyencoded ..\..\Universal.Js.Advertising\css\Advertising.css																											Microsoft.PlayerFramework.Js.Advertising\DesignTime\CommonConfiguration\neutral\Microsoft.PlayerFramework.Js.Advertising\css\PlayerFramework.Advertising.css
..\copyencoded ..\..\Universal.Js.Advertising\js\AdHandlerPlugin.js+..\..\Universal.Js.Advertising\js\AdPayloadHandlerPluginBase.js+..\..\Universal.Js.Advertising\js\AdPlayerFactoryPluginBase.js+..\..\Universal.Js.Advertising\js\AdPlayerFactoryPlugin.js+..\..\Universal.Js.Advertising\js\AdSchedulerPlugin.js+..\..\Universal.Js.Advertising\js\Advertisement.js+..\..\Universal.Js.Advertising\js\FreeWheelPlugin.js+..\..\Universal.Js.Advertising\js\MastSchedulerPlugin.js+..\..\Universal.Js.Advertising\js\MediaPlayerAdapter.js+..\..\Universal.Js.Advertising\js\VmapSchedulerPlugin.js+..\..\Universal.Js.Advertising\js\VpaidAdPlayerBase.js+..\..\Universal.Js.Advertising\js\VpaidNonLinearAdPlayers.js+..\..\Universal.Js.Advertising\js\VpaidVideoAdPlayer.js+..\..\Universal.Js.Advertising\js\VpaidAdapter.js+..\..\Universal.Js.Advertising\js\VpaidLinearAdViewModel.js+..\..\Universal.Js.Advertising\js\VpaidNonLinearAdViewModel.js Microsoft.PlayerFramework.Js.Advertising\DesignTime\CommonConfiguration\neutral\Microsoft.PlayerFramework.Js.Advertising\js\PlayerFramework.Advertising.js
copy Microsoft.PlayerFramework.Js.Advertising\DesignTime\CommonConfiguration\neutral\Microsoft.PlayerFramework.Js.Advertising\css\PlayerFramework.Advertising.css		Microsoft.PlayerFramework.Js.Advertising\Redist\CommonConfiguration\neutral\Microsoft.PlayerFramework.Js.Advertising\css\
copy Microsoft.PlayerFramework.Js.Advertising\DesignTime\CommonConfiguration\neutral\Microsoft.PlayerFramework.Js.Advertising\js\PlayerFramework.Advertising.js			Microsoft.PlayerFramework.Js.Advertising\Redist\CommonConfiguration\neutral\Microsoft.PlayerFramework.Js.Advertising\js\
copy ..\..\Win8.Js.Advertising\bin\Release\Microsoft.PlayerFramework.Js.Advertising.pri																					Microsoft.PlayerFramework.Js.Advertising\Redist\CommonConfiguration\neutral\Microsoft.PlayerFramework.Js.Advertising\
copy ..\..\Win8.WinRT.Advertising\bin\Release\Microsoft.Media.Advertising.pri																							Microsoft.PlayerFramework.Js.Advertising\Redist\CommonConfiguration\neutral\Microsoft.Media.Advertising\
copy ..\..\Win8.WinRT.Advertising\bin\Release\Microsoft.Media.Advertising.winmd																							Microsoft.PlayerFramework.Js.Advertising\References\CommonConfiguration\neutral\
copy ..\..\Win8.Js.Advertising\bin\Release\Microsoft.PlayerFramework.Js.Advertising.winmd																				Microsoft.PlayerFramework.Js.Advertising\References\CommonConfiguration\neutral\
copy ..\..\Win8.Js.Advertising\bin\Release\Microsoft.PlayerFramework.Js.Advertising.xml 																				Microsoft.PlayerFramework.Js.Advertising\References\CommonConfiguration\neutral\
..\copyencoded ..\..\Universal.Js.TimedText\css\TimedText.css																												Microsoft.PlayerFramework.Js.TimedText\DesignTime\CommonConfiguration\neutral\Microsoft.PlayerFramework.Js.TimedText\css\PlayerFramework.TimedText.css
..\copyencoded ..\..\Universal.Js.TimedText\js\CaptionsPlugin.js+..\..\Universal.Js.TimedText\js\TtmlParser.js																	Microsoft.PlayerFramework.Js.TimedText\DesignTime\CommonConfiguration\neutral\Microsoft.PlayerFramework.Js.TimedText\js\PlayerFramework.TimedText.js
copy Microsoft.PlayerFramework.Js.TimedText\DesignTime\CommonConfiguration\neutral\Microsoft.PlayerFramework.Js.TimedText\css\PlayerFramework.TimedText.css				Microsoft.PlayerFramework.Js.TimedText\Redist\CommonConfiguration\neutral\Microsoft.PlayerFramework.Js.TimedText\css\
copy Microsoft.PlayerFramework.Js.TimedText\DesignTime\CommonConfiguration\neutral\Microsoft.PlayerFramework.Js.TimedText\js\PlayerFramework.TimedText.js				Microsoft.PlayerFramework.Js.TimedText\Redist\CommonConfiguration\neutral\Microsoft.PlayerFramework.Js.TimedText\js\
copy ..\..\Win8.Js.TimedText\bin\Release\Microsoft.PlayerFramework.Js.TimedText.pri																						Microsoft.PlayerFramework.Js.TimedText\Redist\CommonConfiguration\neutral\Microsoft.PlayerFramework.Js.TimedText\

..\copyencoded ..\..\Universal.Js.Analytics\js\ErrorLogger.js+..\..\Universal.Js.Analytics\js\MediaPlayerAdapter.js+..\..\Universal.Js.Analytics\js\AdaptiveAnalyticsPlugin.js+..\..\Universal.Js.Analytics\js\AnalyticsPlugin.js	Microsoft.PlayerFramework.Js.Analytics\DesignTime\CommonConfiguration\neutral\Microsoft.PlayerFramework.Js.Analytics\js\PlayerFramework.Analytics.js
copy Microsoft.PlayerFramework.Js.Analytics\DesignTime\CommonConfiguration\neutral\Microsoft.PlayerFramework.Js.Analytics\js\PlayerFramework.Analytics.js				Microsoft.PlayerFramework.Js.Analytics\Redist\CommonConfiguration\neutral\Microsoft.PlayerFramework.Js.Analytics\js\
copy ..\..\Win8.Js.Analytics\bin\Release\Microsoft.PlayerFramework.Js.Analytics.pri																						Microsoft.PlayerFramework.Js.Analytics\Redist\CommonConfiguration\neutral\Microsoft.PlayerFramework.Js.Analytics\
copy ..\..\Win8.WinRT.Analytics\bin\Release\Microsoft.Media.Analytics.pri																								Microsoft.PlayerFramework.Js.Analytics\Redist\CommonConfiguration\neutral\Microsoft.Media.Analytics\
copy ..\..\Win8.WinRT.Analytics\bin\Release\Microsoft.Media.Analytics.winmd																								Microsoft.PlayerFramework.Js.Analytics\References\CommonConfiguration\neutral\
copy ..\..\Win8.WinRT.Analytics\bin\Release\Microsoft.Media.Analytics.xml																								Microsoft.PlayerFramework.Js.Analytics\References\CommonConfiguration\neutral\
copy ..\..\Win8.Js.Analytics\bin\Release\Microsoft.PlayerFramework.Js.Analytics.winmd																					Microsoft.PlayerFramework.Js.Analytics\References\CommonConfiguration\neutral\
copy ..\..\Win8.Js.Analytics\bin\Release\Microsoft.PlayerFramework.Js.Analytics.xml 																					Microsoft.PlayerFramework.Js.Analytics\References\CommonConfiguration\neutral\
copy ..\..\Win8.WinRT.AdaptiveStreaming.Analytics\bin\x86\Release\Microsoft.Media.AdaptiveStreaming.Analytics.pri														Microsoft.PlayerFramework.Js.Analytics\Redist\CommonConfiguration\neutral\Microsoft.Media.AdaptiveStreaming.Analytics\
copy ..\..\Win8.WinRT.AdaptiveStreaming.Analytics\bin\x86\Release\Microsoft.Media.AdaptiveStreaming.Analytics.winmd														Microsoft.PlayerFramework.Js.Analytics\References\CommonConfiguration\x86\
copy ..\..\Win8.WinRT.AdaptiveStreaming.Analytics\bin\x64\Release\Microsoft.Media.AdaptiveStreaming.Analytics.winmd														Microsoft.PlayerFramework.Js.Analytics\References\CommonConfiguration\x64\
copy ..\..\Win8.WinRT.AdaptiveStreaming.Analytics\bin\ARM\Release\Microsoft.Media.AdaptiveStreaming.Analytics.winmd														Microsoft.PlayerFramework.Js.Analytics\References\CommonConfiguration\ARM\

copy ..\..\Win8.WinRT.AdaptiveStreaming.Dash\bin\x86\Release\Microsoft.Media.AdaptiveStreaming.Dash.pri																	Microsoft.PlayerFramework.Dash\Redist\CommonConfiguration\neutral\Microsoft.Media.AdaptiveStreaming.Dash\
copy ..\..\Win8.WinRT.AdaptiveStreaming.Dash\bin\x86\Release\Microsoft.Media.AdaptiveStreaming.Dash.winmd																Microsoft.PlayerFramework.Dash\References\CommonConfiguration\x86\
copy ..\..\Win8.WinRT.AdaptiveStreaming.Dash\bin\x64\Release\Microsoft.Media.AdaptiveStreaming.Dash.winmd																Microsoft.PlayerFramework.Dash\References\CommonConfiguration\x64\
copy ..\..\Win8.WinRT.AdaptiveStreaming.Dash\bin\ARM\Release\Microsoft.Media.AdaptiveStreaming.Dash.winmd																Microsoft.PlayerFramework.Dash\References\CommonConfiguration\ARM\
copy ..\..\Lib\Portable\Microsoft.Media.ISO\bin\Release\Microsoft.Media.ISO.dll																							Microsoft.PlayerFramework.Dash\References\CommonConfiguration\neutral\

copy ..\..\Win8.WinRT.Analytics.Advertising\bin\x86\Release\Microsoft.Media.Analytics.Advertising.pri																	Microsoft.PlayerFramework.Analytics.Advertising\Redist\CommonConfiguration\neutral\Microsoft.Media.Analytics.Advertising\
copy ..\..\Win8.WinRT.Analytics.Advertising\bin\x86\Release\Microsoft.Media.Analytics.Advertising.winmd																	Microsoft.PlayerFramework.Analytics.Advertising\References\CommonConfiguration\x86\
copy ..\..\Win8.WinRT.Analytics.Advertising\bin\x64\Release\Microsoft.Media.Analytics.Advertising.winmd																	Microsoft.PlayerFramework.Analytics.Advertising\References\CommonConfiguration\x64\
copy ..\..\Win8.WinRT.Analytics.Advertising\bin\ARM\Release\Microsoft.Media.Analytics.Advertising.winmd																	Microsoft.PlayerFramework.Analytics.Advertising\References\CommonConfiguration\ARM\

copy ..\..\Win8.WinRT.Analytics.AudienceInsight\bin\x86\Release\Microsoft.Media.Analytics.AudienceInsight.pri															Microsoft.PlayerFramework.Analytics.AudienceInsight\Redist\CommonConfiguration\neutral\Microsoft.Media.Analytics.AudienceInsight\
copy ..\..\Win8.WinRT.Analytics.AudienceInsight\bin\x86\Release\Microsoft.Media.Analytics.AudienceInsight.winmd															Microsoft.PlayerFramework.Analytics.AudienceInsight\References\CommonConfiguration\x86\
copy ..\..\Win8.WinRT.Analytics.AudienceInsight\bin\x64\Release\Microsoft.Media.Analytics.AudienceInsight.winmd															Microsoft.PlayerFramework.Analytics.AudienceInsight\References\CommonConfiguration\x64\
copy ..\..\Win8.WinRT.Analytics.AudienceInsight\bin\ARM\Release\Microsoft.Media.Analytics.AudienceInsight.winmd															Microsoft.PlayerFramework.Analytics.AudienceInsight\References\CommonConfiguration\ARM\

copy ..\..\Win8.WinRT.AudienceInsight\bin\Release\Microsoft.Media.AudienceInsight.pri																					Microsoft.Media.AudienceInsight\Redist\CommonConfiguration\neutral\Microsoft.Media.AudienceInsight\
copy ..\..\Win8.WinRT.AudienceInsight\bin\Release\Microsoft.Media.AudienceInsight.winmd																					Microsoft.Media.AudienceInsight\References\CommonConfiguration\neutral\

@popd

@echo.
@echo Done.
@echo.
