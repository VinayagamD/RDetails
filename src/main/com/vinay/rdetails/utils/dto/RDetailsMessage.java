package main.com.vinay.rdetails.utils.dto;

/**
 * Created by Vinayagam on 10/19/15.
 */
public class RDetailsMessage {

    private String SuccessMessage;
    private String ErrorMessage;

    public String getSuccessMessage() {
        return SuccessMessage;
    }

    public void setSuccessMessage(String successMessage) {
        SuccessMessage = successMessage;
    }

    public String getErrorMessage() {
        return ErrorMessage;
    }

    public void setErrorMessage(String errorMessage) {
        ErrorMessage = errorMessage;
    }
}
