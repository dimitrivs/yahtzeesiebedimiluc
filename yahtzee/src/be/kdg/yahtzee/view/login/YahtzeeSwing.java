package be.kdg.yahtzee.view.login;

import be.kdg.yahtzee.remoteObjects.YahtzeeController;
import be.kdg.yahtzee.remoteObjects.YahtzeeControllerServiceLocator;

import javax.swing.*;

public class YahtzeeSwing extends JFrame {

    public void setFrameTitle(String title) {
        this.setTitle(title);
    }

    protected static YahtzeeController findYahtzeeController() {
        YahtzeeControllerServiceLocator serviceLocator = new YahtzeeControllerServiceLocator();
        be.kdg.yahtzee.remoteObjects.YahtzeeController yahtzeeController = null;
        try {
            return yahtzeeController = serviceLocator.getyahtzee();
        } catch (javax.xml.rpc.ServiceException e) {
            e.printStackTrace();
        }
        return null;
    }
}
