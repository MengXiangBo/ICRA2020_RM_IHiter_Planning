// Auto-generated. Do not edit!

// (in-package roborts_msgs.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class GimbalModeRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.gimbal_mode = null;
    }
    else {
      if (initObj.hasOwnProperty('gimbal_mode')) {
        this.gimbal_mode = initObj.gimbal_mode
      }
      else {
        this.gimbal_mode = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GimbalModeRequest
    // Serialize message field [gimbal_mode]
    bufferOffset = _serializer.uint8(obj.gimbal_mode, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GimbalModeRequest
    let len;
    let data = new GimbalModeRequest(null);
    // Deserialize message field [gimbal_mode]
    data.gimbal_mode = _deserializer.uint8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'roborts_msgs/GimbalModeRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'c87f8568799ca64a2eed82fa85fa02bb';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint8 gimbal_mode
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GimbalModeRequest(null);
    if (msg.gimbal_mode !== undefined) {
      resolved.gimbal_mode = msg.gimbal_mode;
    }
    else {
      resolved.gimbal_mode = 0
    }

    return resolved;
    }
};

class GimbalModeResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.received = null;
    }
    else {
      if (initObj.hasOwnProperty('received')) {
        this.received = initObj.received
      }
      else {
        this.received = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GimbalModeResponse
    // Serialize message field [received]
    bufferOffset = _serializer.bool(obj.received, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GimbalModeResponse
    let len;
    let data = new GimbalModeResponse(null);
    // Deserialize message field [received]
    data.received = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'roborts_msgs/GimbalModeResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'dd4152e077925db952c78baadb1e48b7';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool received
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GimbalModeResponse(null);
    if (msg.received !== undefined) {
      resolved.received = msg.received;
    }
    else {
      resolved.received = false
    }

    return resolved;
    }
};

module.exports = {
  Request: GimbalModeRequest,
  Response: GimbalModeResponse,
  md5sum() { return 'fcba9db77a7e7488758d65b81c19e513'; },
  datatype() { return 'roborts_msgs/GimbalMode'; }
};
