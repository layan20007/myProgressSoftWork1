
import 'package:flutter/material.dart';
import 'package:flutter_sound_lite/public/flutter_sound_recorder.dart';
import 'package:flutter_sound_lite/flutter_sound.dart';
import 'package:permission_handler/permission_handler.dart';

class audioRecording extends StatefulWidget {
  const audioRecording({Key? key}) : super(key: key);

  @override
  State<audioRecording> createState() => _audioRecordingState();
}

var isRecording = recorder.isRecording ;
var icon = isRecording ? Icons.stop : Icons.mic;
var text = isRecording ? 'Stop' : 'Start' ;
var primary = isRecording ? Colors.red : Colors.white ;
var onPrimary = isRecording ? Colors.white : Colors.black;
var recorder = soundRecorder();

class _audioRecordingState extends State<audioRecording> {



  @override
  void initState(){
    super.initState();

    recorder.init();
  }

  @override
  void dispose(){

    recorder.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('audio'),
      ),
      body: Center(
        child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            foregroundColor: onPrimary,
            backgroundColor: primary,
            minimumSize: Size(200, 50),


          ),

          icon: Icon(icon),
          label: Text(text,
          style: TextStyle(fontSize: 20,
          fontWeight: FontWeight.bold),
          ),
          onPressed: () async {
             isRecording = await recorder.toggleRecording();
            setState(() {

            });
          },


        ),
      ),
    );
  }
}
final pathToSaveAudio = '';

class soundRecorder {
  FlutterSoundRecorder? _audioRecorder;
  bool _isRecorderInitialised = false;

  bool get isRecording => _audioRecorder!.isRecording;

  Future init() async{
    _audioRecorder = FlutterSoundRecorder();

    final status = await Permission.microphone.request();
    if(status != PermissionStatus.granted){
      throw RecordingPermissionException('Microphone permission');
    }
    await _audioRecorder!.openAudioSession();
     _isRecorderInitialised = true;
  }

  void dispose(){
    if(!_isRecorderInitialised) return;
    _audioRecorder!.closeAudioSession();
    _audioRecorder = null;
    _isRecorderInitialised = false;
  }

  Future _record() async{
    if(!_isRecorderInitialised) return;
    await _audioRecorder!.startRecorder(toFile: pathToSaveAudio);
  }

  Future _stop() async{
    if(!_isRecorderInitialised) return;
    await _audioRecorder!.stopRecorder();
  }
  Future toggleRecording() async{
    if(_audioRecorder!.isStopped){
      await _record();
    }
    else{
      await _stop();
    }
  }


}
