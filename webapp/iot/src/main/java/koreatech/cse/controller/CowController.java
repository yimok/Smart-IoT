package koreatech.cse.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import koreatech.cse.domain.*;
import koreatech.cse.repository.CowMapper;
import koreatech.cse.repository.UserMapper;
import koreatech.cse.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.inject.Inject;
import java.util.ArrayList;
import java.util.List;

@Controller

@RequestMapping("/cow")
public class CowController {
    @Inject
    private CowMapper cowMapper;

    @RequestMapping(value = "/01list", method = RequestMethod.GET)
    public String list01(Model model) {

        List<Cow> cow1 = new ArrayList<Cow>();
        List<Cow> cow2 = new ArrayList<Cow>();
        cow1 = cowMapper.listcow1();
        cow2 = cowMapper.listcow2();
        String temp;
        String[] array;
        double cowtempavg=0;
        double tempavg=0;
        double tempsum=0;
        double cowtempsum=0;


        int count = 0;
        for(Cow row : cow1)
        {
            temp = row.getCon();
            array= temp.split(":");



            cowtempsum = cowtempsum + Double.parseDouble(array[1].substring(0,5));
            tempsum = tempsum + Double.parseDouble(array[1].substring(6,11));

            count++;


        }

        cowtempavg = cowtempsum / count;
        tempavg= tempsum / count ;


      //  System.out.println(cowtempavg);
       // System.out.println(tempavg);


        cowtempsum = 0;
        tempsum = 0;
        count = 0;

        for(Cow row : cow2)
        {
            temp = row.getCon();
            array= temp.split(":");


            System.out.println(array[1].substring(0,5));
            System.out.println(array[1].substring(6,11));
            System.out.println(array[1].substring(12,13));

            cowtempsum = cowtempsum + Double.parseDouble(array[1].substring(0,5));
            tempsum = tempsum + Double.parseDouble(array[1].substring(6,11));
            count++;
        }
        cowtempavg =(cowtempavg + (cowtempsum / count))/2;
        tempavg= (tempavg + (tempsum / count))/2 ;

      //  System.out.println(cowtempavg);
      //  System.out.println(tempavg);
        model.addAttribute("cowtempavg", cowtempavg);
        model.addAttribute("tempavg", tempavg);

        model.addAttribute("cow", cowMapper.list50cow1());




        return "hello";
    }

    @RequestMapping(value = "/02list", method = RequestMethod.GET)
    public String list02(Model model) {


        List<Cow> cow1 = new ArrayList<Cow>();
        List<Cow> cow2 = new ArrayList<Cow>();
        cow1 = cowMapper.listcow1();
        cow2 = cowMapper.listcow2();
        String temp;
        String[] array;
        double cowtempavg=0;
        double tempavg=0;
        double tempsum=0;
        double cowtempsum=0;
        int count = 0;
        for(Cow row : cow1)
        {
            temp = row.getCon();
            array= temp.split(":");

            /*
            System.out.println(array[1].substring(0,5));
            System.out.println(array[1].substring(6,11));
            System.out.println(array[1].substring(12,13));
            */
            cowtempsum = cowtempsum + Double.parseDouble(array[1].substring(0,5));
            tempsum = tempsum + Double.parseDouble(array[1].substring(6,11));
            count++;
        }

        cowtempavg = cowtempsum / count;
        tempavg= tempsum / count ;

        cowtempsum = 0;
        tempsum = 0;
        count = 0;

        for(Cow row : cow2)
        {
            temp = row.getCon();
            array= temp.split(":");
            cowtempsum = cowtempsum + Double.parseDouble(array[1].substring(0,5));
            tempsum = tempsum + Double.parseDouble(array[1].substring(6,11));
            count++;
        }
        cowtempavg =(cowtempavg + (cowtempsum / count))/2;
        tempavg= (tempavg + (tempsum / count))/2 ;

        model.addAttribute("cowtempavg", cowtempavg);
        model.addAttribute("tempavg", tempavg);



        model.addAttribute("cow", cowMapper.list50cow2());
        System.out.println(cowMapper.list50cow2());



        // model.addAttribute("users", cowMapper.findByScript(searchable));
        return "hello3";
    }


    @RequestMapping(value = "/alllist", method = RequestMethod.GET)
    public String alllist(Model model) {

        List<Cow> cow1 = new ArrayList<Cow>();
        List<Cow> cow2 = new ArrayList<Cow>();
        cow1 = cowMapper.listcow1();
        cow2 = cowMapper.listcow2();
        String temp;
        String[] array;
        double cowtempavg=0;
        double tempavg=0;
        double tempsum=0;
        double cowtempsum=0;
        int count = 0;
        for(Cow row : cow1)
        {
            temp = row.getCon();
            array= temp.split(":");

            /*
            System.out.println(array[1].substring(0,5));
            System.out.println(array[1].substring(6,11));
            System.out.println(array[1].substring(12,13));
            */
            cowtempsum = cowtempsum + Double.parseDouble(array[1].substring(0,5));
            tempsum = tempsum + Double.parseDouble(array[1].substring(6,11));
            count++;
        }

        cowtempavg = cowtempsum / count;
        tempavg= tempsum / count ;

        cowtempsum = 0;
        tempsum = 0;
        count = 0;

        for(Cow row : cow2)
        {
            temp = row.getCon();
            array= temp.split(":");
            cowtempsum = cowtempsum + Double.parseDouble(array[1].substring(0,5));
            tempsum = tempsum + Double.parseDouble(array[1].substring(6,11));
            count++;
        }
        cowtempavg =(cowtempavg + (cowtempsum / count))/2;
        tempavg= (tempavg + (tempsum / count))/2 ;

        model.addAttribute("cowtempavg", cowtempavg);
        model.addAttribute("tempavg", tempavg);




        //전체 리스트
       model.addAttribute("cow", cowMapper.listcow1());
        model.addAttribute("cow2", cowMapper.listcow2());





        return "hello2";
    }

}
