'use strict';

const functions = require('firebase-functions');

const outputAudioEncoding = 'MP3';
const voiceSsmlGender = 'NEUTRAL';

const {SpeechClient} = require('@google-cloud/speech');
const {TextToSpeechClient} = require('@google-cloud/text-to-speech');

const speechToTextClient = new SpeechClient();
const textToSpeechClient = new TextToSpeechClient();

exports.recognizeSpeech = functions.https.onRequest(
  async (request, response) => {
    const responseBody = {};

    try {
      await validateRequest(request);

      const inputEncoding = request.body.encoding;
      const inputSampleRateHertz = request.body.sampleRateHertz;
      const inputLanguageCode = request.body.languageCode;
      const inputAudioContent = request.body.audioContent;

      console.log(`Input encoding: ${inputEncoding}`);
      console.log(`Input sample rate hertz: ${inputSampleRateHertz}`);
      console.log(`Input language code: ${inputLanguageCode}`);

      const [sttResponse] = await callSpeechToText(
        inputAudioContent,
        inputEncoding,
        inputSampleRateHertz,
        inputLanguageCode
      );

      const transcription = sttResponse.results
        .map(result => result.alternatives[0].transcript)
        .join('\n');
      responseBody.transcription = transcription;
      response.status(200).send(responseBody);
    } catch (error) {
      console.error(error);
      response.status(400).send(error.message);
    }
  }
);

// [START call_speech_to_text]
const callSpeechToText = (
  audioContent,
  encoding,
  sampleRateHertz,
  languageCode
) => {
  console.log(`Processing speech from audio content in ${languageCode}.`);

  const request = {
    config: {
      encoding: encoding,
      sampleRateHertz: sampleRateHertz,
      languageCode: languageCode,
    },
    audio: {content: audioContent},
  };

  return speechToTextClient.recognize(request);
};
// [END call_speech_to_text]

// [START call_text_to_speech]
const callTextToSpeech = (targetLocale, data) => {
  console.log(`Converting to speech in ${targetLocale}: ${data}`);

  const request = {
    input: {text: data},
    voice: {languageCode: targetLocale, ssmlGender: voiceSsmlGender},
    audioConfig: {audioEncoding: outputAudioEncoding},
  };

  return textToSpeechClient.synthesizeSpeech(request);
};
// [END call_text_to_speech]

// [START validate_request]
const validateRequest = request => {
  return new Promise((resolve, reject) => {
    if (!request.body.encoding) {
      reject(new Error('Invalid encoding.'));
    }
    if (!request.body.sampleRateHertz || isNaN(request.body.sampleRateHertz)) {
      reject(new Error('Sample rate hertz must be numeric.'));
    }
    if (!request.body.languageCode) {
      reject(new Error('Invalid language code.'));
    }
    if (!request.body.audioContent) {
      reject(new Error('Invalid audio content.'));
    }

    resolve();
  });
};
// [END validate_request]
