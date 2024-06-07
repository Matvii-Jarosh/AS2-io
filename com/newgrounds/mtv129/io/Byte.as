/**
 * Class for work whith one Byte
 */
class com.newgrounds.mtv129.io.Byte {
	/**
	 * Array for storage bits data
	 */
    private var bits:Array;

    /**
     * Constructor for the Byte class.
     * @param value The initial value of the byte (0 to 255).
     */
    public function Byte(value:Number) {
        bits = new Array(8);
        setValue(value || 0);
    }

    /**
     * Get the value of the byte as a number.
     * @return The numeric value of the byte (0 to 255).
     */
    public function getValue():Number {
        var result:Number = 0;
        for (var i = 0; i < bits.length; i++) {
            if (bits[i]) {
                result += Math.pow(2, i);
            }
        }
        return result;
    }

    /**
     * Set the value of the byte.
     * @param value The numeric value (0 to 255).
     */
    public function setValue(value:Number):Void {
        for (var i = 0; i < 8; i++) {
            bits[i] = Boolean((value >> i) & 1);
        }
    }

    /**
     * Set the value of a specific bit.
     * @param index The index of the bit (0 to 7).
     * @param value The value of the bit (true for 1, false for 0).
     */
    public function setBit(index:Number, value:Boolean):Void {
        if (index >= 0 && index < 8) {
            bits[index] = value;
        }
    }

    /**
     * Get the value of a specific bit.
     * @param index The index of the bit (0 to 7).
     * @return The value of the bit (true for 1, false for 0).
     */
    public function getBit(index:Number):Boolean {
        if (index >= 0 && index < 8) {
            return bits[index];
        }
        return false;
    }

    /**
     * Toggle the value of a specific bit.
     * @param index The index of the bit (0 to 7).
     */
    public function toggleBit(index:Number):Void {
        if (index >= 0 && index < 8) {
            bits[index] = !bits[index];
        }
    }

    /**
     * Clear all bits (set to 0).
     */
    public function clear():Void {
        for (var i = 0; i < 8; i++) {
            bits[i] = false;
        }
    }

    /**
     * Get the string representation of the byte.
     * @return A string representing the byte in binary form (e.g., "10101010").
     */
    public function toString():String {
        var str:String = "";
        for (var i = 7; i >= 0; i--) {
            str += bits[i] ? "1" : "0";
        }
        return str;
    }

    /**
     * Bitwise AND with another byte.
     * @param other Another byte.
     * @return A new byte, the result of the bitwise AND.
     */
    public function _and(other:com.newgrounds.mtv129.io.Byte):com.newgrounds.mtv129.io.Byte {
        var result:com.newgrounds.mtv129.io.Byte = new com.newgrounds.mtv129.io.Byte(0);
        for (var i = 0; i < 8; i++) {
            result.setBit(i, this.bits[i] && other.getBit(i));
        }
        return result;
    }

    /**
     * Bitwise OR with another byte.
     * @param other Another byte.
     * @return A new byte, the result of the bitwise OR.
     */
    public function _or(other:com.newgrounds.mtv129.io.Byte):com.newgrounds.mtv129.io.Byte {
        var result:com.newgrounds.mtv129.io.Byte = new com.newgrounds.mtv129.io.Byte(0);
        for (var i = 0; i < 8; i++) {
            result.setBit(i, this.bits[i] || other.getBit(i));
        }
        return result;
    }

    /**
     * Bitwise XOR with another byte.
     * @param other Another byte.
     * @return A new byte, the result of the bitwise XOR.
     */
    public function _xor(other:com.newgrounds.mtv129.io.Byte):com.newgrounds.mtv129.io.Byte {
        var result:com.newgrounds.mtv129.io.Byte = new com.newgrounds.mtv129.io.Byte(0);
        for (var i = 0; i < 8; i++) {
            result.setBit(i, this.bits[i] != other.getBit(i));
        }
        return result;
    }

    /**
     * Bitwise NOT.
     * @return A new byte, the result of the bitwise NOT.
     */
    public function _not():com.newgrounds.mtv129.io.Byte {
        var result:com.newgrounds.mtv129.io.Byte = new com.newgrounds.mtv129.io.Byte(0);
        for (var i = 0; i < 8; i++) {
            result.setBit(i, !this.bits[i]);
        }
        return result;
    }

    /**
     * Shift the bits to the left.
     */
    public function shiftLeft():Void {
        for (var i = 7; i > 0; i--) {
            bits[i] = bits[i - 1];
        }
        bits[0] = false;
    }

    /**
     * Shift the bits to the right.
     */
    public function shiftRight():Void {
        for (var i = 0; i < 7; i++) {
            bits[i] = bits[i + 1];
        }
        bits[7] = false;
    }
}
