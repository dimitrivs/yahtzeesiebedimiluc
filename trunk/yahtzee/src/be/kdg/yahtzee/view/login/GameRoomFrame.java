/*
 * Project Software Development
 * Karel de Grote-Hogeschool
 * 2006-2007
 *
 */

package be.kdg.yahtzee.view.login;

import javax.swing.*;
import java.awt.*;
import java.util.ResourceBundle;

public class GameRoomFrame extends JFrame {
    private JLabel titletableLbl;
    private JTable gameTable;
    private JButton startBtn;
    private JButton joinBtn;
    private JButton profileBtn;
    private JButton logoutBtn;

    private JPanel titlePnl;
    private JPanel gameSummaryPnl;
    private JPanel buttonPnl;
    private JPanel gamePnl;

    private ResourceBundle resources;

    public GameRoomFrame(String title) {
        super(title);

        resources = ResourceBundle.getBundle("bundles.resources");

        makeComponents();
        makeLayout();
        addListeners();
        showFrame();

    }

    private void makeComponents() {
        String titletableString = resources.getString("roomTitle");
        String startString = resources.getString("roomStart");
        String joinString = resources.getString("roomJoin");
        String profileString = resources.getString("roomProfile");
        String logoutString = resources.getString("logout");

        titletableLbl = new JLabel(titletableString);
        startBtn = new JButton(startString);
        joinBtn = new JButton(joinString);
        profileBtn = new JButton(profileString);
        logoutBtn = new JButton(logoutString);

        gameTable = new JTable(10, 4);

        titlePnl = new JPanel();
        gameSummaryPnl = new JPanel();
        buttonPnl = new JPanel();
        gamePnl = new JPanel();
    }

    private void makeLayout() {
        Container content = this.getContentPane();

        titlePnl.add(titletableLbl);

        buttonPnl.setLayout(new GridLayout(4, 1, 3, 3));
        buttonPnl.add(startBtn);
        buttonPnl.add(joinBtn);
        buttonPnl.add(profileBtn);
        buttonPnl.add(logoutBtn);

        gamePnl.add(gameTable);

        gameSummaryPnl.add(gamePnl, BorderLayout.CENTER);
        gameSummaryPnl.add(buttonPnl, BorderLayout.EAST);

        content.add(titlePnl, BorderLayout.NORTH);
        content.add(gameSummaryPnl, BorderLayout.CENTER);
    }

    private void addListeners() {

    }

    private void showFrame() {
        setDefaultCloseOperation(EXIT_ON_CLOSE);
        setSize(600, 400);
        Dimension d = this.getToolkit().getScreenSize();
        setLocation((d.width - this.getSize().width) / 2, (d.height - this.getSize().height) / 2);
        pack();
        setVisible(true);
        setResizable(false);
    }


}