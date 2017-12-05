package my.training.motivwbs.utils;

import org.springframework.stereotype.Component;

import java.text.ParseException;
import java.text.SimpleDateFormat;

@Component
public class ValidateDateFormat {

    public boolean isValidDate(String input) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("mm/dd/yyyy");
        try {
            dateFormat.parse(input);
            return true;
        } catch (ParseException e) {
            return false;
        }
    }
}
