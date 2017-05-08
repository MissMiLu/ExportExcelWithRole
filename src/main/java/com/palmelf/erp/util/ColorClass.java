package com.palmelf.erp.util;

/**
 *Class for Color
 */
public class ColorClass {
    private String name ;
    private String simplified ;
    public ColorClass( String name , String simplified ){
        this.name = name ;
        this.simplified = simplified ;
    }

    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }

    public String getSimplified() {
        return simplified;
    }
    public void setSimplified(String simplified) {
        this.simplified = simplified;
    }
}
