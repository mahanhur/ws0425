package com.kbstar.controller;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Random;

@RestController
public class DashboardImplController {

    @RequestMapping("/dashboard01")
    public Object db01() {
        JSONArray ja = new JSONArray();
        for(int i=0; i<=106;i++){
            Random r = new Random();
            int num = r.nextInt(25000)+1;
            ja.add(num);
        };
        return ja;
    };
    @RequestMapping("/dashboard03")
    public Object dashboard03() {
        JSONArray ja = new JSONArray();
        String[] a = {"Chrome", "Edge", "Firefox", "Safari", "Internet Explorer", "Other"};
        for (int i = 0; i <= 5; i++) {
            JSONObject jo = new JSONObject();
            Random r = new Random();
            int num = r.nextInt(10);
            jo.put("name", a[i]);
            jo.put("y", num);
            ja.add(jo);
        }
        return ja;
    };
    @RequestMapping("/dashboard04")
    public Object dashboard04() {
        JSONArray ja1 = new JSONArray();
        String[] EU = {"Germany",
                "Belgium",
                "Czech Republic",
                "Netherlands",
                "Spain",
                "Ukraine",
                "Poland",
                "French",
                "United Kingdom",
                "Turkey"};
        String[] AFRICA = {"Senegal",
                "Cameroon",
                "Zimbabwe",
                "Ghana",
                "Kenya",
                "Sudan",
                "Tunisia",
                "Angola",
                "Libya",
                "Ivory Co"};
        String[] NA = {"Costa Rica",
                "Honduras",
                "Jamaica",
                "Panama",
                "Guatemala",
                "Dominican Republic",
                "Cuba",
                "USA",
                "Canada",
                "Mex"};
        String[] SA = {"El Salvador",
                "Uruguay",
                "Bolivia",
                "Trinidad and Tobago",
                "Ecuador",
                "Chile",
                "Peru",
                "Colombia",
                "Brazil",
                "Argent"};
        String[] ASIA= {"Nepal",
                "Georgia",
                "Brunei Darussalam",
                "Kyrgyzstan",
                "Japan",
                "China",
                "India",
                "Russia",
                "Iran",
                "Korea"};
        String[] conti= {"EU", "AFRICA", "NA", "SA", "ASIA"};

        JSONObject jo2 = new JSONObject();
        for(int s=1;s<=5;s++) {
            JSONArray ja2 = new JSONArray();
            for (int i = 0; i <= 9; i++) {
                JSONObject jo1 = new JSONObject();
                Random r = new Random();
                int num = r.nextInt(100);
                jo1.put("name", conti[s][i]);
                jo1.put("value", num);
                ja2.add(jo1);
            }
            jo2.put("name", conti[s]);
            jo2.put("data",ja2);
        }
        ja1.add(jo2);
        return ja1;
    };

    }


