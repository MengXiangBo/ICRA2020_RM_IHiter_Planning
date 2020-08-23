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

class GameStatus {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.game_status = null;
      this.remaining_time = null;
    }
    else {
      if (initObj.hasOwnProperty('game_status')) {
        this.game_status = initObj.game_status
      }
      else {
        this.game_status = 0;
      }
      if (initObj.hasOwnProperty('remaining_time')) {
        this.remaining_time = initObj.remaining_time
      }
      else {
        this.remaining_time = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GameStatus
    // Serialize message field [game_status]
    bufferOffset = _serializer.uint8(obj.game_status, buffer, bufferOffset);
    // Serialize message field [remaining_time]
    bufferOffset = _serializer.uint16(obj.remaining_time, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GameStatus
    let len;
    let data = new GameStatus(null);
    // Deserialize message field [game_status]
    data.game_status = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [remaining_time]
    data.remaining_time = _deserializer.uint16(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 3;
  }

  static datatype() {
    // Returns string type for a message object
    return 'roborts_msgs/GameStatus';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '1420f1b84d9eff8855d07e0139b55a97';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    #game status
    uint8 PRE_MATCH = 0
    uint8 SETUP = 1
    uint8 INIT = 2
    uint8 FIVE_SEC_CD = 3
    uint8 ROUND = 4
    uint8 CALCULATION = 5
    uint8 game_status
    uint16 remaining_time
    
    
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GameStatus(null);
    if (msg.game_status !== undefined) {
      resolved.game_status = msg.game_status;
    }
    else {
      resolved.game_status = 0
    }

    if (msg.remaining_time !== undefined) {
      resolved.remaining_time = msg.remaining_time;
    }
    else {
      resolved.remaining_time = 0
    }

    return resolved;
    }
};

// Constants for message
GameStatus.Constants = {
  PRE_MATCH: 0,
  SETUP: 1,
  INIT: 2,
  FIVE_SEC_CD: 3,
  ROUND: 4,
  CALCULATION: 5,
}

module.exports = GameStatus;
