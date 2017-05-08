package com.palmelf.erp.util;

/**
 *
 */
public enum Size {
    XS("XS"), S("S"),M("M"),L("L"),XL("XL"),XXL("XXL"),threeXL("3XL"),fourXL("4XL"),fiveXL("5XL"),sixXL("6XL");

    private String value ;

    private Size( String value ){
        this.value = value ;
    }
    public String getValue() {
        return value;
    }
    public void setValue(String value) {
        this.value = value;
    }

}
