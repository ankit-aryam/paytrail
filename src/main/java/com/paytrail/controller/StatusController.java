package com.paytrail.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class StatusController {

    public record StatusResponse(String service, String status){}

    @GetMapping("/api/v1/status")
    public StatusResponse getStatus(){
        return new StatusResponse("paytrail", "UP");
    }

}
