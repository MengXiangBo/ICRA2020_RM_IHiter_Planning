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

class c_start_end_srvRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.flPathStartX = null;
      this.flPathStartY = null;
      this.flPathEndX = null;
      this.flPathEndY = null;
      this.vfConstraintPositionX = null;
      this.vfConstraintPositionY = null;
      this.flConstraintVelocity = null;
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
      if (initObj.hasOwnProperty('vfConstraintPositionX')) {
        this.vfConstraintPositionX = initObj.vfConstraintPositionX
      }
      else {
        this.vfConstraintPositionX = [];
      }
      if (initObj.hasOwnProperty('vfConstraintPositionY')) {
        this.vfConstraintPositionY = initObj.vfConstraintPositionY
      }
      else {
        this.vfConstraintPositionY = [];
      }
      if (initObj.hasOwnProperty('flConstraintVelocity')) {
        this.flConstraintVelocity = initObj.flConstraintVelocity
      }
      else {
        this.flConstraintVelocity = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type c_start_end_srvRequest
    // Serialize message field [flPathStartX]
    bufferOffset = _serializer.float32(obj.flPathStartX, buffer, bufferOffset);
    // Serialize message field [flPathStartY]
    bufferOffset = _serializer.float32(obj.flPathStartY, buffer, bufferOffset);
    // Serialize message field [flPathEndX]
    bufferOffset = _serializer.float32(obj.flPathEndX, buffer, bufferOffset);
    // Serialize message field [flPathEndY]
    bufferOffset = _serializer.float32(obj.flPathEndY, buffer, bufferOffset);
    // Serialize message field [vfConstraintPositionX]
    bufferOffset = _arraySerializer.float32(obj.vfConstraintPositionX, buffer, bufferOffset, null);
    // Serialize message field [vfConstraintPositionY]
    bufferOffset = _arraySerializer.float32(obj.vfConstraintPositionY, buffer, bufferOffset, null);
    // Serialize message field [flConstraintVelocity]
    bufferOffset = _serializer.float32(obj.flConstraintVelocity, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type c_start_end_srvRequest
    let len;
    let data = new c_start_end_srvRequest(null);
    // Deserialize message field [flPathStartX]
    data.flPathStartX = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [flPathStartY]
    data.flPathStartY = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [flPathEndX]
    data.flPathEndX = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [flPathEndY]
    data.flPathEndY = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [vfConstraintPositionX]
    data.vfConstraintPositionX = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [vfConstraintPositionY]
    data.vfConstraintPositionY = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [flConstraintVelocity]
    data.flConstraintVelocity = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 4 * object.vfConstraintPositionX.length;
    length += 4 * object.vfConstraintPositionY.length;
    return length + 28;
  }

  static datatype() {
    // Returns string type for a service object
    return 'icra_nav/c_start_end_srvRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '88f1f4545b684e624f61ddcb593a90fa';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32 flPathStartX
    float32 flPathStartY
    float32 flPathEndX
    float32 flPathEndY
    float32[] vfConstraintPositionX
    float32[] vfConstraintPositionY
    float32 flConstraintVelocity
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new c_start_end_srvRequest(null);
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

    if (msg.vfConstraintPositionX !== undefined) {
      resolved.vfConstraintPositionX = msg.vfConstraintPositionX;
    }
    else {
      resolved.vfConstraintPositionX = []
    }

    if (msg.vfConstraintPositionY !== undefined) {
      resolved.vfConstraintPositionY = msg.vfConstraintPositionY;
    }
    else {
      resolved.vfConstraintPositionY = []
    }

    if (msg.flConstraintVelocity !== undefined) {
      resolved.flConstraintVelocity = msg.flConstraintVelocity;
    }
    else {
      resolved.flConstraintVelocity = 0.0
    }

    return resolved;
    }
};

class c_start_end_srvResponse {
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
    // Serializes a message object of type c_start_end_srvResponse
    // Serialize message field [boSuccess]
    bufferOffset = _serializer.bool(obj.boSuccess, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type c_start_end_srvResponse
    let len;
    let data = new c_start_end_srvResponse(null);
    // Deserialize message field [boSuccess]
    data.boSuccess = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'icra_nav/c_start_end_srvResponse';
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
    const resolved = new c_start_end_srvResponse(null);
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
  Request: c_start_end_srvRequest,
  Response: c_start_end_srvResponse,
  md5sum() { return '3ab9bc810918bba29099b96e055d02bf'; },
  datatype() { return 'icra_nav/c_start_end_srv'; }
};
