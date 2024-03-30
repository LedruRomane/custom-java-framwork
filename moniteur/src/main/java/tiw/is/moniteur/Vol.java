package tiw.is.moniteur;

public record Vol(String companie, String id) {
    public static Vol fromBagage(Bagage bagage) {
        return new Vol(bagage.companie(), bagage.vol());
    }
}
