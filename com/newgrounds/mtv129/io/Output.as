import com.newgrounds.mtv129.io.ByteArray;
import com.newgrounds.mtv129.io.Byte;

/**
 * Class for output binary data
 */
class com.newgrounds.mtv129.io.Output {
	/**
	 * Class for output binary data
	 */	
    private var byteArray:ByteArray;

    /**
     * Constructor for the Output class.
     * @param byteArray The ByteArray to write to.
     */
    function Output(byteArray:ByteArray) {
        this.byteArray = byteArray;
    }

    /**
     * Write a single Byte to the output.
     * @param byte The Byte to write.
     */
    public function writeByte(byte:com.newgrounds.mtv129.io.Byte):Void {
        byteArray.addByte(byte);
    }

    /**
     * Write a sequence of Bytes to the output.
     * @param bytes The array of Bytes to write.
     */
    public function writeBytes(bytes:Array):Void {
        for (var i = 0; i < bytes.length; i++) {
            writeByte(bytes[i]);
        }
    }

    /**
     * Write an integer to the output.
     * @param value The integer value to write.
     */
    public function writeInt(value:Number):Void {
        writeByte(new com.newgrounds.mtv129.io.Byte((value >> 24) & 0xFF));
        writeByte(new com.newgrounds.mtv129.io.Byte((value >> 16) & 0xFF));
        writeByte(new com.newgrounds.mtv129.io.Byte((value >> 8) & 0xFF));
        writeByte(new com.newgrounds.mtv129.io.Byte(value & 0xFF));
    }

    /**
     * Write a string to the output.
     * @param value The string value to write.
     */
    public function writeString(value:String):Void {
        for (var i = 0; i < value.length; i++) {
            writeByte(new com.newgrounds.mtv129.io.Byte(value.charCodeAt(i) & 0xFF));
        }
    }

    /**
     * Write a boolean to the output.
     * @param value The boolean value to write.
     */
    public function writeBoolean(value:Boolean):Void {
        writeByte(new com.newgrounds.mtv129.io.Byte(value ? 1 : 0));
    }
}
