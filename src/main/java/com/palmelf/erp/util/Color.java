package com.palmelf.erp.util;

/**
 *
 */
public enum Color {
    BLACK("黑色", "B"), RED("红色", "R"), WHITE("白色", "W"), YELLO("黄色", "Y"),BLUE("蓝色","B"),GREEN("绿色","G"),GRAY("灰色","GR"),BEIGE("米色","BE"),PINK("粉色","P"),
    APRICOT("杏色","A"),PURPLE("紫色","PU"),ORANGE("橘色","O"),SILVER("银色","S"),COFFEE("咖啡色",""),BROWN("棕色","BR"),BLACK_WHITE("黑白条纹","BW"),ROSE_RED("玫红色","RR"),
    LAKE_BLUE("湖蓝色","LB"),PASTEL_PINK("淡粉色","PP"), DARK_BROWN("深棕色","DBR"), DARK_GRAY("深灰色","DGR"),SKYBLUE("天蓝色","SB"),WHEAT("土黄色","WH"),GOLD("金色","GO"),
    DARK_BLUE("深蓝色","DBL"),LIGHT_BLUE("浅蓝色",""),KHAKI("卡其","K"),CAMEL("驼色","CA"),WINE_RED("酒红色","WR"),WATERMELON_RED("西瓜红","WRE"),DARK_RED("枣红色","DR"),
    NAVY_BLUE("藏青色","NB"),ARMY_GREEN("军绿色","AG"),ORANGE_RED("橘红","OR"),ROSE_GOLD("玫瑰金","RG"),NUDE("裸色","N"),RED_BLACK("红黑","RB"),RED_BLUE("红蓝","RBL"),
    RED_WHITE("红白","RW"),BEIGE_WHITE("米白","BEW"),BLUE_WHEIT("蓝白","BLW"),	DARK_GREEN("墨绿色","DG"),GRADIENT_PURPLE("渐变紫","GPU"),GRADIENT_BLUE("渐变蓝","GBL" ),
    GRADIENT_PINK("渐变粉","GP");
    private String name ;
    private String simplified ;

    private Color( String name , String simplified ){
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
