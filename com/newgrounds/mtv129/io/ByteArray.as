class com.newgrounds.mtv129.io.ByteArray {
    private var bytes:Array;

    /**
     * Constructor for the ByteArray class.
     */
    function ByteArray() {
        bytes = new Array();
    }

    /**
     * Add a Byte to the ByteArray.
     * @param byte The Byte to add.
     */
    public function addByte(byte:com.newgrounds.mtv129.io.Byte):Void {
        bytes.push(byte);
    }

    /**
     * Get the Byte at a specific index.
     * @param index The index of the Byte.
     * @return The Byte at the specified index.
     */
    public function getByte(index:Number):com.newgrounds.mtv129.io.Byte {
        if (index >= 0 && index < bytes.length) {
            return bytes[index];
        }
        return null;
    }

    /**
     * Set a Byte at a specific index.
     * @param index The index to set the Byte.
     * @param byte The Byte to set.
     */
    public function setByte(index:Number, byte:com.newgrounds.mtv129.io.Byte):Void {
        if (index >= 0 && index < bytes.length) {
            bytes[index] = byte;
        }
    }

    /**
     * Remove a Byte at a specific index.
     * @param index The index of the Byte to remove.
     */
    public function removeByte(index:Number):Void {
        if (index >= 0 && index < bytes.length) {
            bytes.splice(index, 1);
        }
    }

    /**
     * Get the length of the ByteArray.
     * @return The number of Bytes in the ByteArray.
     */
    public function length():Number {
        return bytes.length;
    }

    /**
     * Clear all Bytes in the ByteArray.
     */
    public function clear():Void {
        bytes = new Array();
    }

    /**
     * Get the string representation of the ByteArray.
     * @return A string representing the ByteArray in binary form.
     */
    public function toString():String {
        var str:String = "";
        for (var i = 0; i < bytes.length; i++) {
            str += bytes[i].toString() + " ";
        }
        return str;
    }

    /**
     * Copy the ByteArray.
     * @return A new ByteArray that is a copy of this ByteArray.
     */
    public function copy():com.newgrounds.mtv129.io.ByteArray {
        var newArray:com.newgrounds.mtv129.io.ByteArray = new com.newgrounds.mtv129.io.ByteArray();
        for (var i = 0; i < bytes.length; i++) {
            newArray.addByte(bytes[i]);
        }
        return newArray;
    }

    /**
     * Compare this ByteArray with another ByteArray.
     * @param other The other ByteArray.
     * @return True if the ByteArrays are equal, false otherwise.
     */
    public function equals(other:com.newgrounds.mtv129.io.ByteArray):Boolean {
        if (this.length() != other.length()) {
            return false;
        }
        for (var i = 0; i < bytes.length; i++) {
            if (this.getByte(i).getValue() != other.getByte(i).getValue()) {
                return false;
            }
        }
        return true;
    }

    /**
     * Perform bitwise AND operation on the ByteArray with another ByteArray.
     * @param other The other ByteArray.
     * @return A new ByteArray that is the result of the bitwise AND operation.
     */
    public function _and(other:com.newgrounds.mtv129.io.ByteArray):com.newgrounds.mtv129.io.ByteArray {
        var result:com.newgrounds.mtv129.io.ByteArray = new com.newgrounds.mtv129.io.ByteArray();
        var len:Number = Math.min(this.length(), other.length());
        for (var i = 0; i < len; i++) {
            result.addByte(this.getByte(i)._and(other.getByte(i)));
        }
        return result;
    }

    /**
     * Perform bitwise OR operation on the ByteArray with another ByteArray.
     * @param other The other ByteArray.
     * @return A new ByteArray that is the result of the bitwise OR operation.
     */
    public function _or(other:com.newgrounds.mtv129.io.ByteArray):com.newgrounds.mtv129.io.ByteArray {
        var result:com.newgrounds.mtv129.io.ByteArray = new com.newgrounds.mtv129.io.ByteArray();
        var len:Number = Math.min(this.length(), other.length());
        for (var i = 0; i < len; i++) {
            result.addByte(this.getByte(i)._or(other.getByte(i)));
        }
        return result;
    }

    /**
     * Perform bitwise XOR operation on the ByteArray with another ByteArray.
     * @param other The other ByteArray.
     * @return A new ByteArray that is the result of the bitwise XOR operation.
     */
    public function _xor(other:com.newgrounds.mtv129.io.ByteArray):com.newgrounds.mtv129.io.ByteArray {
        var result:com.newgrounds.mtv129.io.ByteArray = new com.newgrounds.mtv129.io.ByteArray();
        var len:Number = Math.min(this.length(), other.length());
        for (var i = 0; i < len; i++) {
            result.addByte(this.getByte(i)._xor(other.getByte(i)));
        }
        return result;
    }

    /**
     * Perform bitwise NOT operation on the ByteArray.
     * @return A new ByteArray that is the result of the bitwise NOT operation.
     */
    public function _not():com.newgrounds.mtv129.io.ByteArray {
        var result:com.newgrounds.mtv129.io.ByteArray = new com.newgrounds.mtv129.io.ByteArray();
        for (var i = 0; i < this.length(); i++) {
            result.addByte(this.getByte(i)._not());
        }
        return result;
    }
}
