package model;

public enum StatoOrdine {
	in_elaborazione,
	in_transito,
	consegnato;
	
	public static StatoOrdine fromString(String text) {
        for (StatoOrdine enumValue : StatoOrdine.values()) {
            if (enumValue.name().equalsIgnoreCase(text)) {
                return enumValue;
            }
        }
        throw new IllegalArgumentException("No constant with text " + text + " found in enum StatoOrdine");
    }
}
