package llhh2007.edu.Validation;

import llhh2007.edu.annotation.Phone;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

public class PhoneValidator implements ConstraintValidator<Phone, String> {
    public void initialize(Phone paramA) {
    }
    public boolean isValid(String phoneNo, ConstraintValidatorContext ctx) {
        if (phoneNo == null) {
            return false;
        }
        return phoneNo.matches("(84|0[3|5|7|8|9])+([0-9]{8})\\b");
    }
}
