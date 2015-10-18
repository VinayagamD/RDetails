package main.com.vinay.rdetails.utils.rdetailsutils;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by Vinayagam on 10/17/15.
 */
public class RDetailsUtils {

    public static boolean checkEmptyString(String data){
        return (data == null || data.isEmpty() || data.equals("null"));
    }

    public static boolean isValidateEmail(String data) {
        Pattern emailPattern = Pattern.compile(RDetailsConstants.EMAIL_ID_PATTERN);
        Matcher emailMatcher = emailPattern.matcher(data);
        return emailMatcher.matches();
    }

    public static boolean dataLength(String data,UserDataLength userDataLength){
       switch (userDataLength){
           case USER_NAME:
               return  data.length()<4;
           case PASSWORD:
               return data.length()<6;
       }
        return false;
    }

}
