package model;

public enum ProductCategorie {
	none,
	classici,
	aromatizzati;
	
	
	public static ProductCategorie fromString(String text) {
        for (ProductCategorie enumValue : ProductCategorie.values()) {
            if (enumValue.name().equalsIgnoreCase(text)) {
                return enumValue;
            }
        }
        throw new IllegalArgumentException("No constant with text " + text + " found in enum ProductCategorie");
    }
}
