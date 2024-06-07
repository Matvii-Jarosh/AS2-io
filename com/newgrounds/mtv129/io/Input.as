import com.newgrounds.mtv129.io.ByteArray;
import com.newgrounds.mtv129.io.Byte;

/**
 * Class for input binary data
 */
class com.newgrounds.mtv129.io.Input {
	/**
	 * Class for output binary data
	 */
    private var byteArray:ByteArray;
	/**
	 * Current position in reading data
	 */
    private var currentPosition:Number;

    /**
     * Constructor for the Input class.
     * @param byteArray The ByteArray to read from.
     */
    function Input(byteArray:ByteArray) {
        this.byteArray = byteArray;
        this.currentPosition = 0;
    }

    /**
     * Read a single Byte from the input.
     * @return The Byte read from the input.
     */
    public function readByte():com.newgrounds.mtv129.io.Byte {
        if (currentPosition < byteArray.length()) {
            var byte:com.newgrounds.mtv129.io.Byte = byteArray.getByte(currentPosition);
            currentPosition++;
            return byte;
        }
        return null;
    }

    /**
     * Read a sequence of Bytes from the input.
     * @param length The number of Bytes to read.
     * @return An array of Bytes read from the input.
     */
    public function readBytes(length:Number):Array {
        var bytes:Array = new Array();
        for (var i = 0; i < length; i++) {
            var byte:com.newgrounds.mtv129.io.Byte = readByte();
            if (byte != null) {
                bytes.push(byte);
            } else {
                break;
            }
        }
        return bytes;
    }

    /**
     * Read an integer from the input.
     * @return The integer read from the input.
     */
    public function readInt():Number {
        var byte1:com.newgrounds.mtv129.io.Byte = readByte();
        var byte2:com.newgrounds.mtv129.io.Byte = readByte();
        var byte3:com.newgrounds.mtv129.io.Byte = readByte();
        var byte4:com.newgrounds.mtv129.io.Byte = readByte();
        if (byte1 != null && byte2 != null && byte3 != null && byte4 != null) {
            return (byte1.getValue() << 24) | (byte2.getValue() << 16) | (byte3.getValue() << 8) | byte4.getValue();
        }
        return 0;
    }

    /**
     * Read a string from the input.
     * @param length The length of the string to read.
     * @return The string read from the input.
     */
    public function readString(length:Number):String {
        var str:String = "";
        for (var i = 0; i < length; i++) {
            var byte:com.newgrounds.mtv129.io.Byte = readByte();
            if (byte != null) {
                str += String.fromCharCode(byte.getValue());
            } else {
                break;
            }
        }
        return str;
    }

    /**
     * Read a boolean from the input.
     * @return The boolean value read from the input.
     */
    public function readBoolean():Boolean {
        var byte:com.newgrounds.mtv129.io.Byte = readByte();
        if (byte != null) {
            return byte.getValue() != 0;
        }
        return false;
    }
	
	/**
     * Skip a specified number of bytes in the input.
     * @param bytesToSkip The number of bytes to skip.
     */
    public function skip(bytesToSkip:Number):Void {
        currentPosition += bytesToSkip;
        if (currentPosition > byteArray.length()) {
            currentPosition = byteArray.length();
        }
    }
}
