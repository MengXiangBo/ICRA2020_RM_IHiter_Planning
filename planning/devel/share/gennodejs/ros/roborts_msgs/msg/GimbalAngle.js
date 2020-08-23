// Auto-generated. Do not edit!

// (in-package roborts_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class GimbalAngle {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.yaw_mode = null;
      this.pitch_mode = null;
      this.yaw_angle = null;
      this.pitch_angle = null;
    }
    else {
      if (initObj.hasOwnProperty('yaw_mode')) {
        this.yaw_mode = initObj.yaw_mode
      }
      else {
        this.yaw_mode = false;
      }
      if (initObj.hasOwnProperty('pitch_mode')) {
        this.pitch_mode = initObj.pitch_mode
      }
      else {
        this.pitch_mode = false;
      }
      if (initObj.hasOwnProperty('yaw_angle')) {
        this.yaw_angle = initObj.yaw_angle
      }
      else {
        this.yaw_angle = 0.0;
      }
      if (initObj.hasOwnProperty('pitch_angle')) {
        this.pitch_angle = initObj.pitch_angle
      }
      else {
        this.pitch_angle = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GimbalAngle
    // Serialize message field [yaw_mode]
    bufferOffset = _serializer.bool(obj.yaw_mode, buffer, bufferOffset);
    // Serialize message field [pitch_mode]
    bufferOffset = _serializer.bool(obj.pitch_mode, buffer, bufferOffset);
    // Serialize message field [yaw_angle]
    bufferOffset = _serializer.float64(obj.yaw_angle, buffer, bufferOffset);
    // Serialize message field [pitch_angle]
    bufferOffset = _serializer.float64(obj.pitch_angle, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GimbalAngle
    let len;
    let data = new GimbalAngle(null);
    // Deserialize message field [yaw_mode]
    data.yaw_mode = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [pitch_mode]
    data.pitch_mode = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [yaw_angle]
    data.yaw_angle = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [pitch_angle]
    data.pitch_angle = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 18;
  }

  static datatype() {
    // Returns string type for a message object
    return 'roborts_msgs/GimbalAngle';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'b3949b2683b910b23b0cb34879284a9b';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    #gimbal feedback angle data
    bool yaw_mode
    bool pitch_mode
    float64 yaw_angle
    float64 pitch_angle
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GimbalAngle(null);
    if (msg.yaw_mode !== undefined) {
      resolved.yaw_mode = msg.yaw_mode;
    }
    else {
      resolved.yaw_mode = false
    }

    if (msg.pitch_mode !== undefined) {
      resolved.pitch_mode = msg.pitch_mode;
    }
    else {
      resolved.pitch_mode = false
    }

    if (msg.yaw_angle !== undefined) {
      resolved.yaw_angle = msg.yaw_angle;
    }
    else {
      resolved.yaw_angle = 0.0
    }

    if (msg.pitch_angle !== undefined) {
      resolved.pitch_angle = msg.pitch_angle;
    }
    else {
      resolved.pitch_angle = 0.0
    }

    return resolved;
    }
};

module.exports = GimbalAngle;
