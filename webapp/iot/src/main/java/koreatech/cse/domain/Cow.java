package koreatech.cse.domain;

public class Cow {
    private String RI;
    private String cr ;
    private String cnf ;
    private String cs;
    private String or;
    private String con;

    @Override
    public String toString() {
        return "{" +
                "\"RI\":\"" + RI + '\"' +
                ", \"cr\":\"" + cr + '\"' +
                ", \"cnf\":\"" + cnf + '\"' +
                ", \"cs\":\"" + cs + '\"' +
                ", \"or\":\"" + or + '\"' +
                ", \"con\":\"" + con + '\"' +
                '}';
    }

    public String getRI() {
        return RI;
    }

    public void setRI(String RI) {
        this.RI = RI;
    }

    public String getCr() {
        return cr;
    }

    public void setCr(String cr) {
        this.cr = cr;
    }

    public String getCnf() {
        return cnf;
    }

    public void setCnf(String cnf) {
        this.cnf = cnf;
    }

    public String getCs() {
        return cs;
    }

    public void setCs(String cs) {
        this.cs = cs;
    }

    public String getOr() {
        return or;
    }

    public void setOr(String or) {
        this.or = or;
    }

    public String getCon() {
        return con;
    }

    public void setCon(String con) {
        this.con = con;
    }
}
