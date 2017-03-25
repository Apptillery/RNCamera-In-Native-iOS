'use strict';
import React, { Component } from 'react';
import {
  AppRegistry,
  Dimensions,
  StyleSheet,
  View,
  TouchableWithoutFeedback,
  Animated,
  Easing,
  NativeModules,
} from 'react-native';
import Camera from 'react-native-camera';

const buttonWidth = 80;

const { RNCameraManager } = NativeModules;

export default class StyledCamera extends Component {

  constructor(props){
    super(props);

    console.log("The identifier is",props.identifier)
    this.state = {
      bounceValue: new Animated.Value(1),
      identifier : props.identifier,
    };
  }

    takePicture() {
      // this will make the camera take a picture and save it to the photo library
      // or it will give us an error
       Animated.timing(
            this.state.bounceValue,
            {
              toValue: 0.8,
              duration: 225,
              easing: Easing.in
            }
          ).start(() =>  this.bounceBack()
        )

      this.camera.capture()
        .then((imageInfo) =>  {RNCameraManager.cameraDidTakePicture(imageInfo,this.state.identifier);})
        .catch(err => console.error(err));
    }

    bounceBack() {
      Animated.spring(                       
        this.state.bounceValue,             
        {
          toValue: 1,              
          friction: 10,                         
        }
      ).start();   
  }
  



render() {
    return (
      <View style={styles.container}>
        <Camera
          ref={(cam) => {
            this.camera = cam;
          }}
          style={styles.preview}
          aspect={Camera.constants.Aspect.fill}
          onZoomChanged={(event)=>{var{velo,zoomFactor}=event.nativeEvent;
          console.log('we have a zoom')}}
          onFocusChanged={(event)=>{var{x,y}=event.nativeEvent;
          console.log('we have a touch')}}>

          <View style={{width:buttonWidth,height:buttonWidth,borderRadius:buttonWidth/2,backgroundColor:'transparent',alignItems:'center',justifyContent:'center',borderColor:'white',borderWidth:4,marginBottom:20}}>
              <TouchableWithoutFeedback
                          onPress={this.takePicture.bind(this)}>
                         <Animated.View style={{borderRadius:1000,backgroundColor:'white',padding:20,transform: [                        // `transform` is an ordered array
                                          {scale: this.state.bounceValue},  // Map `bounceValue` to `scale`
                                          ]}}/>
              </TouchableWithoutFeedback>
          </View>
        </Camera>
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1
  },
  preview: {
    flex: 1,
    justifyContent: 'flex-end',
    alignItems: 'center',
  }
});
