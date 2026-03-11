unit swamp_strings;

{ Всі рядки проекту SW-AMP для перекладу.
   Окремий юніт щоб уникнути циклічних залежностей. }

{$mode objfpc}{$H+}

interface

resourcestring
  openplaylistCaption = 'Open Playlist';
  ofeq = 'Off Equalizer';
  oneq = 'On Equalizer';
  hideq = 'Hide Equalizer';
  sheq = 'Show Equalizer';
  logvol = 'Logarithmic volume control';
  tonvol = 'Loudly compensated volume control';
  offanalizer = 'Turn OFF Analizer';
  bandanalizer = 'Count Bands Analizer';
  autoplay = 'Auto Play';
  player = 'Player';
  equalizer = 'Equalazer';
  spanalizer = 'Spectrum Analizer';
  interpolat0 = 'Interpolation: Linear';
  interpolat1 = 'Interpolation: Sync 8 point';
  interpolat2 = 'Interpolation: Sync 16 point';
  interpolat3 = 'Interpolation: Sync 32 point ';
  interpolat4 = 'Interpolation: Sync 64 point';
  FlChor0 = 'Flanger';
  FlChor1 = 'Exaggerated chorus leads to multiple pitch shifted voices';
  FlChor2 = 'Motocycle';
  FlChor3 = 'Devil';
  FlChor4 = 'Who say that there are not many voices?';
  FlChor5 = 'Back chipmunk';
  FlChor6 = 'Water';
  FlChor7 = 'This is the airplane';
  actualbitrate ='Actual Track Bitrate';
  clearYesNo = 'Are you sure you want to clear the playlist?';
  stereo = 'Stereo';
  mono = 'Mono';
  bright = 'Bright';
  volume = 'Volume';
  balance = 'Balanсe';
  frequency = 'Frequency modulation';
  flanger = 'Flanger';
  chorus = 'Chorus';
  reverberation = 'Reverberation';
  echo = 'Echo';
  delayleft = 'Delay for left channel';
  delayright = 'Delay for right channel';
  wet = 'Delayed/Direct';
  feedback = 'Feedback';
  depth = 'Depth';
  reverbtime = 'Reverberation Time';
  reverbmix = 'Reverberation Mix';
  efects = 'Effects';
  line = 'Line';
  bargraph = 'Bar Graph';
  params = 'Params';
  playlist ='PlayList';
  effenable = 'Effect Enable';
  stopanalizer = 'Stop Analizer';
  startanalizer = 'Start Analizer';
  rsDB = ' dB';
  languages = 'Languages';
  afile = 'The file ';
  nosuch = ' does not exist';
  afileerror = 'File upload error';
  confirm = 'Confirm';
  aCancel = 'Cancel';
  aDelete = 'Are you sure you want to delete this ';
  bFile = 'file?';
  eBASS_ERROR_INIT = 'BASS_Init has not been successfully called.';
  eBASS_ERROR_NOTAVAIL = 'The BASS_STREAM_AUTOFREE flag cannot be combined with the BASS_STREAM_DECODE flag.';
  eBASS_ERROR_NONET = 'No internet connection could be opened. Can be caused by a bad proxy setting.';
  eBASS_ERROR_ILLPARAM = 'url is not a valid URL.';
  eBASS_ERROR_PROTOCOL = 'The protocol in url is not supported.';
  eBASS_ERROR_SSL      = 'SSL/HTTPS support is not available. See BASS_CONFIG_LIBSSL.';
  eBASS_ERROR_TIMEOUT  = 'The server did not respond to the request within the timeout period, as set with the BASS_CONFIG_NET_TIMEOUT config option.';
  eBASS_ERROR_DENIED   = 'A valid username/password is required.';
  eBASS_ERROR_FILEOPEN = 'The file could not be opened.';
  eBASS_ERROR_FILEFORM = 'The file'+'s format is not recognised/supported.';
  eBASS_ERROR_UNSTREAMABLE = 'The file cannot be streamed. This could be because an MP4 file'+'s mdat atom comes before its "moov" atom.';
  eBASS_ERROR_NOTAUDIO = 'The file does not contain audio, or it also contains video and videos are disabled.';
  eBASS_ERROR_CODEC    = 'The file uses a codec that is not available/supported. This can apply to WAV and AIFF files.';
  eBASS_ERROR_FORMAT   = 'The sample format is not supported.';
  eBASS_ERROR_SPEAKER  = 'The specified SPEAKER flags are invalid.';
  eBASS_ERROR_MEM      = 'There is insufficient memory.';
  eBASS_ERROR_NO3D     = 'Could not initialize 3D support.';
  eBASS_ERROR_UNKNOWN  = 'Some other mystery problem!';
  // Track Properties dialog
  // Track properties strings moved to swamp_strings.pas  // Track Properties dialog
  rsNoStreamProps   = 'Properties are not available for internet streams.';
  rsFileNotFound    = 'File not found:';
  // Track Information form
  rsFileInfoCaption = 'Track Information';
  rsClose           = 'Close';
  rsTabTags         = 'Tags';
  rsTabAudio        = 'Audio';
  rsTabFile         = 'File';
  rsTabCover        = 'Cover';
  rsTitle           = 'Title:';
  rsArtist          = 'Artist:';
  rsAlbum           = 'Album:';
  rsYear            = 'Year:';
  rsGenre           = 'Genre:';
  rsTrackNo         = 'Track #:';
  rsComment         = 'Comment:';
  rsFormat          = 'Format:';
  rsBitrate         = 'Bitrate:';
  rsSampleRate      = 'Sample rate:';
  rsChannels        = 'Channels:';
  rsDuration        = 'Duration:';
  rsFileName        = 'File name:';
  rsFileSize        = 'Size:';
  rsModified        = 'Modified:';
  rsNoCover         = 'No cover image';
  rsChMono          = '1 (Mono)';
  rsChStereo        = '2 (Stereo)';
  rsCannotOpen      = '(failed to open file)';
  rsOnlyStream      = 'This List only for stream''s';
  rsPlayBackError   = 'File playback error';
  rsErrorLoad       = 'Error load';
  rsNhappend        = 'won''t happen!';

implementation

end.
