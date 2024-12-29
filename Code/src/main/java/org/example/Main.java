package org.example;

import java.util.Date;
import java.util.Scanner;

abstract class ECampaign {
    protected Date dateClose;

    public Date getDateClose() {
        return dateClose;
    }

    public int computeTicketsSold() {
        return computeTicketsLeft();
    }

    protected abstract int computeTicketsLeft();
}

class EBonusCampaign extends ECampaign {
    private int numTickets;
    private int numTicketsSold;

    public EBonusCampaign(int numTickets, int numTicketsSold, Date dateClose) {
        this.numTickets = numTickets;
        this.numTicketsSold = numTicketsSold;
        this.dateClose = dateClose;
    }

    @Override
    protected int computeTicketsLeft() {
        return numTickets - numTicketsSold;
    }

    @Override
    public Date getDateClose() {
        if (super.getDateClose().before(dateClose)) {
            return dateClose;
        } else {
            return super.getDateClose();
        }
    }
}

public class Main {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.println("请输入总票数和已售票数：");
        int numTickets = scanner.nextInt();
        int numTicketsSold = scanner.nextInt();

        System.out.println("请输入彩票活动截止日期（格式：yyyy.MM.dd）：");
        String dateInput = scanner.next();
        java.text.SimpleDateFormat dateFormat = new java.text.SimpleDateFormat("yyyy.MM.dd");
        try {
            Date dateCloseECampaign = dateFormat.parse(dateInput);
            Date dateCloseEBonusCampaign = new Date(dateCloseECampaign.getTime() + 4 * 24 * 60 * 60 * 1000); // 假设EBonusCampaign的截止日期比ECampaign晚4天

            EBonusCampaign eBonusCampaign = new EBonusCampaign(numTickets, numTicketsSold, dateCloseEBonusCampaign);
            CActioner actioner = new CActioner(eBonusCampaign);

            int remainingTickets = actioner.getTickets();
            Date closingDate = actioner.getCampaignClone();

            System.out.println("剩余票数：" + remainingTickets);
            System.out.println("销售活动结束的正确日期：" + dateFormat.format(closingDate));

        } catch (Exception e) {
            e.printStackTrace();
        }

        scanner.close();
    }
}