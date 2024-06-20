package utilities;

public class StringEscapeUtil {

    // Metodo per eseguire l'escape di caratteri speciali in una stringa
    public static String escapeString(String input) {
        StringBuilder sb = new StringBuilder();
        for (char c : input.toCharArray()) {
            switch (c) {
                case '\'':
                    sb.append("\\'");
                    break;
                case '"':
                    sb.append("\\\"");
                    break;
                // Altri casi di escape secondo necessità
                default:
                    sb.append(c);
                    break;
            }
        }
        return sb.toString();
    }
}
