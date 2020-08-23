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

class add_ob_srvRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.inFrom = null;
      this.inTo = null;
      this.flObstacleX = null;
      this.flObstacleY = null;
    }
    else {
      if (initObj.hasOwnProperty('inFrom')) {
        this.inFrom = initObj.inFrom
      }
      else {
        this.inFrom = 0;
      }
      if (initObj.hasOwnProperty('inTo')) {
        this.inTo = initObj.inTo
      }
      else {
        this.inTo = 0;
      }
      if (initObj.hasOwnProperty('flObstacleX')) {
        this.flObstacleX = initObj.flObstacleX
      }
      else {
        this.flObstacleX = 0.0;
      }
      if (initObj.hasOwnProperty('flObstacleY')) {
        this.flObstacleY = initObj.flObstacleY
      }
      else {
        this.flObstacleY = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type add_ob_srvRequest
    // Serialize message field [inFrom]
    bufferOffset = _serializer.int32(obj.inFrom, buffer, bufferOffset);
    // Serialize message field [inTo]
    bufferOffset = _serializer.int32(obj.inTo, buffer, bufferOffset);
    // Serialize message field [flObstacleX]
    bufferOffset = _serializer.float32(obj.flObstacleX, buffer, bufferOffset);
    // Serialize message field [flObstacleY]
    bufferOffset = _serializer.float32(obj.flObstacleY, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type add_ob_srvRequest
    let len;
    let data = new add_ob_srvRequest(null);
    // Deserialize message field [inFrom]
    data.inFrom = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [inTo]
    data.inTo = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [flObstacleX]
    data.flObstacleX = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [flObstacleY]
    data.flObstacleY = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 16;
  }

  static datatype() {
    // Returns string type for a service object
    return 'icra_nav/add_ob_srvRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '4d93f2e9fe1d31bb11620b319b9e7db3';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 inFrom
    int32 inTo
    float32 flObstacleX
    float32 flObstacleY
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new add_ob_srvRequest(null);
    if (msg.inFrom !== undefined) {
      resolved.inFrom = msg.inFrom;
    }
    else {
      resolved.inFrom = 0
    }

    if (msg.inTo !== undefined) {
      resolved.inTo = msg.inTo;
    }
    else {
      resolved.inTo = 0
    }

    if (msg.flObstacleX !== undefined) {
      resolved.flObstacleX = msg.flObstacleX;
    }
    else {
      resolved.flObstacleX = 0.0
    }

    if (msg.flObstacleY !== undefined) {
      resolved.flObstacleY = msg.flObstacleY;
    }
    else {
      resolved.flObstacleY = 0.0
    }

    return resolved;
    }
};

class add_ob_srvResponse {
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
    // Serializes a message object of type add_ob_srvResponse
    // Serialize message field [boSuccess]
    bufferOffset = _serializer.bool(obj.boSuccess, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type add_ob_srvResponse
    let len;
    let data = new add_ob_srvResponse(null);
    // Deserialize message field [boSuccess]
    data.boSuccess = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'icra_nav/add_ob_srvResponse';
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
    const resolved = new add_ob_srvResponse(null);
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
  Request: add_ob_srvRequest,
  Response: add_ob_srvResponse,
  md5sum() { return 'af88fad9fb4ff2ed0a7581060e7c41e9'; },
  datatype() { return 'icra_nav/add_ob_srv'; }
};
