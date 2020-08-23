// Auto-generated. Do not edit!

// (in-package icra_nav.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class start_end_srvRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.flPathStartX = null;
      this.flPathStartY = null;
      this.flPathEndX = null;
      this.flPathEndY = null;
    }
    else {
      if (initObj.hasOwnProperty('flPathStartX')) {
        this.flPathStartX = initObj.flPathStartX
      }
      else {
        this.flPathStartX = 0.0;
      }
      if (initObj.hasOwnProperty('flPathStartY')) {
        this.flPathStartY = initObj.flPathStartY
      }
      else {
        this.flPathStartY = 0.0;
      }
      if (initObj.hasOwnProperty('flPathEndX')) {
        this.flPathEndX = initObj.flPathEndX
      }
      else {
        this.flPathEndX = 0.0;
      }
      if (initObj.hasOwnProperty('flPathEndY')) {
        this.flPathEndY = initObj.flPathEndY
      }
      else {
        this.flPathEndY = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type start_end_srvRequest
    // Serialize message field [flPathStartX]
    bufferOffset = _serializer.float32(obj.flPathStartX, buffer, bufferOffset);
    // Serialize message field [flPathStartY]
    bufferOffset = _serializer.float32(obj.flPathStartY, buffer, bufferOffset);
    // Serialize message field [flPathEndX]
    bufferOffset = _serializer.float32(obj.flPathEndX, buffer, bufferOffset);
    // Serialize message field [flPathEndY]
    bufferOffset = _serializer.float32(obj.flPathEndY, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type start_end_srvRequest
    let len;
    let data = new start_end_srvRequest(null);
    // Deserialize message field [flPathStartX]
    data.flPathStartX = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [flPathStartY]
    data.flPathStartY = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [flPathEndX]
    data.flPathEndX = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [flPathEndY]
    data.flPathEndY = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 16;
  }

  static datatype() {
    // Returns string type for a service object
    return 'icra_nav/start_end_srvRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '42443cc43e1a8ecf8fa7b16779669543';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32 flPathStartX
    float32 flPathStartY
    float32 flPathEndX
    float32 flPathEndY
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new start_end_srvRequest(null);
    if (msg.flPathStartX !== undefined) {
      resolved.flPathStartX = msg.flPathStartX;
    }
    else {
      resolved.flPathStartX = 0.0
    }

    if (msg.flPathStartY !== undefined) {
      resolved.flPathStartY = msg.flPathStartY;
    }
    else {
      resolved.flPathStartY = 0.0
    }

    if (msg.flPathEndX !== undefined) {
      resolved.flPathEndX = msg.flPathEndX;
    }
    else {
      resolved.flPathEndX = 0.0
    }

    if (msg.flPathEndY !== undefined) {
      resolved.flPathEndY = msg.flPathEndY;
    }
    else {
      resolved.flPathEndY = 0.0
    }

    return resolved;
    }
};

class start_end_srvResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.boSuccess = null;
    }
    else {
      if (initObj.hasOwnProperty('boSuccess')) {
        this.boSuccess = initObj.boSuccess
      }
      else {
        this.boSuccess = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type start_end_srvResponse
    // Serialize message field [boSuccess]
    bufferOffset = _serializer.bool(obj.boSuccess, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type start_end_srvResponse
    let len;
    let data = new start_end_srvResponse(null);
    // Deserialize message field [boSuccess]
    data.boSuccess = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'icra_nav/start_end_srvResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'eca856ee71f824332e753aaa50c58161';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool boSuccess
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new start_end_srvResponse(null);
    if (msg.boSuccess !== undefined) {
      resolved.boSuccess = msg.boSuccess;
    }
    else {
      resolved.boSuccess = false
    }

    return resolved;
    }
};

module.exports = {
  Request: start_end_srvRequest,
  Response: start_end_srvResponse,
  md5sum() { return '276ffc8a587afd4c10db6438819f07e3'; },
  datatype() { return 'icra_nav/start_end_srv'; }
};
