package util;

import java.io.UnsupportedEncodingException;

public class MyUTF {
    public static String getNewString(String str)throws UnsupportedEncodingException{
        return new String(str.getBytes("ISO-8859-1"), "UTF-8");
    }
}
