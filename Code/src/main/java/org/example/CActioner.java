package org.example;

import java.util.Date;

public class CActioner {
    private ECampaign theECampaign;

    public CActioner(ECampaign eCampaign) {
        theECampaign = eCampaign;
    }

    public int getTickets() {
        return theECampaign.computeTicketsSold();
    }

    public Date getCampaignClone() {
        return theECampaign.getDateClose();
    }
}
