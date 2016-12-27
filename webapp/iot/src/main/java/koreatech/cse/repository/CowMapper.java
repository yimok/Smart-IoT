package koreatech.cse.repository;


import koreatech.cse.domain.Cow;
import koreatech.cse.domain.Searchable;
import koreatech.cse.domain.Searchable2;
import koreatech.cse.domain.User;
import koreatech.cse.repository.provider.UserSqlProvider;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CowMapper {


    @Select("SELECT * FROM CIN WHERE ri LIKE '%cow_1%' ORDER BY ri DESC limit 50")
    List<Cow> list50cow1();

    @Select("SELECT * FROM CIN WHERE ri LIKE '%cow_1%'")
    List<Cow> listcow1();


    @Select("SELECT * FROM CIN WHERE ri LIKE '%cow_2%' ORDER BY ri DESC limit 50")
    List<Cow> list50cow2();

    @Select("SELECT * FROM CIN WHERE ri LIKE '%cow_2%'")
    List<Cow> listcow2();


    //@formatter off
    @Select("<script>"
            + "SELECT * FROM CIN"
            + "<if test='name != null'> WHERE ri = #{RI}</if>"
            + "<if test='orderParam != null'>ORDER BY ${orderParam} DESC</if>"
            + "</script>")
    //@formatter on
    List<Cow> findByScript(Searchable2 searchable);

}
