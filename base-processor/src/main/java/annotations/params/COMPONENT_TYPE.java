package annotations.params;

public enum COMPONENT_TYPE {
    HANDLER("handler", 1),
    DATA("data", 2),
    PERSISTENCE("persistence", 3),

    DISPATCHER("dispatcher", 4),

    SERVLET("servlet", 5);

    private int value = -1;
    private String name;

    COMPONENT_TYPE(String name, int value) {
        this.name = name;
        this.value = value;
    }

    public int getValue() {
        return value;
    }

    @Override
    public String toString() {
        return "COMPONENT_TYPE{" +
                "name='" + name + '\'' +
                '}';
    }
}
