package com.kbstar.controller;

import com.fasterxml.jackson.annotation.JsonAlias;
import com.kbstar.dto.ItemDTO;
import org.json.simple.JSONArray;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

@Controller
@RequestMapping("/dashboard")
public class DashboardController {

    @RequestMapping("")
    public String main(Model model) {
        model.addAttribute("center", "dashboard");
        return "index";
    };
    }


